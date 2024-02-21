import AsyncPlotTabler

/// Pricing Cards Demo View
struct PricingCardsPage: Component {
    
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(header: .init(header: "Pricing cards"), content: {
            await CardVStack {
                await CardHStack {
                    PriceCard(plan: "Free", cost: 0, users: "3", suggested: false, features: [
                        .init(label: "Sharing Tools", enabled: true),
                        .init(label: "Design Tools", enabled: false),
                        .init(label: "Private Messages", enabled: false),
                        .init(label: "Twitter API", enabled: false)
                    ])
                    PriceCard(plan: "Premium", cost: 49, users: "10", suggested: true, features: [
                        .init(label: "Sharing Tools", enabled: true),
                        .init(label: "Design Tools", enabled: true),
                        .init(label: "Private Messages", enabled: false),
                        .init(label: "Twitter API", enabled: false)
                    ])
                    PriceCard(plan: "Enterprise", cost: 99, users: "100", suggested: false, features: [
                        .init(label: "Sharing Tools", enabled: true),
                        .init(label: "Design Tools", enabled: true),
                        .init(label: "Private Messages", enabled: true),
                        .init(label: "Twitter API", enabled: false)
                    ])
                    PriceCard(plan: "Unlimited", cost: 139, users: "Unlimited", suggested: false, features: [
                        .init(label: "Sharing Tools", enabled: true),
                        .init(label: "Design Tools", enabled: true),
                        .init(label: "Private Messages", enabled: true),
                        .init(label: "Twitter API", enabled: true)
                    ])
                }
                
                await Card(body: .init({
                    await Row(alignItemsCenter: true) {
                        await Column {
                            H3 { Text("Enterprise-ready. Reach out for a custom quote") }
                            Paragraph { Text("Tabler is designed to work great for large enterprises. Take a look at our feature comparison.") }
                                .textColor(.secondary)
                        }
                        await Column {
                            ButtonLink("Book a demo", link: "#", style: .outline, theme: .color(.muted))
                        }
                        .class("col-auto")
                    }
                }))
            }
        }))
    }
}

struct PriceCard:Component {
    
    struct Feature {
        let label:String
        let enabled:Bool
    }
    
    let plan:String
    let cost:Int
    let users:String
    let suggested:Bool
    let features:[Feature]
    
    func body() async -> Plot.Component {
        await Card(
            ribbon: suggested ? .init(style: .icon(.star_filled), color: .green, position: .top) : nil,
            body: .init({
                await DivC("text-uppercase text-secondary font-weight-medium") { Text(plan) }
                await DivC("display-5 fw-bold my-3") { Text("$\(cost)") }
                await Element(name: "ul") {
                    await Element(name: "li") {
                        await Element(name: "strong") { Text(users) }
                        Text("&nbsp;Users")
                    }
                    for feature in features {
                        await Element(name: "li") {
                            IconLabel(
                                icon: SVGIcon(icon: feature.enabled ? .check : .x, color: feature.enabled ? .green : .red),
                                text: feature.label
                            )
                        }
                    }
                }
                .class("list-unstyled lh-lg")
                await DivC("text-center mt-4") {
                    if suggested {
                        ButtonLink("Choose Plan", link: "#", style: .standard, theme: .success)
                            .class("w-100")
                    } else {
                        ButtonLink("Choose Plan", link: "#", style: .outline, theme: .color(.muted))
                            .class("w-100")
                    }
                }
            }, class: "text-center")
        )
    }
}
