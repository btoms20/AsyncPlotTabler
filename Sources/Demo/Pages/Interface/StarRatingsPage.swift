import AsyncPlotTabler

/// Star Ratings Demo Page
/// - TODO: Get stars rendering in our WebView Preview
struct StarRatingsPage: Component {
    let margin:Int = 3
    
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(header: .init(header: "Star Ratings"), content: {
            await CardVStack {
                await CardHStack {
                    await CardVStack {
                        await Card(
                            body: .init({
                                Card.Title("Basic / Default")
                                await Plot.Form.StarRating()
                            }, class: "space-y")
                        )
                        
                        await Card(
                            body: .init({
                                Card.Title("Different Icons")
                                await Plot.Form.StarRating(icon: .star_filled, color: .yellow, defaultValue: 4)
                                await Plot.Form.StarRating(icon: .heart_filled, color: .red, defaultValue: 4)
                                await Plot.Form.StarRating(icon: .ghost_filled, color: .orange, defaultValue: 4)
                                await Plot.Form.StarRating(icon: .circle_filled, color: .purple, defaultValue: 4)
                                await Plot.Form.StarRating(icon: .alien_filled, color: .green, defaultValue: 4)
                                await Plot.Form.StarRating(icon: .beer_filled, color: .blue, defaultValue: 4)
                            }, class: "space-y")
                        )
                        
                        await Card(
                            body: .init({
                                Card.Title("10 Stars")
                                await Plot.Form.StarRating(style: .tenStars, icon: .star_filled, color: .yellow, defaultValue: 7)
                            }, class: "space-y")
                        )
                    }
                    
                    await Card(
                        body: .init({
                            Card.Title("Custom Colors")
                            for color in Colors.allColors {
                                await Plot.Form.StarRating(icon: .star_filled, color: color, defaultValue: Int.random(in: 0...5))
                            }
                        }, class: "space-y")
                    )
                    
                    await Card(
                        body: .init({
                            Card.Title("Custom Sizes")
                            await Plot.Form.StarRating(size: .sm, defaultValue: 4)
                            await Plot.Form.StarRating(size: .regular, defaultValue: 4)
                            await Plot.Form.StarRating(size: .md, defaultValue: 4)
                            await Plot.Form.StarRating(size: .lg, defaultValue: 4)
                        }, class: "space-y")
                    )
                }
            }
        }))
    }
}
