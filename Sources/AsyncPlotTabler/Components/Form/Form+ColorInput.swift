//
//  Form+ColorInput.swift
//  PlotTabler
//

import Plot
import Foundation

public struct ColorInput: Component {
    
    public enum Style {
        case rectangular
        case rounded
        
        var css:String {
            switch self {
            case .rounded: "rounded-circle"
            case .rectangular: ""
            }
        }
    }
    
    let style:Style
    let name:String
    let colors:[Colors]
    let defaultValue:Colors?
    let isRequired:Bool
    
    public init(style: Style = .rectangular, name: String, colors: [Colors]? = nil, defaultValue: Colors? = nil, isRequired: Bool = false) {
        self.style = style
        self.name = name
        self.colors = colors ?? Colors.allColors
        self.defaultValue = defaultValue
        self.isRequired = isRequired
    }
    
    public func body() async -> Component {
        await DivC("row g-2") {
            for color in colors {
                await DivC("col-auto") {
                    await Element(name: "label") {
                        Input(type: .radio, name: name, value: color.css, isRequired: isRequired)
                            .class("form-colorinput-input")
                            .optionalAttribute(color == defaultValue, name: "checked", ignoreValueIfEmpty: false)
                        Span { }.class("form-colorinput-color \(color.backgroundCSS)").class(style.css)
                    }.class("form-colorinput")
                }
            }
        }
    }
}
