import AsyncPlotTabler

/// Users Demo Page
struct UsersPage: Component {
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(
            header: .init(header: {
                H2 { Text("Users") }.class("page-title")
                await DivC("mt-1") { Text("1-18 of 413 people") }.textColor(.secondary)
            }, actions: {
                Plot.Form.Textfield(type: .search, name: "search-user", value: nil, placeholder: "Search user...", isRequired: false)
                    .class("d-inline-block w-9 me-3")
                ButtonLink("New User", link: "#", icon: .plus)
            }),
            content: {
                await CardVStack {
                    for chunk in MockData.Users.chunks(ofCount: 4) {
                        await CardHStack {
                            for user in chunk {
                                await Card(
                                    size: .large(.num(3)),
                                    body: .init({
                                        Avatar(size: .xl, user.avatar)
                                            .margin(.body(3))
                                        H3 { Text(user.name) }
                                            .margin(.body(1))
                                        Div { Text(user.jobTitle) }.textColor(.secondary)
                                        
                                        Div {
                                            if let role = user.role {
                                                await Badge(fill: .light, color: role == "Owner" ? .purple : .green) {
                                                    Text(role)
                                                }
                                            }
                                        }.margin(.top(3))
                                    }, class: "p-4 text-center"),
                                    flex: .init({
                                        ButtonLink("Email", link: "#", icon: .mail, style: .card)
                                        ButtonLink("Call", link: "#", icon: .phone, style: .card)
                                    })
                                )
                            }
                        }
                    }
                }
            })
        )
    }
}
