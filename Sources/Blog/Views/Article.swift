import Vapor
import Ink
import AsyncPlotTabler

struct ArticlePage:Component {
    
    let post:BlogPost
    
    func body() async -> Component {
        
        // The CardVStack here is similar to SwiftUI's VStack
        // This lets us display multiple Cards vertically in a single page
        // - Note: While it's not necessary on this page (because we only disaplay a single Card)
        //         it's good practice to place our contents within one when it's a primary Page component
        await CardVStack {
            // The Card that will contain our Blog Post
            await Card(
                image: .init(
                    src: post.imageURL,
                    size: .init(width: 0, height: 0),
                    position: .top,
                    description: post.imageDescription
                ),
                body: .init({
                    
                    // Display the Category Badges
                    Span {
                        for category in post.categories {
                            category.margin(.trailing(2))
                        }
                    }
                    
                    // Show the reader the publish date and approximate read time
                    await Row {
                        await Column(auto: true) {
                            IconLabel(icon: .calendar, text: post.published)
                        }
                        await Column {
                            IconLabel(icon: .clock, text: post.readTime)
                        }
                    }.margin(.top(3))
                    
                    // Place a HRule / Divider to help format the page
                    HRule(style: .regular)
                    
                    // Actually Render the Blog Post's Contents
                    // - Note: In this example we've allowed Blog Posts to have various types of Content (text, markdown, Components or raw html)
                    // - So let's switch over the content type and see how we can render each type to the page...
                    switch post.contents {
                    case .text(let txt):
                        // Just plain text (place the Text in a Div, Span, Paragraph component, etc)
                        Paragraph { Text(txt) }
                    case .markdown(let md):
                        // An example of parsing Markdown
                        // We can use `Ink` and it's `MarkdownParser` to turn it into HTML
                        RawHTML( MarkdownParser().html(from: md) )
                    case .component(let comp):
                        // Another Component? Just include it
                        comp
                    case .rawHTML(let html):
                        // An example of displaying Raw HTML
                        RawHTML(html)
                    }
                })
            )
        }
    }
    
    func header(req:Request) async -> PageHeader {
        await .init {
            // Card Title
            H1 { Text(post.title) }
            Div { H4 { Text(post.subTitle ) } }
        }
    }
}
