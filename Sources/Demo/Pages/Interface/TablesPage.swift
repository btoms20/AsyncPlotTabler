import AsyncPlotTabler

/// Tables Demo Page
struct TablesPage: Component {
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(header: .init(header: "Tables"), content: {
            await CardVStack {
                await CardHStack {
                    await CardTable(
                        size: .large(.num(8)),
                        table: Tables(style: .regular, editable: true, items: TestUser.mockData)
                    )
                    
                    await Card(
                        body: .init({
                            Card.Title("Top Pages")
                            await Tables(style: .smallBorderless, items: TestPageCount.mockData)
                        })
                    )
                }
                
                await CardTable(table: Tables(style: .striped, editable: true, items: Array(TestUser.mockData.prefix(5))))
                
                await CardTable(table: Tables(style: .regular, editable: true, items: Array(TestUserFancy.mockData.prefix(5))))
                
                //CardTable(table: Tables(style: .regular, editable: true, items: TestUser.mockData))
                
                await Card(
                    header: .init({
                        Card.Title("Invoices")
                    }),
                    body: .init({
                        await DivC("d-flex") {
                            await DivC("text-secondary") {
                                Text("Show")
                                await DivC("mx-2 d-inline-block") {
                                    Plot.Input(type: .text)
                                        .class("form-control form-control-sm")
                                        .attribute(named: "value", value: "8")
                                        .attribute(named: "size", value: "3")
                                        .attribute(named: "aria-label", value: "Invoices count")
                                }
                                Text("entries")
                            }
                            await DivC("ms-auto text-secondary") {
                                Text("Search:")
                                await DivC("ms-2 d-inline-block") {
                                    Plot.Input(type: .text)
                                        .class("form-control form-control-sm")
                                        .attribute(named: "aria-label", value: "Search invoices")
                                }
                            }
                        }
                    }),
                    table: Tables(style: .regular, editable: true, items: TestUserFancy.mockData),
                    footer: .init({
                        // Entries Currently Visible
                        Paragraph{
                            Text("Showing ")
                            await Span("1")
                            Text(" to ")
                            await Span("8")
                            Text(" of ")
                            await Span("16")
                            Text(" entries")
                        }.class("m-0 text-secondary")
                        
                        // Pagination
                        Pagination(textLabels: true, currentPage: 1, totalPages: 2)
                            .class("m-0 ms-auto")
                        
                    }, class: "d-flex align-items-center")
                )
            }
        }))
    }
}

/// Mock Data
fileprivate struct TestUser:KeyedComponentGroup {
    let name:String
    let title:String
    let email:String
    let role:String
    
    func keyed() async -> [AsyncPlotTabler.KeyedComponent] {
        [
            .init(key: "name",  component: Text(name)),
            .init(key: "title", component: Text(title)),
            .init(key: "email", component: Text(email)),
            .init(key: "role",  component: Text(role)),
        ]
    }
    
    static let mockData:[TestUser] = [
        TestUser(name: "Pawel Kuna", title: "UI Designer, Training", email: "pawelkuna@howstuffworks.com", role: "User"),
        TestUser(name: "Jeffie Lewzey", title: "Chemical Engineer, Support", email: "jlewzey1@seesaa.net", role: "Admin"),
        TestUser(name: "Mallory Hulme", title: "Geologist IV, Support", email: "mhulme2@domainmarket.com", role: "User"),
        TestUser(name: "Dunn Slane", title: "Research Nurse, Sales", email: "dslane3@epa.gov", role: "Owner"),
        TestUser(name: "Emmy Levet", title: "VP Product Management, Accounting", email: "elevet4@senate.gov", role: "Admin"),
        TestUser(name: "Maryjo Lebarree", title: "Civil Engineer, Product Management", email: "mlebarree5@unc.edu", role: "User"),
        TestUser(name: "Egan Poetz", title: "Research Nurse, Engineering", email: "epoetz6@free.fr", role: "Admin"),
        TestUser(name: "Kellie Skingley", title: "Teacher, Services", email: "kskingley7@columbia.edu", role: "Owner")
    ]
}

fileprivate struct TestPageCount:KeyedComponentGroup {
    let url:String
    let visitors:Int
    let totalVisitors:Int
    
    var fraction:Double {
        Double(self.visitors) / Double(self.totalVisitors)
    }
    
    var percent:Double {
        fraction * 100
    }
    
    func keyed() async -> [AsyncPlotTabler.KeyedComponent] {
        await [
            .init(key: "page") {
                await DivC("progressbg") {
                    await DivC("progress progressbg-progress") {
                        await DivC("progress-bar bg-primary-lt") {
                            await Span(Text("\(percent)% Complete")).class("visually-hidden")
                        }
                        .style("width: \(percent)%")
                        .attribute(named: "role", value: "progressbar")
                        .attribute(named: "aria-valuenow", value: "\(percent)")
                        .attribute(named: "aria-valuemin", value: "0")
                        .attribute(named: "aria-valuemax", value: "100")
                        .attribute(named: "aria-label", value: "\(percent)% Complete")
                    }
                    await DivC("progressbg-text") {
                        Text(url)
                    }
                }
            },
            await .init(key: "visitors") {
                Text("\(visitors)")
            }
        ]
    }
    
    static let mockData:[TestPageCount] = [
        TestPageCount(url: "/", visitors: 4896, totalVisitors: 5000),
        TestPageCount(url: "/form-elements.html", visitors: 3652, totalVisitors: 5000),
        TestPageCount(url: "/index.html", visitors: 3256, totalVisitors: 5000),
        TestPageCount(url: "/icons.html", visitors: 986, totalVisitors: 5000),
        TestPageCount(url: "/docs", visitors: 912, totalVisitors: 5000),
        TestPageCount(url: "/accordion.html", visitors: 855, totalVisitors: 5000),
        TestPageCount(url: "/datagrid.html", visitors: 764, totalVisitors: 5000),
        TestPageCount(url: "/datatables.html", visitors: 686, totalVisitors: 5000),
    ]
}

fileprivate struct TestUserFancy:KeyedComponentGroup {
    let name:String
    let title:String
    let department:String
    let email:String
    let role:String
    
    func keyed() async -> [AsyncPlotTabler.KeyedComponent] {
        await [
            KeyedComponent(key: "name") {
                await DivC("d-flex py-1 align-items-center") {
                    Avatar(size: .md, .text(name.initials)).class("me-3")
                    await DivC("flex-fill") {
                        await DivC("font-weight-medium") { Text(name) }
                        await DivC("text-secondary") { Link(url: "#") { Text(email) }.class("text-reset") }
                    }
                }
            },
            KeyedComponent(key: "title") {
                await ComponentGroup {
                    Div { Text(title) }.class("text-dark")
                    Div { Text(department) }.class("text-secondary")
                }
            },
            KeyedComponent(key: "role",  component: Text(role))
        ]
    }
    
    static let mockData:[TestUserFancy] = [
        TestUserFancy(name: "Pawel Kuna", title: "UI Designer", department: "Training", email: "pawelkuna@howstuffworks.com", role: "User"),
        TestUserFancy(name: "Jeffie Lewzey", title: "Chemical Engineer", department: "Support", email: "jlewzey1@seesaa.net", role: "Admin"),
        TestUserFancy(name: "Mallory Hulme", title: "Geologist IV", department: "Support", email: "mhulme2@domainmarket.com", role: "User"),
        TestUserFancy(name: "Dunn Slane", title: "Research Nurse", department: "Sales", email: "dslane3@epa.gov", role: "Owner"),
        TestUserFancy(name: "Emmy Levet", title: "VP Product Management", department: "Accounting", email: "elevet4@senate.gov", role: "Admin"),
        TestUserFancy(name: "Maryjo Lebarree", title: "Civil Engineer", department: "Product Management", email: "mlebarree5@unc.edu", role: "User"),
        TestUserFancy(name: "Egan Poetz", title: "Research Nurse", department: "Engineering", email: "epoetz6@free.fr", role: "Admin"),
        TestUserFancy(name: "Kellie Skingley", title: "Teacher", department: "Services", email: "kskingley7@columbia.edu", role: "Owner")
    ]
}

fileprivate extension String {
    var initials:String {
        return self.split(separator: " ").map { $0.prefix(1) }.joined().uppercased()
    }
}
