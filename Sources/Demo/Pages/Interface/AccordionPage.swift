import AsyncPlotTabler

/// Accordion Demo View
struct AccordionPage: Component {
    
    func darkBGCSS(_ theme:ButtonLink.Theme) -> String {
        if case .light = theme { return "bg-dark" } else { return "" }
    }
    
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(header: .init(header: "Accordion"), content: {
            await CardVStack {
                ExampleAccordion()
                
                await CardHStack {
                    ExampleAccordion()
                    ExampleAccordion()
                }
            }
        }))
    }
}

fileprivate struct ExampleAccordion:Component {
    func body() async -> Plot.Component {
        await Card(
            body: .init({
                await Accordion(items: [
                    .init(header: Button { Text("Accordion Item #1") }) {
                        await Element(name: "strong") {
                            Text("This is the first item's accordion body. ")
                        }
                        ExampleText()
                    },
                    .init(header: Button { Text("Accordion Item #2") }) {
                        await Element(name: "strong") {
                            Text("This is the second item's accordion body. ")
                        }
                        ExampleText()
                    },
                    .init(header: Button { Text("Accordion Item #3") }) {
                        await Element(name: "strong") {
                            Text("This is the third item's accordion body. ")
                        }
                        ExampleText()
                    },
                    .init(header: Button { Text("Accordion Item #4") }) {
                        await Element(name: "strong") {
                            Text("This is the fourth item's accordion body. ")
                        }
                        ExampleText()
                    }
                ])
            })
        )
    }
}

fileprivate struct ExampleText:Component {
    func body() async -> Plot.Component {
        await ComponentGroup {
            Text("It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the ")
            await Element(name: "code") {
                Text(".accordion-body")
            }
            Text(", though the transition does limit overflow.")
        }
    }
}
