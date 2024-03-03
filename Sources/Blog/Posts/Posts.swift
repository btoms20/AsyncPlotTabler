import Foundation
import AsyncPlotTabler

struct Posts {
    
    // You probably want to come up with a different mechanism for storing your Blog Posts / Articles.
    // Perhaps a database (using Fluent) or prepare Static pages and read them in from your Public dir.
    static var allPosts:[BlogPost] = [
        Posts.post1,
        Posts.post2,
        Posts.post3,
    ]
    
}

/// A struct to hold all the info necessary for each of our Blog Posts / Articles
struct BlogPost:Equatable {
    static func == (lhs: BlogPost, rhs: BlogPost) -> Bool {
        lhs.uuid == rhs.uuid
    }
    
    enum Contents {
        case text(String)
        case markdown(String)
        case component(Component)
        case rawHTML(String)
    }
    
    let uuid:UUID
    let title:String
    let subTitle:String
    let link:String
    let imageURL:String
    let imageDescription:String
    let categories:[CategoryBadge]
    let published:String
    let readTime:String
    let contents:Contents
    
    public init(id: String, title: String, subTitle: String, imageURL: String, imageDescription: String, categories: [CategoryBadge], published: String, readTime: String, contents:Contents) {
        let id = UUID(uuidString: id)!
        self.uuid = id
        self.link = "/article/\(id)"
        self.title = title
        self.subTitle = subTitle
        self.imageURL = imageURL
        self.imageDescription = imageDescription
        self.categories = categories
        self.published = published
        self.readTime = readTime
        self.contents = contents
    }
}
