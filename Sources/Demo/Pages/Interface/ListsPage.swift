import AsyncPlotTabler

/// Lists Demo View
struct ListsPage: Component {
    
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(header: .init(header: "Lists"), content: {
            await CardVStack {
                await CardHStack {
                    await CardVStack {
                        await Card(
                            header: .init({
                                Card.Title("Top users")
                            }),
                            body: .init({
                                await Row(g: 3) {
                                    for chunk in MockData.Users.prefix(10).chunks(ofCount: 5) {
                                        await Column {
                                            for user in chunk {
                                                await LabeledAvatar(avatar: .init(size: .md, user.avatar, badge: Colors.allColors.randomElement()), title: user.name, subTitle: user.jobTitle, link: "#")
                                                    .margin(.body(3))
                                            }
                                        }
                                    }
                                }
                            })
                        )
                        
                        await Card(
                            header: .init({
                                Card.Title("Contacts")
                            }),
                            body: .raw({
                                await Plot.Form.ListGroup(theme: .flush, items: MockData.Users.randomSample(count: 8).enumerated().asyncMap { i, user in
                                    await .init(link: "#", active: i == 1 || i == 5) {
                                        await LabeledAvatar(avatar: .init(size: .md, user.avatar, badge: Colors.allColors.randomElement()), title: user.name, subTitle: user.jobTitle, link: "#", leadingContent: {
                                            Plot.Form.Checkbox(style: .check, name: "contacts", checked: i == 1 || i == 5)
                                        })
                                    }
                                })
                            })
                        )
                        
                        await Card(
                            header: .init({
                                Card.Title("Links and buttons")
                            }),
                            body: .raw({
                                await Plot.Form.ListGroup(style: .link, theme: .flush, items: (1...5).asyncMap { i in
                                    await .init(link: "#", active: i == 1, disabled: i == 5) {
                                        Text("Link Item \(i)")
                                    }
                                })
                            })
                        )
                    }
                    
                    await CardVStack {
                        await Card(
                            header: .init({
                                Card.Title("Last commits")
                            }),
                            body: .raw({
                                await Plot.Form.ListGroup(theme: .flush, background: .regular, scrollable: false, hoverable: true, items: MockData.Users.randomSample(count: 8).asyncMap { user in
                                    await .init(link: "#", active: false) {
                                        await Row(alignItemsCenter: true) {
                                            await Column {
                                                await LabeledAvatar(avatar: .init(size: .md, user.avatar), title: user.name, subTitle: user.jobTitle, link: "#", leadingContent: {
                                                    Badge(style: .dot(Colors.allColors.randomElement()!))
                                                })
                                            }
                                            await Column {
                                                Link(url: "#") { SVGIcon(icon: .star, color: .yellow) }
                                                    .class("list-group-item-actions")
                                            }
                                            .class("col-auto")
                                        }
                                    }
                                })
                            })
                        )
                        
                        await Card(
                            header: .init({
                                Card.Title("People")
                            }),
                            body: .raw({
                                await Plot.Form.ListGroup(theme: .flush, background: .regular, scrollable: true, hoverable: false, groupedItems: MockData.Users.chunks(ofCount: 3).enumerated().asyncMap { i, chunk in
                                        .init(
                                            label: "Chunk \(i + 1)",
                                            items: await chunk.asyncMap { user in
                                                await Plot.Form.ListGroup.Item(link: "#", active: false) {
                                                    await LabeledAvatar(avatar: .init(size: .md, user.avatar), title: user.name, subTitle: user.jobTitle, link: "#")
                                                }
                                            }
                                        )
                                })
                            })
                        )
                    }
                }
            }
        }))
    }
}
