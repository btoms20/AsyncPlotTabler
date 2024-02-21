import AsyncPlotTabler

/// Flags Demo Page
struct FlagsPage: Component {
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(header: .init(header: "Flags"), content: {
            await CardVStack {
                await Card(
                    header: .init({
                        Card.Title("List of all flags")
                     }),
                     body: .init({
                         await DivC("demo-icons-list-wrap") {
                             await DivC("demo-icons-list") {
                                 for flag in Flags.allCases {
                                     FlagIcon(tooltip: true, flag: flag)
                                         .class("demo-icons-list-item")
                                 }
                             }
                         }
                     }, class: "p-0")
                )
            }
        }))
    }
}

