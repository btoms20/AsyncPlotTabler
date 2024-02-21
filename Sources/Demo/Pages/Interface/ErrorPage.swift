import AsyncPlotTabler

/// Error Demo Page
struct ErrorPage: Component {
    enum Style {
        case _404
        case _500
        case maintenance
        
        func header() async -> Component {
            switch self {
            case ._404: return await DivC("empty-header") { Text("404") }
            case ._500: return await DivC("empty-header") { Text("500") }
            case .maintenance: return await DivC("empty-img") { Image(url: "./static/illustrations/undraw_quitting_time_dm8t.svg", description: "maintenance illustration").attribute(named: "height", value: "128") }
            }
        }
        
        var title:String {
            switch self {
            case ._404:
                "Oops… We couldn't find that page"
            case ._500:
                "Oops… Something went wrong"
            case .maintenance:
                "Temporarily down for maintenance"
            }
        }
        
        var description:String {
            switch self {
            case ._404:
                "We are sorry but the page you are looking for was not found"
            case ._500:
                "We are sorry but our server encountered an internal error"
            case .maintenance:
                "Sorry for the inconvenience but we’re performing some maintenance at the moment. We’ll be back online shortly!"
            }
        }
    }
    
    let style:Style
    
    init(error: Style) {
        self.style = error
    }
    
    func body() async -> Plot.Component {
        await DivC("page page-center") {
            await DivC("container container-tight py-4") {
                await DivC("empty") {
                    // Error Header
                    await style.header()
                    
                    // Error Message
                    Paragraph { Text(style.title) }
                        .class("empty-title")
                    Paragraph { Text(style.description) }
                        .class("empty-subtitle")
                        .textColor(.secondary)
                    
                    // Action Button
                    await DivC("empty-action") {
                        ButtonLink("Take me home", link: "home", icon: .arrow_left)
                    }
                }
            }
        }
    }
}
