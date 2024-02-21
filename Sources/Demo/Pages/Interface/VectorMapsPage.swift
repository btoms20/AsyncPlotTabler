import AsyncPlotTabler

/// Vactor Map Demo Page
struct VectorMapsPage: Component {
    
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(header: .init(header: "Vector Maps"), content: {
            await CardVStack {
                await CardHStack {
                    await Card(body: .init({
                        Card.Title("World Map - Regular")
                        await DivC("ratio ratio-4x3") {
                            Div {
                                SVGMap(projection: .regular, visualizeData: .init(scale: [.custom("bg-surface"), .primary], values: MockData.MapRegionData))
                            }
                        }
                    }))
                    
                    await Card(body: .init({
                        Card.Title("World Map - Mercator")
                        await DivC("ratio ratio-4x3") {
                            Div {
                                SVGMap(projection: .mercator, visualizeData: .init(scale: [.custom("bg-surface"), .primary], values: MockData.MapRegionData))
                            }
                        }
                    }))
                }
                
                await CardHStack {
                    await Card(body: .init({
                        Card.Title("Map with markers")
                        await DivC("ratio ratio-4x3") {
                            Div {
                                SVGMap(projection: .mercator, markers: .init(markers: MockData.MapMarkerData))
                            }
                        }
                    }))
                    
                    await Card(
                        body: .init({
                            Card.Title("Map with markers and lines")
                            await DivC("ratio ratio-4x3") {
                                Div {
                                    SVGMap(
                                        projection: .mercator,
                                        markers: .init(
                                            markerStyle: .init(initial: .init(fill: .azure), hover: .init(stroke: .azure, fill: .azure)),
                                            markers: MockData.MapMarkerData
                                        ),
                                        lines: .init(lines: MockData.MapMarkerLines)
                                    )
                                }
                            }
                        })
                    )
                }
            }
        }))
    }
}
