import AsyncPlotTabler

/// Search Results Demo Page
struct SearchResultsPage: Component {
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(
            header: .init(header: {
                H2 { Text("Search results: \"stock photos\"") }.class("page-title")
                await DivC("mt-1") { Text("About 2,400 results (0.19 seconds)") }.textColor(.secondary)
            }),
            content: {
                await CardVStack {
                    await Row(g: 4) {
                        await Column(size: .large(.num(3))) {
                            Plot.Form(url: "#", method: .post, enableValidation: false) {
                                await DivC("subheader mb-2") { Text("Category") }
                                await Plot.Form.ListGroup(items: [
                                    .init(link: "#", active: true, title: "Photos", count: 24),
                                    .init(link: "#", active: false, title: "Games", count: 13),
                                    .init(link: "#", active: false, title: "Articles", count: 121),
                                    .init(link: "#", active: false, title: "Memes", count: 42),
                                ])
                                
                                await DivC("subheader mb-2") { Text("Rating") }
                                Plot.Form.CheckboxGroup(name: "search-result-ratings", selection: .one, style: .vertical, items: [
                                    .init(value: "5", label: "5 stars"),
                                    .init(value: "4", label: "4 stars"),
                                    .init(value: "3", label: "3 stars"),
                                    .init(value: "2", label: "2 and fewer stars")
                                ])
                                .margin(.body(3))
                                
                                await DivC("subheader mb-2") { Text("Tags") }
                                Plot.Form.CheckboxGroup(name: "search-result-ratings", selection: .many, style: .vertical, items: [
                                    .init(value: "business", label: "business"),
                                    .init(value: "evening", label: "evening"),
                                    .init(value: "leisure", label: "leisure"),
                                    .init(value: "party", label: "party")
                                ])
                                .margin(.body(3))
                                
                                await DivC("subheader mb-2") { Text("Price") }
                                await Row(alignItemsCenter: true) {
                                    await Column {
                                        await Plot.Form.InputGroup {
                                            await Plot.Form.InputGroupText { Text("$") }
                                            Plot.Form.Textfield(name: "search-result-min-price", placeholder: "min")
                                        }
                                    }
                                    await DivC("col-auto") {
                                        Text("—")
                                    }
                                    await Column {
                                        await Plot.Form.InputGroup {
                                            await Plot.Form.InputGroupText { Text("$") }
                                            Plot.Form.Textfield(name: "search-result-max-price", placeholder: "max")
                                        }
                                    }
                                }
                                
                                await DivC("subheader mb-2") { Text("Shipping") }
                                await Plot.Form.Selection(name: "search-result-shipping", options: [
                                    .init(value: "UK", label: { Text("United Kingdom") }),
                                    .init(value: "USA", label: { Text("United States") }),
                                    .init(value: "GER", label: { Text("Germany") }),
                                    .init(value: "POL", label: { Text("Poland") }),
                                    .init(value: "Other", label: { Text("Other") })
                                ])
                                
                                Div {
                                    ButtonLink("Confirm changes", link: "#")
                                        .class("w-100")
                                    ButtonLink("Reset to defaults", link: "#", theme: .raw)
                                        .class("w-100")
                                }
                                .margin(.top(5))
                            }
                        }
                        
                        await Column {
                            for chunk in MockData.Photos.prefix(24).chunks(ofCount: 3) {
                                await CardHStack {
                                    for photo in chunk {
                                        let user = MockData.Users.randomElement()!
                                        SearchResults.PhotoCard(link: "#", photo: photo, style: .owner(user, withMetrics: nil))
                                    }
                                }
                            }
                        }
                    }
                }
            })
        )
    }
}



struct SearchResults {
    
    struct PhotoCard:Component {
        struct Metrics {
            let views:Int
            let likes:Int
        }
        
        enum Style {
            case simple
            case owner(MockData.User, withMetrics:Metrics?)
        }
        
        let link:URLRepresentable
        let photo:MockData.Photo
        let style:Style
        
        func body() async -> Plot.Component {
            await Card(
                size: .large(.num(4)),
                image: .init(src: photo.src, size: .init(width: 0, height: 0), position: .top, description: photo.alt),
                body: .init({
                    await DivC("d-flex align-items-center") {
                        if case .owner(let user, let metrics) = style {
                            Avatar(size: .md, user.avatar)
                                .margin(.trailing(3))
                            Div {
                                Div { Text(user.name) }
                                Div { Text("\(Int.random(in: 1...10)) days ago") }.textColor(.secondary)
                            }
                            
                            if let metrics {
                                await DivC("ms-auto") {
                                    Plot.Link(url: "#") {
                                        SVGIcon(icon: .eye)
                                        Text("\(metrics.views)")
                                    }
                                    .textColor(.secondary)
                                    
                                    Plot.Link(url: "#") {
                                        SVGIcon(icon: .heart)
                                        Text("\(metrics.likes)")
                                    }
                                    .textColor(.secondary)
                                    .margin(.leading(3))
                                }
                            }
                        } else {
                            if photo.alt.isEmpty {
                                Div { Text(photo.src.description) }
                            } else {
                                Div { Text(photo.alt) }
                            }
                        }
                    }
                })
            )
        }
    }
    
}
