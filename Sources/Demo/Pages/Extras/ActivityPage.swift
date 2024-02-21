import AsyncPlotTabler

/// Activity Demo View
struct ActivityPage: Component {
    
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(header: .init(header: "Activity"), content: {
            await CardVStack {
                await Card(body: .init({
                    await DivC("divide-y") {
                        for (i, user) in MockData.Users.enumerated() {
                            Div {
                                await LabeledAvatar(
                                    avatar: .init(size: .md, user.avatar),
                                    title: MockData.randomActivity(username: user.name),
                                    subTitle: "\((i+3) / 3) days ago",
                                    link: "#"
                                )
                            }
                        }
                    }
                }))
            }
        }))
    }
}
