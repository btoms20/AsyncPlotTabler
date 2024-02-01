//
//  Card+Ribbon.swift
//  PlotTabler
//

import Foundation
import Plot

extension Card {
    public struct Ribbon {
        public enum Position {
            case top
            case trailing
            
            var css:String {
                switch self {
                case .top: "ribbon ribbon-top"
                case .trailing: "ribbon"
                }
            }
        }
        
        public enum Style {
            case icon(Icons)
            case text(String)
            case custom(Component)
            
            var component:Component {
                switch self {
                case .icon(let icon):
                    SVGIcon(icon: icon)
                case .text(let str):
                    Text(str)
                case .custom(let component):
                    component
                }
            }
        }
        
        let style: Style
        let color: Colors
        let position: Position
        
        public init(style:Style, color: Colors, position: Position = .trailing) {
            self.style = style
            self.color = color
            self.position = position
        }
    }
    
    struct RibbonComponent:Component {
        let ribbon:Ribbon
        
        /*
         <div class="ribbon bg-red">NEW</div>
         */
        func body() async -> Component {
            Div { ribbon.style.component }
                .class(ribbon.position.css)
                .class("bg-\(ribbon.color.css)")
        }
    }
}
