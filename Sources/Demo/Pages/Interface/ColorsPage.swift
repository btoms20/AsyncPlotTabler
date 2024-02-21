import AsyncPlotTabler

/// Colors Demo View
struct ColorsPage: Component {
    
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
    
    func colorPrifix(_ color:Colors) -> String {
        let str = "\(color)"
        return String(str.prefix(2))
    }
    
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(header: .init(header: "Colors"), content: {
            await CardVStack {
                await Card(
                    body: .init({
                        await DivC("table-responsive") {
                            Plot.Table {
                                Plot.TableRow {
                                    for color in Colors.allColors {
                                        Plot.TableCell {
                                            await DivC("avatar \(color.backgroundCSS) \(color.textLiteCSS)") {
                                                Text(colorPrifix(color))
                                            }
                                        }
                                    }
                                }
                                Plot.TableRow {
                                    for color in Colors.allColors {
                                        Plot.TableCell {
                                            await DivC("avatar \(color.backgroundLiteCSS)") {
                                                Text(colorPrifix(color))
                                            }
                                        }
                                    }
                                }
                                Plot.TableRow {
                                    for color in Colors.allColors {
                                        Plot.TableCell {
                                            await DivC("avatar \(color.textCSS) bg-transparent") {
                                                Text(colorPrifix(color))
                                            }
                                        }
                                    }
                                }
                                Plot.TableRow {
                                    for color in Colors.allColors {
                                        Plot.TableCell {
                                            await DivC("avatar \(color.textCSS) bg-transparent") {
                                                Text(colorPrifix(color))
                                            }
                                        }
                                    }
                                }.class("bg-light")
                                Plot.TableRow {
                                    for color in Colors.allColors {
                                        Plot.TableCell {
                                            await DivC("avatar \(color.textCSS) bg-transparent") {
                                                Text(colorPrifix(color))
                                            }
                                        }
                                    }
                                }.class("bg-dark text-white")
                                Plot.TableRow {
                                    for color in Colors.allColors {
                                        Plot.TableCell {
                                            await DivC("avatar \(color.backgroundLiteCSS)") {
                                                Text(colorPrifix(color))
                                            }
                                        }
                                    }
                                }.class("bg-dark text-white")
                            }.class("table text-center")
                        }
                    })
                )
            }
        }))
    }
}
