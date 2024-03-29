//
//  Form+SwitchIcon.swift
//  PlotTabler
//

import Plot

extension Plot.Form {
    
    public struct Switch:Component {
        public struct IconState {
            let icon:Icons
            let color:Colors
            let animation:SVGIcon.Animation?
            
            public init(icon: Icons, color: Colors, animation: SVGIcon.Animation? = nil) {
                self.icon = icon
                self.color = color
                self.animation = animation
            }
        }
        
        public enum Animation {
            public enum Direction:String {
                case up
                case left
                case down
                case right
            }
            
            case fade
            case scale
            case flip
            case slide(Direction)
            
            var css:String {
                switch self {
                case .fade: "switch-icon-fade"
                case .scale: "switch-icon-scale"
                case .flip: "switch-icon-flip"
                case .slide(let dir):
                    "switch-icon-slide-\(dir.rawValue)"
                }
            }
        }
        
        let on:IconState
        let off:IconState
        let size:SVGIcon.Size
        let animation:Animation?
        let checked:Bool
        
        public init(off: IconState, on: IconState, size: SVGIcon.Size = .regular, animation: Animation? = nil, checked:Bool = false) {
            self.on = on
            self.off = off
            self.size = size
            self.animation = animation
            self.checked = checked
        }
        
        public func body() async -> Component {
            Button {
                Span {
                    SVGIcon(icon: off.icon, color: off.color, size: size, animation: off.animation)
                }
                .class("switch-icon-a")
                Span {
                    SVGIcon(icon: on.icon, color: on.color, size: size, animation: on.animation)
                }
                .class("switch-icon-b")
            }
            .class("switch-icon")
            .class(checked ? "active" : "")
            .class(animation?.css ?? "")
            .attribute(named: "data-bs-toggle", value: "switch-icon")
        }
    }
    
}
