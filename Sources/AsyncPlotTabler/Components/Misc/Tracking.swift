//
//  Tracking.swift
//  PlotTabler
//

import Plot

struct Tracking:Component {
    
    struct Block {
        let color:Colors
        let title:String
    }
    
    let blocks:[Block]
    
    func body() async -> Component {
        await DivC("tracking") {
            for block in blocks {
                await DivC("tracking-block") { }
                .class(block.color.backgroundCSS)
                .attribute(named: "data-bs-toggle", value: "tooltip")
                .attribute(named: "data-bs-placement", value: "top")
                .attribute(named: "title", value: block.title)
            }
        }
    }
}
