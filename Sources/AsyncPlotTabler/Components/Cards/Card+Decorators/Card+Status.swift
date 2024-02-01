//
//  Card+Status.swift
//  PlotTabler
//

import Foundation
import Plot

extension Card {
    public struct Status {
        public enum Position {
            case top
            case bottom
            case leading
            
            var css:String {
                switch self {
                case .top: "card-status-top"
                case .bottom: "card-status-bottom"
                case .leading: "card-status-start"
                }
            }
        }
        
        let position: Position
        let color: Colors
        
        public init(position: Position, color: Colors) {
            self.position = position
            self.color = color
        }
    }
    
    struct StatusComponent:Component {
        let status:Status
        
        /*
         <div class="card-status-top bg-danger"></div>
         */
        func body() async -> Component {
            Div { }
                .class(status.position.css)
                .class("bg-\(status.color.css)")
        }
    }
}
