//
//  Container.swift
//  PlotTabler
//

import Plot

struct Container: Component {
    enum Size:String {
        case xl
    }
    
    let size:Size
    let content:Component
    
    init(size: Size = .xl, @ComponentBuilder content:@escaping () async -> Component) async {
        self.size = size
        self.content = await content()
    }
    
    func body() async -> Component {
        Div {
            content
        }
        .class("container-\(size)")
    }
}

public struct DivC: Component {
    let css:String
    let margin:Margin?
    let content:Component
    
    public init(_ css: String, margin:Margin? = nil, @ComponentBuilder content:@escaping () async -> Component) async {
        self.css = css
        self.margin = margin
        self.content = await content()
    }
    
    public func body() async -> Component {
        Div {
            content
        }
        .class(css)
        .class(margin?.css ?? "")
    }
}
