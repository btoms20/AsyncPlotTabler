import AsyncPlotTabler

/// Tags Demo Page
struct TagsPage: Component {
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(header: .init(header: "Tags"), content: {
            await CardVStack {
                await CardHStack {
                    await Card(
                        body: .init({
                            Card.Title("Default Tags")
                            await DivC("tags-list") {
                                for i in 1...14 {
                                    await Tag(style: .text("Label \(i)"))
                                }
                            }
                        })
                    )
                    
                    await Card(
                        body: .init({
                            Card.Title("Tags with Flags")
                            await DivC("tags-list") {
                                await Tag(style: .text("Andorra"))
                                await Tag(style: .text("Afghanistan"))
                                await Tag(style: .text("Antigua"))
                                await Tag(style: .text("Anguilla"))
                                await Tag(style: .text("Armenia"))
                                await Tag(style: .text("Angolan"))
                                await Tag(style: .text("Antarctica"))
                                await Tag(style: .text("Argentina"))
                            }
                        })
                    )
                    
                    await Card(
                        body: .init({
                            Card.Title("Tags with Icons")
                            await DivC("tags-list") {
//                                for _ in 1...14 {
//                                    let icon = Icons.allIcons.randomElement()!
//                                    await Tag(style: .icon(icon.icon, icon.name))
//                                }
                            }
                        })
                    )
                }
                
                await CardHStack {
                    await Card(
                        body: .init({
                            Card.Title("Tags with avatar")
                            await DivC("tags-list") {
                                await Tag(style: .avatar(.text("PK"), "Paweł Kuna"))
                                await Tag(style: .avatar(.text("JL"), "Jeffie Lewzey"))
                                await Tag(style: .avatar(.text("MH"), "Mallory Hulme"))
                                await Tag(style: .avatar(.text("DS"), "Dunn Slane"))
                                await Tag(style: .avatar(.text("EL"), "Emmy Levet"))
                                await Tag(style: .avatar(.text("ML"), "Maryjo Lebarree"))
                                await Tag(style: .avatar(.text("EP"), "Egan Poetz"))
                                await Tag(style: .avatar(.text("KS"), "Kellie Skingley"))
                            }
                        })
                    )
                    
                    await Card(
                        body: .init({
                            Card.Title("Tags with status")
                            await DivC("tags-list") {
                                for color in Colors.allColors {
                                    await Tag(style: .status(color, "\(color)".capitalized))
                                }
                            }
                        })
                    )
                    
                    await Card(
                        body: .init({
                            Card.Title("Tags with legend")
                            await DivC("tags-list") {
                                for color in Colors.allColors {
                                    await Tag(style: .legend(color, "\(color)".capitalized))
                                }
                            }
                        })
                    )
                }
                
                await CardHStack {
                    await Card(
                        body: .init({
                            Card.Title("Tags with checkboxes")
                            await DivC("tags-list") {
                                for i in 1...14 {
                                    await Tag(style: .checkbox("Label \(i)"))
                                }
                            }
                        })
                    )
                    
                    await Card(
                        body: .init({
                            Card.Title("Tags with badge")
                            await DivC("tags-list") {
                                for i in 1...14 {
                                    await Tag(style: .badge("Label", Badge {
                                        Text("\(i)")
                                    }))
                                }
                            }
                        })
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
