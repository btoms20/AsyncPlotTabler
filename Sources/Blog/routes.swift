import Vapor
import AsyncPlotTabler

func routes(_ app: Application) throws {
    
    /// The default route will display our `Home` page
    app.get { req async in
        await req.render(page: .home)
    }
    
    /// This route displays our `About` me page
    app.get("about") { req async in
        await req.render(page: .about)
    }
    
    /// This route handles displaying individual articles / blog posts based on their ID
    app.get("article", ":id") { req async throws -> Response in
        guard let idString = req.parameters.get("id"), let articleID = UUID(uuidString: idString) else { throw Abort(.notFound) }
        guard let post = Posts.allPosts.first(where: { $0.uuid == articleID }) else { throw Abort(.notFound) }
        return await req.render(page: .article(post))
    }
    
}

extension Request {
    func render(page: Pages) async -> Response {
        let page = await MainPage(page: page)
            // Using an environmentValue (similar to SwiftUI) we can provide each sub component access to the `Request`
            // Although we don't use it in this Blog Post example, having access to the request object can
            //  allow individual components to asynchronously query databases for the data they're responsible for rendering.
            // This becomes important in much larger, dynamic sites / dashboards
            .environmentValue(self, key: .request)
            // This helper method wraps our main page in the HTML necessary to pull in frameworks, stylesheets, etc
            .renderInWrappedHTMLBody()
        
        return Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            body: .init(string: page)
        )
    }
}


