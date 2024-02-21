import AsyncPlotTabler

/// Steps Demo Page
struct StepsPage: Component {
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(header: .init(header: "Steps"), content: {
            await CardVStack {
                await CardHStack {
                    
                    await Card(
                        size: .large(.num(8)),
                        body: .init({
                            Card.Title("Steps Horizontal")
                            await Card.Body {
                                await Steps(style: .regular, color: .red, activeIndex: 1, steps: [
                                    .init({Text("1")}),
                                    .init({Text("2")}),
                                    .init({Text("3")})
                                ])
                            }
                            await Card.Body {
                                await Steps(style: .counter, color: .purple, steps: 3, activeIndex: 1)
                            }
                            await Card.Body {
                                await Steps(style: .counter, color: .green, activeIndex: 1, steps: [
                                    .init({Text("Cart")}),
                                    .init({Text("Billing Information")}),
                                    .init({Text("Confirmation")})
                                ])
                            }
                            await Card.Body {
                                await Steps(style: .breadcrumb(.arrow), activeIndex: 1, steps: [
                                    .init({Text("Step one")}),
                                    .init({Text("Step two")}),
                                    .init({Text("Step three")}),
                                    .init({Text("Step four")})
                                ])
                            }
                            await Card.Body {
                                await Steps(style: .breadcrumb(.regular), activeIndex: 2, steps: [
                                    .init({Text("1. Step one")}),
                                    .init({Text("2. Step two")}),
                                    .init({Text("3. Step three")}),
                                    .init({Text("4. Step four")}),
                                    .init({Text("5. Step five")})
                                ])
                            }
                            await Card.Body {
                                await Steps(style: .breadcrumb(.muted), color: .dark, activeIndex: 2, steps: [
                                    .init({Text("1. Step one")}),
                                    .init({Text("2. Step two")}),
                                    .init({Text("3. Step three")}),
                                    .init({Text("4. Step four")}),
                                    .init({Text("5. Step five")})
                                ])
                            }
                        })
                    )
                    
                    await Card(
                        body: .init({
                            Card.Title("Steps Vertical")
                            
                            await Card.Body {
                                await Steps(style: .vertical, activeIndex: 2, steps: [
                                    .init({
                                        await H4("Order received").class("m-0")
                                        await Div("Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus culpa cum expedita ipsam laborum nam ratione reprehenderit sed sint tenetur!")
                                            .class("text-secondary")
                                    }),
                                    .init({
                                        await H4("Order shipped").class("m-0")
                                        await Div("Lorem ipsum dolor sit amet.")
                                            .class("text-secondary")
                                    }),
                                    .init({
                                        await H4("Out for delivery").class("m-0")
                                        await Div("Accusamus culpa cum expedita ipsam laborum nam ratione")
                                            .class("text-secondary")
                                    }),
                                    .init({
                                        await H4("Finalized").class("m-0")
                                        await Div("Laborum nam ratione reprehenderit sed sint tenetur!")
                                            .class("text-secondary")
                                    }),
                                ])
                            }
                            
                            await Card.Body {
                                await Steps(style: .verticalCounter, color: .azure, activeIndex: 2, steps: [
                                    .init({Text("Step one")}),
                                    .init({Text("Step two")}),
                                    .init({Text("Step three")}),
                                    .init({Text("Step four")}),
                                    .init({Text("Step five")})
                                ])
                            }
                            
                        })
                    )
                    
                }
            }
        }))
    }
}
