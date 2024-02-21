import AsyncPlotTabler

struct PaginationPage: Component {
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(header: .init(header: "Pagination"), content: {
            await CardVStack {
                await Card(
                    body: .init({
                        Card.Title("Regular")
                        
                        Pagination(style: .regular, textLabels: true, currentPage: 1, totalPages: 5)
                        
                        Pagination(style: .regular, textLabels: false, currentPage: 2, totalPages: 5)
                    })
                )
                
                CardGroup(cards: [
                    await Card(body: .init({
                        Card.Title("Bounded Start")
                        Pagination(style: .bounded(count: 2), textLabels: false, currentPage: 2, totalPages: 12)
                    })),
                    await Card(body: .init({
                        Card.Title("Bounded Middle")
                        Pagination(style: .bounded(count: 2), textLabels: false, currentPage: 6, totalPages: 12)
                    })),
                    await Card(body: .init({
                        Card.Title("Bounded End")
                        Pagination(style: .bounded(count: 2), textLabels: false, currentPage: 11, totalPages: 12)
                    }))
                ])
                
                await Card(
                    header: .init({
                        Card.Title("Previous / Next Page Navigation")
                    }),
                    body: .init({
                        Pagination(style: .previousNext(
                            prev: .init(url: "#", title: "Getting Started", subtitle: "previous", disabled: true),
                            next: .init(url: "#", title: "Breadcrumbs", subtitle: "next", disabled: false)
                        ))
                    }),
                    footer: .init({
                        Markdown.CodeBlock(code: """
                        Pagination(style: .previousNext(
                            prev: .init(url: "#", title: "Getting Started", subtitle: "previous", disabled: true),
                            next: .init(url: "#", title: "Breadcrumbs", subtitle: "next", disabled: false)
                        ))
                        """)
                    })
                )
            }
        }))
    }
}
