//
//  Card+Stamp.swift
//  PlotTabler
//

import Foundation
import Plot

extension Card {
    public struct Stamp {
        public enum Size {
            case regular
            case large
            
            var css:String {
                switch self {
                case .regular: ""
                case .large: "card-stamp-lg"
                }
            }
        }
        
        let icon: Icons
        let color: Colors
        let size: Size
        
        public init(icon: Icons, color: Colors, size:Size = .regular) {
            self.icon = icon
            self.color = color
            self.size = size
        }
    }
    
    struct StampComponent:Component {
        let icon:Icons
        let bgColor:Colors
        let size:Stamp.Size
        let textPrimary:Bool
        
        init(stamp: Stamp, textPrimary: Bool) {
            self.icon = stamp.icon
            self.bgColor = stamp.color
            self.size = stamp.size
            self.textPrimary = textPrimary
        }
        
        init(icon: Icons, bgColor: Colors, textPrimary: Bool) {
            self.icon = icon
            self.bgColor = bgColor
            self.size = .regular
            self.textPrimary = textPrimary
        }
        
        func body() async -> Component {
            await DivC("card-stamp") {
                await DivC("card-stamp-icon") {
                    SVGIcon(icon: icon)
                }
                .class("bg-\(bgColor.css)")
                .class(textPrimary ? "text-primary" : "")
            }.class(size.css)
        }
    }
}
