import AsyncPlotTabler

/// Models Demo View
struct ModelsPage: Component {
    
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(
            header: .init(header: "Models"),
            content: {
                await CardVStack {
                    await CardHStack {
                        await Card(
                            size: .full(.num(12)),
                            body: .init({
                                ModelView(load: .gltf("./static/models/Duck.glb"))
                            }),
                            footer: .init({
                                Text("Default Options")
                            })
                        )
                        await Card(
                            size: .full(.num(12)),
                            body: .init({
                                ModelView(load: .gltf("./static/models/Fox.glb"), options: .init(offset: 0.8, animations: .init(.disabled)))
                            }),
                            footer: .init({
                                Text("Animations disabled")
                            })
                        )
                        await Card(
                            size: .full(.num(12)),
                            body: .init({
                                ModelView(load: .gltf("./static/models/MorphStressTest.glb"), options: .init(zoom: .init(enabled: true)))
                            }),
                            footer: .init({
                                Text("Zoom enabled")
                            })
                        )
                        await Card(
                            size: .full(.num(12)),
                            body: .init({
                                ModelView(load: .gltf("./static/models/MaterialsVariantsShoe.glb"), options: .init(animations: .init(.enabled(speed: -0.005))))
                            }),
                            footer: .init({
                                Text("Reversed Animation")
                            })
                        )
                    }
                    
                    await Card(
                        size: .full(.num(12)),
                        status: .init(position: .leading, color: .green),
                        ribbon: .init(style: .icon(.plant), color: .green),
                        body: .init({
                            ModelView(load: .gltf("./static/models/basil.glb"), options: .init(minHeight: 700, offset: 0.8, animations: .init(.enabled(speed: 0.01)), lightIntisity: 1.0))
                        }),
                        footer: .init({
                            Text("Basil Photogrammetry - 10 days since planting")
                        })
                    )
                }
            })
        )
    }
}

