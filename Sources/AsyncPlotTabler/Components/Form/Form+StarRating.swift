//
//  StarRating.swift
//  PlotTabler
//

import Plot
import Foundation

extension Plot.Form {
    /// StarRating
    struct StarRating: Component {
        @EnvironmentValue(.dependencies) var deps
        
        enum Style {
            case fiveStars
            case tenStars
            
            var range:ClosedRange<Int> {
                switch self {
                case .fiveStars: 1...5
                case .tenStars: 1...10
                }
            }
            
            var count:Int {
                switch self {
                case .fiveStars: 5
                case .tenStars: 10
                }
            }
        }
        
        let uuid:UUID
        let icon:Icons
        let color:Colors
        let size:SVGIcon.Size
        let defaultValue:Int
        let style:Style
        let script:String
        
        init(style:Style = .fiveStars, icon: Icons = .star_filled, color: Colors = .yellow, size:SVGIcon.Size = .regular, defaultValue:Int = 0, clearable:Bool = false) async {
            self.uuid = UUID()
            self.icon = icon
            self.color = color
            self.size = size
            self.defaultValue = max(0, min(style.count, defaultValue))
            self.style = style
            self.script = """
            
            document.addEventListener("DOMContentLoaded", function () {
                const rating = new StarRating('#rating-\(uuid.uuidString)', {
                    tooltip: false,
                    clearable: \(clearable),
                    stars: function (el, item, index) {
                        el.innerHTML = `\(await SVGIcon(icon: icon, color: color, size: size).class("gl-star-full").render())`;
                    },
                })
            })
            
            """
        }
        
        private func fiveStarTooltips(_ idx:Int) -> String {
            switch idx {
            case 1: "Terrible"
            case 2: "Poor"
            case 3: "Average"
            case 4: "Very Good"
            case 5: "Excellent"
            default: ""
            }
        }
        
        private func tenStarTooltips(_ idx:Int) -> String {
            switch idx {
            case 1: "Terrible"
            case 3: "Poor"
            case 5: "Average"
            case 7: "Very Good"
            case 10: "Excellent"
            default: ""
            }
        }
        
        /*
         <select id="rating-default">
           <option value="">Select a rating</option>
           <option value="5">Excellent</option>
           <option value="4" selected>Very Good</option>
           <option value="3">Average</option>
           <option value="2">Poor</option>
           <option value="1">Terrible</option>
         </select>
         */
        func body() async -> Component {
            // Libs
            deps.addCSSSource(.star_rating_css)
            deps.addJSSource(.star_rating_js)
            // Script
            deps.addRawScript(self.script)
            
            return await ComponentGroup {
                // Star Rating Component
                await Element(name: "select") {
                    await Element(name: "option") {
                        Text("Select a rating")
                    }
                    .attribute(named: "value", value: "")
                    
                    for i in (style.range).reversed() {
                        await Element(name: "option") {
                            Text(style == .fiveStars ? fiveStarTooltips(i) : tenStarTooltips(i))
                        }
                        .attribute(named: "value", value: "\(i)")
                        .optionalAttribute(i == defaultValue, name: "selected", ignoreValueIfEmpty: false)
                    }
                }
                .id("rating-\(uuid.uuidString)")
            }
        }
    }
}
