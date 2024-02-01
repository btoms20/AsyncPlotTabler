//
//  HRule.swift
//  PlotTabler
//

import Plot

public struct HRule: Component {
    
    public struct Options {
        let position:Position?
        let color:Colors?
        
        public init(position: Position? = nil, color: Colors? = nil) {
            self.position = position
            self.color = color
        }
    }
    
    public enum Style {
        case regular
        case text(String, Options?)
    }
    
    public enum Position {
        case left
        case center
        case right
        
        var css:String {
            switch self {
            case .left: "hr-text-left"
            case .center: ""
            case .right: "hr-text-right"
            }
        }
    }
    
    let style:Style
    
    public init(style: Style) {
        self.style = style
    }
    
    public func body() async -> Component {
        switch style {
        case .regular: return await Element(name: "hr") { EmptyComponent() }
        case .text(let str, let opts):
            return await DivC("hr-text") {
                Span { Text(str) }
            }
            .class(opts?.position?.css ?? "")
            .class(opts?.color?.textCSS ?? "")
        }
    }
}
