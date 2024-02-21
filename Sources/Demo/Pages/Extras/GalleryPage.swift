import AsyncPlotTabler

/// Gallery Demo Page
struct GalleryPage: Component {
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(
            header: .init(header: {
                H2 { Text("Gallery") }.class("page-title")
                await DivC("mt-1") { Text("1-12 of 241 photos") }.textColor(.secondary)
            }, actions: {
                Plot.Form.Textfield(type: .search, name: "search-photo", value: nil, placeholder: "Search photo...", isRequired: false)
                    .class("d-inline-block w-9 me-3")
                ButtonLink("Add Photo", link: "#", icon: .plus)
            }),
            content: {
                await CardVStack {
                    for chunk in MockData.Photos.prefix(12).chunks(ofCount: 3) {
                        await CardHStack {
                            for photo in chunk {
                                let user = MockData.Users.randomElement()!
                                await Card(
                                    size: .large(.num(4)),
                                    image: .init(src: photo.src, size: .init(width: 0, height: 0), position: .top, description: photo.alt),
                                    body: .init({
                                        await DivC("d-flex align-items-center") {
                                            Avatar(size: .md, user.avatar)
                                                .margin(.trailing(3))
                                            Div {
                                                Div { Text(user.name) }
                                                Div { Text("\(Int.random(in: 1...10)) days ago") }.textColor(.secondary)
                                            }
                                            await DivC("ms-auto") {
                                                Plot.Link(url: "#") {
                                                    SVGIcon(icon: .eye)
                                                    Text("\(Int.random(in: 1...500))")
                                                }
                                                .textColor(.secondary)
                                                
                                                Plot.Link(url: "#") {
                                                    SVGIcon(icon: .heart)
                                                    Text("\(Int.random(in: 1...50))")
                                                }
                                                .textColor(.secondary)
                                                .margin(.leading(3))
                                            }
                                        }
                                    })
                                )
                            }
                        }
                    }
                }
            })
        )
    }
}
