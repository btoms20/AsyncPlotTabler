import AsyncPlotTabler

/// ColorPicker Demo View
/// - TODO: Get color pickers rendering in our WebView Preview
struct ColorPickerPage: Component {
    
    var defaultColors:[String] = [
        "#0054a6",
        "#45aaf2",
        "#6574cd",
        "#a55eea",
        "#f66d9b",
        "#fa4654",
        "#fd9644",
        "#f1c40f",
        "#7bd235",
        "#5eba00",
        "#2bcbba",
        "#17a2b8",
    ]
    
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(header: .init(header: "Color Picker"), content: {
            await CardVStack {
                await Card(
                    body: .init({
                        Card.Title("Basic ColorPicker Components")
                        await DivC("row g-3") {
                            for color in defaultColors {
                                await DivC("col-2") {
                                    Plot.Form.ColorPicker(defaultColor: color, style: .fancy(swatches: []))
                                }
                            }
                        }
                    })
                )
            }
        }))
    }
}
