import AsyncPlotTabler

/// Settings Demo Page
struct SettingsPage: Component {
    
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(header: .init(header: "Account Settings"), content: {
            await CardVStack {
                await CardWithNavigation(
                    navGroups: [
                        .init(label: "Business settings", items: [
                            .init(link: "#", active: true, title: "My Account"),
                            .init(link: "#", title: "My Notifications", count: 3),
                            .init(link: "#", title: "Connected Apps"),
                            .init(link: "#", title: "Billing & Invoices"),
                        ]),
                        .init(label: "Experience", items: [
                            .init(link: "#", title: "Give Feedback")
                        ])
                    ],
                    activeComponent: { MyAccount(user: MockData.Users.randomElement()!) }
                )
            }
        }))
    }
}

struct MyAccount:Component {
    
    let user:MockData.User
    
    func body() async -> Plot.Component {
        await Card(
            body: .init({
                H2 { Text("My Account") }
                    .margin(.body(4))
                Card.Title("Profile Details")
                await Row(alignItemsCenter: true) {
                    await Column(auto: true) {
                        Avatar(size: .xl, user.avatar, shape: .regular, badge: nil)
                    }
                    await Column(auto: true) {
                        ButtonLink("Change Avatar", link: "#", style: .standard, theme: .light)
                    }
                    await Column(auto: true) {
                        ButtonLink("Delete Avatar", link: "#", style: .ghost, theme: .danger)
                    }
                }
                .margin(.body(4))
                
                Card.Title("Business Profile")
                    .margin(.trailing(4))
                await Row(g: 3) {
                    await Column(size: .medium(.full)) {
                        Plot.Form.Label("Business Name")
                        Plot.Form.Textfield(name: "business-name", value: "Tabler", placeholder: "business name")
                    }
                    await Column(size: .medium(.full)) {
                        Plot.Form.Label("Business ID")
                        Plot.Form.Textfield(name: "business-id", value: "560afc32", placeholder: "business id")
                    }
                    await Column(size: .medium(.full)) {
                        Plot.Form.Label("Location")
                        Plot.Form.Textfield(name: "business-name", value: "Peimei, China", placeholder: "business location")
                    }
                }
                .margin(.body(4))
                
                Card.Title("Email", subTitle: .below("This contact will be shown to others publicly, so choose it carefully."))
                    .margin(.trailing(4))
                Div {
                    await Row(g: 2) {
                        await Column(auto: true) {
                            Plot.Form.Textfield(type: .email, name: "business-email", value: "paweluna@howstuffworks.com", placeholder: "business email")
                                .class("w-auto")
                        }
                        await Column(auto: true) {
                            ButtonLink("Change Email", link: "#", style: .standard, theme: .light)
                        }
                    }
                }
                .margin(.body(4))
                
                Card.Title("Password", subTitle: .below("You can set a permanent password if you don't want to use temporary login codes."))
                    .margin(.trailing(4))
                Div {
                    ButtonLink("Change Password", link: "#", style: .standard, theme: .light)
                }
                .margin(.body(4))
                
                Card.Title("Public Profile", subTitle: .below("Making your profile public means that anyone on the Dashkit network will be able to find you."))
                    .margin(.trailing(4))
                Div {
                    await Plot.Form.Checkbox(style: .toggle, name: "business-public", checked: false, label: { Text("You're currently invisible") })
                }
                
            }),
            footer: .init({
                await DivC("btn-list justify-content-end") {
                    ButtonLink("Cancel", link: "#", style: .standard, theme: .light)
                    ButtonLink("Update", link: "#", style: .standard, theme: .primary)
                }
            }, class: "bg-transparent mt-auto")
        
        )
    }
}
