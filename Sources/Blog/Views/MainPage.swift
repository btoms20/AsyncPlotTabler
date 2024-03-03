import Vapor
import AsyncPlotTabler

/// The `MainPage` handles constructing our `NavBar` and the `Container` that our `Page` will be rendered into
struct MainPage:Component {
    @EnvironmentValue(.request) var request:Request?
    
    let page:Pages
    
    func body() async -> Component {
        return Site(
            // Header Bar ( Brand / Logo and Routes )
            header: NavBar(
                // This is the Image / Logo brand you see in the top left corner of the NavBar
                // You can change it to Text only, or create your own brand image and place it within the `static` dir
                brand: .init(imageURL: "/static/logo.svg"),
                // These are the links available in our NavBar (Home and About, in this example)
                routes: Pages.routes(currentPage: page),
                // If this is set to true, a bell icon will be displayed with a list of mock notifications
                notificationsEnabled: false,
                // If this is set, a user avatar will be displayed in the navbar alongside a dropdown menu
                // Perfect for when your app support user accounts
                userMenu: nil,
                // If this is enabled, a search bar will be added to the NavBar
                searchEnabled: false
            ),
            // Body Wrapper ( Page title and contents )
            page: await Page(
                // Each Page can specify / define their own header (the area below the NavBar but above the Page contents)
                header: page.header(req: request!),
                // Content is the meat and potatoes of the Page to be rendered
                content: page.content
            )
        )
    }
}

// Extend Plot's EnvironmentKey in order to access Vapor's Request object while rendering components
extension Plot.EnvironmentKey where Value == Vapor.Request? {
    static var request: Self {
        Self(defaultValue: nil)
    }
}
