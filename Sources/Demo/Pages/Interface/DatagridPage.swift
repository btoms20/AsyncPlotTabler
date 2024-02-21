import AsyncPlotTabler

/// Datagrid Demo View
struct DatagridPage: Component {
    
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(header: .init(header: "Data grid"), content: {
            await CardVStack {
                await Card(
                    header: .init({
                        Card.Title("Base info")
                    }),
                    body: .init({
                        await Datagrid(items: [
                            .init(title: "Registrar") { Text("Third Party") },
                            .init(title: "Nameservers") { Text("Third Party") },
                            .init(title: "Port Number") { Text("3306") },
                            .init(title: "Expiration Date") { Text("-") },
                            .init(title: "Creator") {
                                let user = MockData.Users.first!
                                await LabeledAvatar(avatar: .init(size: .xs, user.avatar), link: "#", content: { Text(user.name) })
                            },
                            .init(title: "Age") { Text("15 Days") },
                            .init(title: "Edge Network") {
                                Span { Text("Active") }
                                    .class("status status-green")
                            },
                            .init(title: "Avatar List") {
                                Avatar.List(avatars: [
                                    .text("JT"),
                                    .text("JT"),
                                    .text("JT"),
                                    .text("JT"),
                                    .text("+3"),
                                ])
                            },
                            .init(title: "Checkbox") {
                                Form.Checkbox(label: "Click me")
                            },
                            .init(title: "Checkbox") {
                                SVGIcon(icon: .check, color: .green)
                                Text("Checked")
                            },
                            .init(title: "Form Control") {
                                Input(type: .text, placeholder: "Input placeholder")
                                    .class("form-control form-control-flush")
                            },
                            .init(title: "Longer Description") {
                                Text(loremIpsum())
                            }
                        ])
                    })
                )
            }
        }))
    }
}
