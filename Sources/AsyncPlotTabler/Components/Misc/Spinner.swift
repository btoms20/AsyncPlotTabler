//
//  Spinner.swift
//  PlotTabler
//

import Plot

struct Spinner: Component {
    
    enum Wrapper {
        case div
        case span
    }
    
    enum Style {
        case border
        case solid
        case dots
        
        var css:String {
            switch self {
            case .border: "spinner-border"
            case .solid: "spinner-grow"
            case .dots: "animated-dots"
            }
        }
    }
    
    enum Size {
        case regular
        case small
        
        var css:String {
            switch self {
            case .regular: ""
            case .small: "spinner-border-sm"
            }
        }
    }
    
    let wrapper:Wrapper
    let type:Style
    let size:Size
    let color:Colors?
    
    init(wrapper: Wrapper = .div, type: Style = .border, size: Size = .regular, color: Colors? = nil) {
        self.wrapper = wrapper
        self.type = type
        self.size = size
        self.color = color
    }
    
    /*
     <div class="spinner-border" role="status"></div>
     */
    func body() async -> Component {
        switch wrapper {
        case .div:
            return Div { }
                .class(type.css)
                .class(size.css)
                .class(color?.textCSS ?? "")
                .attribute(named: "role", value: "status")
        case .span:
            return Span { }
                .class(type.css)
                .class(size.css)
                .class(color?.textCSS ?? "")
                .attribute(named: "role", value: "status")
        }
    }
}
