//
//  Tracking.swift
//  PlotTabler
//

import Plot

public struct Tracking:Component {
    
    public struct Block {
        let color:Colors
        let title:String
    }
    
    let blocks:[Block]
    
    public init(blocks: [Block]) {
        self.blocks = blocks
    }
    
    public func body() async -> Component {
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
