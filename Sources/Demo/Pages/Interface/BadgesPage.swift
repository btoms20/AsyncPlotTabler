import AsyncPlotTabler

/// Badges Demo View
struct BadgesPage: Component {
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(header: .init(header: "Icons"), content: {
            await CardVStack {
                await CardHStack {
                    await Card(size: .large(.num(4)),
                        body: .init({
                            H1 {
                                Text("Example Heading")
                                Span { Text("New") }
                                    .class("badge")
                            }
                            H2 {
                                Text("Example Heading")
                                Span { Text("New") }
                                    .class("badge")
                            }
                            H3 {
                                Text("Example Heading")
                                Span { Text("New") }
                                    .class("badge")
                            }
                            H4 {
                                Text("Example Heading")
                                Span { Text("New") }
                                    .class("badge")
                            }
                            H5 {
                                Text("Example Heading")
                                Span { Text("New") }
                                    .class("badge")
                            }
                            H6 {
                                Text("Example Heading")
                                Span { Text("New") }
                                    .class("badge")
                            }
                        })
                    )
                    await CardVStack {
                        await Card(
                            body: .init({
                                await DivC("badges-list") {
                                    for color in Colors.allColors {
                                        await Badge(color: color) {
                                            Text("\(color)")
                                        }
                                    }
                                }
                            })
                        )
                        await Card(
                            body: .init({
                                await DivC("badges-list") {
                                    for color in Colors.allColors {
                                        await Badge(fill: .light, color: color) {
                                            Text("\(color)")
                                        }
                                    }
                                }
                            })
                        )
                        await Card(
                            body: .init({
                                await DivC("badges-list") {
                                    for color in Colors.allColors {
                                        await Badge(fill: .outline, color: color) {
                                            Text("\(color)")
                                        }
                                    }
                                }
                            })
                        )
                    }
                }
                
                await CardHStack {
                    await Column(size: .large(.num(3)), .small(.num(6))) {
                        await DivC("dropdown-menu dropdown-menu-demo dropdown-menu-arrow") {
                            await DivC("dropdown-item") {
                                Text("Action")
                                await Badge { Text("12") }.class("ms-auto")
                            }
                            await DivC("dropdown-item") {
                                Text("Another action")
                                await Badge(color: .green) {}.class("ms-auto")
                            }
                        }
                    }
                    
                    await CardVStack {
                        await Card(
                            body: .init({
                                await DivC("btn-list") {
                                    for (i, color) in Colors.allColors.enumerated() {
                                        await RawButton(withBadge: .inlineBadge(.solid, "\(i + 1)", color), {
                                            Text("\(color) badge")
                                        })
                                    }
                                }
                            })
                        )
                        
                        await Card(
                            body: .init({
                                await DivC("btn-list") {
                                    for (i, color) in Colors.allColors.enumerated() {
                                        await RawButton({
                                            H4 {
                                                Text("\(color) badge")
                                                await Badge(fill: .outline, shape: .pill, color: color) {
                                                    Text("\(i + 1)+")
                                                }.style("margin-left:8px")
                                            }.class("m-1")
                                        })
                                    }
                                }
                            })
                        )
                        
                        await Card(
                            body: .init({
                                await DivC("btn-list") {
                                    for (i, color) in Colors.allColors.enumerated() {
                                        await RawButton(withBadge: .cornerPill(.solid, "\(i + 1)", color)) {
                                            Text("\(color) badge")
                                        }
                                    }
                                }
                            })
                        )
                        
                        await Card(
                            body: .init({
                                await DivC("btn-list") {
                                    for color in Colors.allColors {
                                        await RawButton(withBadge: .blinkingDot(color)) {
                                            Text("\(color) badge")
                                        }
                                    }
                                }
                            })
                        )
                    }
                }
            }
        }))
    }
}
