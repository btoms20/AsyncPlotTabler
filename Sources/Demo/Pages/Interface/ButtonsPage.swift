import AsyncPlotTabler

/// Buttons Demo View
struct ButtonsPage: Component {
    
    func darkBGCSS(_ theme:ButtonLink.Theme) -> String {
        if case .light = theme { return "bg-dark" } else { return "" }
    }
    
    var icons:[Icons] = [
        .brand_facebook,
        .brand_twitter,
        .brand_google,
        .brand_youtube,
        .brand_vimeo,
        .brand_dribbble,
        .brand_github,
        .brand_instagram,
        .brand_pinterest,
        .rss
    ]
    
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(header: .init(header: "Buttons"), content: {
            await CardVStack {
                await Card(
                    header: .init({
                        Card.Title("Standard Buttons")
                    }),
                    body: .init({
                        for state in ButtonLink.State.allCases {
                            await DivC("row g-2 align-items-center") {
                                await DivC("col-12 col-xl-2 font-weight-semibold") { Text("\(state)") }
                                for theme in ButtonLink.Theme.allCases {
                                    await DivC("col-6 col-sm-4 col-md-2 col-xl py-3") {
                                        ButtonLink("\(theme)", link: "#", theme: theme, state: state)
                                            .class("w-100")
                                    }.class(darkBGCSS(theme))
                                }
                            }
                        }
                    })
                )
                await Card(
                    header: .init({
                        Card.Title("Outline Buttons")
                    }),
                    body: .init({
                        for state in ButtonLink.State.allCases {
                            await DivC("row g-2 align-items-center") {
                                await DivC("col-12 col-xl-2 font-weight-semibold") { Text("\(state)") }
                                for theme in ButtonLink.Theme.allCases {
                                    await DivC("col-6 col-sm-4 col-md-2 col-xl py-3") {
                                        ButtonLink("\(theme)", link: "#", style: .outline, theme: theme, state: state)
                                            .class("w-100")
                                    }.class(darkBGCSS(theme))
                                }
                            }
                        }
                    })
                )
                await Card(
                    header: .init({
                        Card.Title("Ghost Buttons")
                    }),
                    body: .init({
                        for state in ButtonLink.State.allCases {
                            await DivC("row g-2 align-items-center") {
                                await DivC("col-12 col-xl-2 font-weight-semibold") { Text("\(state)") }
                                for theme in ButtonLink.Theme.allCases {
                                    await DivC("col-6 col-sm-4 col-md-2 col-xl py-3") {
                                        ButtonLink("\(theme)", link: "#", style: .ghost, theme: theme, state: state)
                                            .class("w-100")
                                    }.class(darkBGCSS(theme))
                                }
                            }
                        }
                    })
                )
                await Card(
                    header: .init({
                        Card.Title("Square Buttons")
                    }),
                    body: .init({
                        for state in ButtonLink.State.allCases {
                            await DivC("row g-2 align-items-center") {
                                await DivC("col-12 col-xl-2 font-weight-semibold") { Text("\(state)") }
                                for theme in ButtonLink.Theme.allCases {
                                    await DivC("col-6 col-sm-4 col-md-2 col-xl py-3") {
                                        ButtonLink("\(theme)", link: "#", style: .square, theme: theme, state: state)
                                            .class("w-100")
                                    }.class(darkBGCSS(theme))
                                }
                            }
                        }
                    })
                )
                await Card(
                    header: .init({
                        Card.Title("Pill Buttons")
                    }),
                    body: .init({
                        for state in ButtonLink.State.allCases {
                            await DivC("row g-2 align-items-center") {
                                await DivC("col-12 col-xl-2 font-weight-semibold") { Text("\(state)") }
                                for theme in ButtonLink.Theme.allCases {
                                    await DivC("col-6 col-sm-4 col-md-2 col-xl py-3") {
                                        ButtonLink("\(theme)", link: "#", style: .pill, theme: theme, state: state)
                                            .class("w-100")
                                    }.class(darkBGCSS(theme))
                                }
                            }
                        }
                    })
                )
                
                await Card(
                    header: .init({
                        Card.Title("Extra Colors")
                    }),
                    body: .init({
                        for state in ButtonLink.State.allCases {
                            await DivC("row g-2 align-items-center") {
                                await DivC("col-12 col-xl-2 font-weight-semibold") { Text("\(state)") }
                                for color in Colors.allColors {
                                    await DivC("col-6 col-sm-4 col-md-2 col-xl py-3") {
                                        ButtonLink("\(color)", link: "#", style: .standard, theme: .color(color), state: state)
                                            .class("w-100")
                                    }
                                }
                            }
                        }
                    })
                )
                
                await Card(
                    header: .init({
                        Card.Title("Icon Buttons")
                    }),
                    body: .init({
                        await DivC("row g-2 align-items-center") {
                            await DivC("col-12 col-xl-2 font-weight-semibold") { Text("Icons") }
                            for icon in icons {
                                await DivC("col-6 col-sm-4 col-md-2 col-xl py-3") {
                                    ButtonLink("", link: "#", icon: icon, style: .standard, theme: .color(.azure))
                                        .class("w-100")
                                }
                            }
                        }
                    })
                )
            }
        }))
    }
}
