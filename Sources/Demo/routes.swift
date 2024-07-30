import Vapor
import AsyncPlotTabler

func routes(_ app: Application) throws {
    app.get { req async -> Response in
        return await Response(
            headers: ["Content-Type": "text/html"],
            component: HomePage()
        )
    }
    
    /// Demo Pages
    app.get("accordion") { req async -> Response in
        return await Response(
            headers: ["Content-Type": "text/html"],
            component: AccordionPage()
        )
    }
    
    app.get("activity") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: ActivityPage()
        )
    }
    
    app.get("alerts") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: AlertsPage()
        )
    }
    
    app.get("badges") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: BadgesPage()
        )
    }
    
    app.get("blank-page") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: EmptyComponent()
        )
    }
    
    app.get("buttons") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: ButtonsPage()
        )
    }
    
    app.get("cards-sample") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: CardsPage()
        )
    }
    
    app.get("carousel") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: CarouselPage()
        )
    }
    
    app.get("charts") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: ChartsPage()
        )
    }
    
    app.get("chat") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: ChatPage()
        )
    }
    
    app.get("color-picker") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: ColorPickerPage()
        )
    }
    
    app.get("colors") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: ColorsPage()
        )
    }
    
    app.get("data-grid") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: DatagridPage()
        )
    }
    
    app.get("datatables") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: DatatablesPage()
        )
    }
    
    app.get("dropdowns") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: DropdownPage()
        )
    }
    
    app.get("errors-404") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: ErrorPage(error: ._404)
        )
    }
    
    app.get("errors-500") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: ErrorPage(error: ._500)
        )
    }
    
    app.get("errors-maintenance") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: ErrorPage(error: .maintenance)
        )
    }
    
    app.get("faq") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: FAQPage()
        )
    }
    
    app.get("flags") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: FlagsPage()
        )
    }
    
    app.get("forgot-password") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: SignInPage(mode: .forgotPassword, style: .bare)
        )
    }
    
    app.get("forgot-password-illustrated") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: SignInPage(mode: .forgotPassword, style: .illustration("./static/illustrations/undraw_secure_login_pdn4.svg"))
        )
    }
    
    app.get("forgot-password-cover") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: SignInPage(mode: .forgotPassword, style: .cover("./static/photos/finances-us-dollars-and-bitcoins-currency-money-2.jpg"))
        )
    }
    
    app.get("form-elements") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: FormElementsPage()
        )
    }
    
    app.get("gallery") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: GalleryPage()
        )
    }
    
    app.get("home") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: HomePage()
        )
    }
    
    app.get("icons") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: IconsPage()
        )
    }
    
    app.get("license") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: LicensePage()
        )
    }
    
    app.get("lists") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: ListsPage()
        )
    }
    
    app.get("logs") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: LogsPage()
        )
    }
    
    app.get("map-vector") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: VectorMapsPage()
        )
    }
    
    app.get("music") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: MusicPage()
        )
    }
    
    app.get("pagination") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: PaginationPage()
        )
    }
    
//    app.get("photogrid") { req async -> Response in
//        return await Response(
//            status: .ok,
//            headers: ["Content-Type": "text/html"],
//            component: PhotogridPage()
//        )
//    }
    
    app.get("pricing-cards") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: PricingCardsPage()
        )
    }
    
    app.get("pricing-table") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: PricingTablePage()
        )
    }
    
    app.get("sign-in") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: SignInPage(mode: .signIn, style: .bare)
        )
    }
    
    app.get("sign-in-link") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: SignInPage(mode: .link(.emailConfirmation), style: .bare)
        )
    }
    
    app.get("sign-in-link-illustrated") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: SignInPage(mode: .link(.emailConfirmation), style: .illustration("./static/illustrations/undraw_secure_login_pdn4.svg"))
        )
    }
    
    app.get("sign-in-link-cover") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: SignInPage(mode: .link(.emailConfirmation), style: .cover("./static/photos/finances-us-dollars-and-bitcoins-currency-money-2.jpg"))
        )
    }
    
    app.get("sign-in-illustrated") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: SignInPage(mode: .signIn, style: .illustration("./static/illustrations/undraw_secure_login_pdn4.svg"))
        )
    }
    
    app.get("sign-in-cover") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: SignInPage(mode: .signIn, style: .cover("./static/photos/finances-us-dollars-and-bitcoins-currency-money-2.jpg"))
        )
    }
    
    app.get("sign-up") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: SignInPage(mode: .signUp, style: .bare)
        )
    }
    
    app.get("sign-up-illustrated") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: SignInPage(mode: .signUp, style: .illustration("./static/illustrations/undraw_secure_login_pdn4.svg"))
        )
    }
    
    app.get("sign-up-cover") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: SignInPage(mode: .signUp, style: .cover("./static/photos/finances-us-dollars-and-bitcoins-currency-money-2.jpg"))
        )
    }
    
    app.get("search-results") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: SearchResultsPage()
        )
    }
    
    app.get("settings") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: SettingsPage()
        )
    }
    
    app.get("star-rating") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: StarRatingsPage()
        )
    }
    
    app.get("steps") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: StepsPage()
        )
    }
    
    app.get("tables") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: TablesPage()
        )
    }
    
    app.get("tabs") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: TabsPage()
        )
    }
    
    app.get("tags") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: TagsPage()
        )
    }
    
    app.get("timelines") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: TimelinePage()
        )
    }
    
    app.get("tiny-mce") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: Form.TinyMCE(name: "tiny-mce-1", content: Text("Tiny MCE Test"))
        )
    }
    
    app.get("users") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: UsersPage()
        )
    }
    
    app.get("uptime-monitor") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: UptimeMonitorPage()
        )
    }
    
    app.get("widgets") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: WidgetsPage()
        )
    }
    
    app.get("models") { req async -> Response in
        return await Response(
            status: .ok,
            headers: ["Content-Type": "text/html"],
            component: ModelsPage()
        )
    }
    
}

extension Response {
    public convenience init(
        status: HTTPResponseStatus = .ok,
        version: HTTPVersion = .init(major: 1, minor: 1),
        headers: HTTPHeaders = .init(),
        component: Component = EmptyComponent()
    ) async {
        self.init(
            status: status,
            version: version,
            headers: headers,
            body: .init(string: await component.renderInWrappedHTMLBody())
        )
    }
}
