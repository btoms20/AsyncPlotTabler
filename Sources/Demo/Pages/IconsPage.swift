import AsyncPlotTabler

/// Icon Demo View
struct IconsPage: Component {
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(header: .init(header: "Icons"), content: {
            await CardVStack {
                await CardHStack {
                    await Card(
                        size: .large(.num(3)),
                        stamp: .init(icon: .ghost, color: .blue),
                        body: .init({
                            await H2("Tabler Icons")
                            await Paragraph("All icons come from the Tabler Icons set and are MIT-licensed. Visit tabler-icons.io, download any of the 4637 icons in SVG, PNG or React and use them in your favorite design tools.")
                                .class("text-secondary")
                            ButtonLink("Download icons", link: "#")
                        })
                    )
                    
                    await Card(
                        header: Card.Header({
                            Card.Title("Interface icons")
                        }),
                        body: Card.Body({
                            Div {
                                Div {
//                                    for icon in Icons.allIcons {
//                                        IconListItem(icon: icon)
//                                    }
                                }
                                .class("demo-icons-list")
                            }.class("demo-icons-list-wrap")
                        }, class: "p-0")
                    )
                }
            }
        }))
    }
}

fileprivate struct IconListItem:Component {
    let icon:(name:String, icon:Icons)
    
    func body() async -> Plot.Component {
        Link(url: "#", label: {
            SVGIcon(icon: icon.icon)
        })
        .class("demo-icons-list-item")
        .attribute(named: "title", value: "\(icon.name)")
        .attribute(named: "data-bs-toggle", value: "tooltip")
        .attribute(named: "data-bs-placement", value: "top")
    }
}
