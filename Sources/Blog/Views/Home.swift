import Vapor
import AsyncPlotTabler

struct Home:Component {
    
    func body() async -> Component {
        return await CardVStack {
            
            // Just like `SwiftUI` we can use loops and conditionals within our Component builder
            // Lets loop over all of the Posts and render each one
            for post in Posts.allPosts {
                BlogPostOverviewCard(post: post)
                    .margin(.body(4))
            }
            
        }
    }
}

extension Home {
    static var url:String {
        return "/"
    }

    static var title:String {
        return "Home"
    }
    
    static func header(req: Request) async -> PageHeader {
        .init(header: "Recent Blog Posts")
    }
}

// A Card that displays a preview of a Blog Post / Article
private struct BlogPostOverviewCard:Component {
    let post:BlogPost
    
    func body() async -> Component {
        await Card(
            // Specifying the type `.link` lets us make the entire Card clickable
            type: .link(post.link),
            // Hover effects when the mouse is positioned over the Card
            hover: .hover,
            // Each blog post has an associated image, so lets add it to the top of the Card
            image: .init(
                src: post.imageURL,
                size: .init(width: 0, height: 0),
                position: .top,
                description: post.imageDescription
            ),
            // We'll use the body of the Card to render the Categories, Title and SubTitle of the Blog Post
            body: .init({
                
                // Category Badges
                Span {
                    for cat in post.categories {
                        cat.margin(.trailing(2))
                    }
                }
                
                // Card Title
                Card.Title(post.title, subTitle: .below(post.subTitle))
                    .margin(.top(3))
                
            }),
            // We'll use the footer section of the Card to show the date the blog post was added and how long of a read it is.
            footer: .init({
                await Row {
                    await Column {
                        IconLabel(icon: .calendar, text: post.published)
                    }
                    await Column {
                        IconLabel(icon: .clock, text: post.readTime)
                    }
                }
            })
        )
    }
}


