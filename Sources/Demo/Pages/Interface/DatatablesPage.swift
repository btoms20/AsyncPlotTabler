import AsyncPlotTabler
import Foundation

/// Datatables Demo View
struct DatatablesPage: Component {
    
    let mockdata:[MockData.Person] = [
        .init(name: "Steel Vengeance", city: "Cedar Point, United States", type: "RMC Hybrid", score: 100.0, date: Date.now, quantity: 74, progress: 30),
        .init(name: "Fury 325", city: "Carowinds, United States", type: "B&M Giga, Hyper, Steel", score: 99.3, date: Date.now, quantity: 49, progress: 48),
        .init(name: "Wildfire", city: "Kolmården  Sweden", type: "RMC Twister, Wooden, Terrain", score: 99.3, date: Date.now, quantity: 8, progress: 9),
        .init(name: "Lightning Rod", city: "Dollywood, United States", type: "RMC Wooden", score: 99.1, date: Date.now, quantity: 104, progress: 98),
        .init(name: "Maverick", city: "Cedar Point, United States", type: "Intamin Rocket, Steel", score: 99.1, date: Date.now, quantity: 86, progress: 46),
        .init(name: "El Toro", city: "Six Flags Great Adventure, United States", type: "Intamin Twister, Wooden", score: 99.0, date: Date.now, quantity: 130, progress: 29.0),
        .init(name: "Twisted Colossus", city: "Six Flags Magic Mountain, United States", type: "RMC Hybrid", score: 98.9, date: Date.now, quantity: 30, progress: 57),
        .init(name: "Eejanaika new", city: "Fuji-Q Highland, Japan", type: "S&S Power 4th Dimension, Steel", score: 98.6, date: Date.now, quantity: 162, progress: 91),
        .init(name: "Wicked Cyclone", city: "Six Flags New England, United States", type: "RMC Hybrid", score: 98.2, date: Date.now, quantity: 174, progress: 3),
        .init(name: "Shambhala", city: "Port Aventura, Spain", type: "B&M Hyper, Steel", score: 98.2, date: Date.now, quantity: 111, progress: 24),
        .init(name: "Taron", city: "Phantasialand, Germany", type: "Intamin Sit Down, Steel", score: 98.2, date: Date.now, quantity: 130, progress: 48),
        .init(name: "Expedition Ge Force", city: "Holiday Park, Germany", type: "Intamin Megacoaster, Steel", score: 98.6, date: Date.now, quantity: 157, progress: 57),
        .init(name: "Storm Chaser", city: "Kentucky Kingdom, United States", type: "RMC Steel", score: 97.9, date: Date.now, quantity: 43, progress: 42),
        .init(name: "Helix", city: "Liseberg, Sweden", type: "Mack Looper, Steel, Terrain", score: 97.9, date: Date.now, quantity: 151, progress: 54.0),
        .init(name: "Outlaw Run", city: "Silver Dollar City, United States", type: "RMC Hybrid", score: 96.6, date: Date.now, quantity: 131, progress: 64),
    ]
    
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(header: .init(header: "Datatables"), content: {
            await CardVStack {
                await Card(
                    body: .init({
                        Datatables(data: mockdata)
                    })
                )
            }
        }))
    }
}
