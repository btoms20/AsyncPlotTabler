import Vapor
import AsyncPlotTabler

/// We can use an enum like this to define our pages
/// - Note: This is what lets us call `render(page: .home)` in our route handlers
enum Pages:Equatable {
    // The Home page will display a list of recent Blog Post / Article
    case home
    // The About page has some information regarding the author of this website
    case about
    // The Article page is a template that renders the full length blog post / article
    case article(BlogPost)
    
    /// Each page can define their own custom header
    func header(req:Request) async -> PageHeader {
        switch self {
        case .home:
            return await Home.header(req: req)
        case .about:
            return await About.header(req: req)
        case .article(let post):
            return await ArticlePage(post: post).header(req: req)
        }
    }
    
    /// Each page is itself a component that can be rendered
    var content: Component {
        switch self {
        case .home:
            return Home()
        case .about:
            return About()
        case .article(let post):
            return ArticlePage(post: post)
        }
    }
    
    /// The url that the page resides at
    var url:String {
        switch self {
        case .home: return Home.url
        case .about: return About.url
        case .article(let post):
            return post.link
        }
    }

    /// The page's title (to be used in nav bar links)
    var title:String {
        switch self {
        case .home: Home.title
        case .about: About.title
        case .article: ""
        }
    }

    /// NavBar Route Items
    /// Here we can define which links we want present in our Navigation Bar / Dropdown menu)
    static func routes(currentPage: Pages) -> [NavBar.RouteItem] {
        [
            .init(title: Pages.home.title, url: Pages.home.url, icon: .home, active: currentPage == .home),
            .init(title: Pages.about.title, url: Pages.about.url, icon: .user, active: currentPage == .about),
        ]
    }
}
