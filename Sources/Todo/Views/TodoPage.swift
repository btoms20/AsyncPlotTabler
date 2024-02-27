import AsyncPlotTabler

/// A page with a Todo List that can be interacted with
struct TodoPage: Component {
    /// A list of Todo items to display
    let todos:[Todo]
    /// Feedback to give to the user in the form of an error
    let feedback:String?
    
    /// Initializes a new Todo Page with a Header, NavBar and a Todo List
    /// - Parameters:
    ///   - todos: An array of Todo items to render / display to the user
    ///   - feedback: An error to display to the user (useful for Form validation feedback)
    public init(todos: [Todo], feedback: String? = nil) {
        self.todos = todos
        self.feedback = feedback
    }
    
    func body() async -> Component {
        // Because we only have one page in our entire website, we'll configure the Site here
        // Normally you'd configure the Site elsewhere and `inject` each Page into it as the user navigates throughout the website
        await Site(
            // A Site has a NavBar that can be configured
            header: NavBar(
                // The Brand is a great place for your Websites name and Logo
                brand: .init(title: "Todo List Demo"),
                // Routes takes an array of RouteItems linking to various pages in your Website
                routes: [
                    .init(title: "Home", url: "/todos", icon: .home, active: true),
                ],
                // This determines if the Notification bell is present on the right hand side of the NavBar
                notificationsEnabled: false,
                // This determines if the search box is present
                searchEnabled: false
            ),
            // The actual contents of your Page (everything below the navbar
            page: Page(header: .init(header: "TODOs"), content: {
                // Similar to a VStack is SwiftUI, a CardVStack makes it easy to stack/position multiple cards
                await CardVStack {
                    // A Card is a styled Div that makes it easy to format content
                    // Every Card can have a Header, Body and Footer section
                    await Card(
                        // Let's give the card a title
                        header: .init({
                            Card.Title("Your Todo List")
                        }),
                        // In the body of the card we'll display each of our Todo Items
                        body: .raw({
                            // We can place the Todo items in a ListGroup to give them a nicer look and embed them in a scroll view
                            // ListGroups support grouping your ListItems into groups with titles, lets do that here
                            // We'll group the Todo's into two groups `Completed` and `Outstanding`
                            await Plot.Form.ListGroup(theme: .flush, scrollable: true, hoverable: true, groupedItems: todos.sortAndGroup.asyncMap { todoGroup in
                                await .init(label: todoGroup.0 ? "Completed" : "Outstanding", items: todoGroup.1.sortedByCreationDate.asyncCompactMap { todo in
                                    await TodoListItem(todo: todo)
                                })
                            })
                        }),
                        // The footer of this card is a great place to add a TextField and a `Create Todo` button for todo creation
                        footer: .init({
                            // We wrap the TextField in a Form to capture the user input
                            Form(url: "/todos", method: .post, contentType: .multipartData, enableValidation: false) {
                                // Placing our TextField and Button in an InputGroup styles them as one feature
                                await Plot.Form.InputGroup {
                                    Plot.Form.Textfield(name: "title", placeholder: "New todo item...")
                                        .class(feedback == nil ? "" : "is-invalid")
                                    ButtonLink(type: .submit, text: "Create Todo")
                                }
                                .class("w-100")
                                
                                // If we have feedback for the user... display it here
                                if let feedback {
                                    Span {
                                        SVGIcon(icon: .exclamation_circle, color: .red, size: .xs)
                                            .margin(.trailing(2))
                                        Text("\(feedback)")
                                    }
                                    .textColor(.red)
                                    .fontWeight(.light)
                                }
                            }
                        })
                    )
                }
            })
        )
    }
    
    /// An individual Todo Item's Cell
    private func TodoListItem(todo: Todo) async -> Form.ListGroup.Item? {
        // Ensure this Todo Item has an ID
        guard let id = todo.id else { return nil }
        // Construct the rootURL for this Todo Item
        let rootURL = "/todos/\(id.uuidString)"
        // Let's contruct and return the ListGroup.Item
        return await Form.ListGroup.Item(link: "#") {
            await Row(alignItemsCenter: true) {
                // One segment for the Checkbox, Title and Date Created
                await Column {
                    // Lets wrap each Todo item cell in a Form so that we can respond to Checkbox events
                    Plot.Form(url: "\(rootURL)/toggle", method: .get, contentType: .none, enableValidation: false) {
                        await Plot.Form.Checkbox(name: "todo-\(id.uuidString)", checked: todo.done, required: false, triggersFormOnCheck: true, label: {
                            Text(todo.title)
                        }, description: {
                            Text("\(todo.createdAt?.formatted() ?? "\(id.uuidString)")")
                        })
                    }
                }
                // And another segment to hold our Delete button
                await Column {
                    Link(url: "\(rootURL)/delete") { SVGIcon(icon: .trash, color: .red) }
                        .class("list-group-item-actions")
                }
                .class("col-auto")
            }
        }
    }
}
