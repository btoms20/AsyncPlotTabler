//
//  Form+NoUISlider.swift
//  PlotTabler
//

import Plot
import Foundation

extension Plot.Form {
    public struct NoUISlider:Component {
        
        @EnvironmentValue(.dependencies) var deps
        
        public enum Style {
            case regular(defaultStart:Int?)
            case range(defaultStart:Int?, defaultEnd:Int?, limit:Int? = nil, margin:Int? = nil)
            
            var connectValue:String {
                switch self {
                case .regular: "true, false"
                case .range: "false, true, false"
                }
            }
            
            func startValue(_ range:ClosedRange<Int>) -> String {
                switch self {
                case .regular(let start):
                    return "\(start ?? range.lowerBound)"
                case .range(let start, let end, _, _):
                    return "[\(start.clamped(to: range) ?? range.lowerBound), \(end.clamped(to: range) ?? range.upperBound)]"
                }
            }
            
            func limitAndMarginValue() -> String {
                switch self {
                case .regular:
                    return ""
                case .range(_, _, let limit, let margin):
                    var str = ""
                    if let limit { str += "\n\t\t\tlimit: \(limit)," }
                    if let margin { str += "\n\t\t\tmargin: \(margin)," }
                    return str
                }
            }
        }
        
        public enum Orientation:String {
            case horizontal
            case vertical
        }
        
        public enum Padding {
            case padding(Int)
            case leading(Int, trailing:Int)
            
            var optionString:String {
                switch self {
                case .padding(let amount):
                    "\(amount)"
                case .leading(let leading, let trailing):
                    "[\(leading), \(trailing)]"
                }
            }
        }
        
        let uuid:UUID
        let name:String
        let range:ClosedRange<Int>
        let step:Int
        let color:Colors
        let style:Style
        let orientation:Orientation
        let tooltips:Bool
        let padding:Padding
        var script:String
        
        private let varName:String
        
        public init(uuid: UUID = UUID(), name:String, range: ClosedRange<Int>, style: Style? = nil, orientation:Orientation = .horizontal, step:Int? = nil, color: Colors = .primary, tooltips:Bool = false, padding:Padding = Padding.padding(0)) {
            self.uuid = uuid
            self.name = name
            self.range = range
            self.step = step ?? (range.upperBound - range.lowerBound) / 10
            self.color = color
            self.style = style ?? .regular(defaultStart: range.lowerBound)
            self.orientation = orientation
            self.tooltips = tooltips
            self.padding = padding
            
            self.varName = "slider\(self.uuid.uuidString.prefix(5))"
            self.script = ""
            self.script = """

            document.addEventListener("DOMContentLoaded", function () {
                 if(window.noUiSlider) {
                    var \(varName) = noUiSlider.create(document.getElementById('range-\(uuid.uuidString)'), {
                      start: \(self.style.startValue(range)),
                      connect: [\(self.style.connectValue)],
                      step: \(self.step),
                      orientation: '\(self.orientation)',
                      tooltips: \(self.tooltips.description),
                      padding: \(self.padding.optionString),\(self.style.limitAndMarginValue())
                      range: {
                          min: \(self.range.lowerBound),
                          max: \(self.range.upperBound)
                      }
                    });
                    \(self.buildSliderCallbackScript())
                }
            });
            
            """
        }
        
        private func buildSliderCallbackScript() -> String {
            switch self.style {
            case .regular:
                return """
                document.getElementById('range-input-\(uuid.uuidString)').value = \(varName).get();
                        \(varName).on("change", function() {
                            document.getElementById('range-input-\(uuid.uuidString)').value = \(varName).get();
                        });
                """
            case .range:
                return """
                document.getElementById('range-input-min-\(uuid.uuidString)').value = \(varName).get()[0];
                        document.getElementById('range-input-max-\(uuid.uuidString)').value = \(varName).get()[1];
                        \(varName).on("change", function() {
                            document.getElementById('range-input-min-\(uuid.uuidString)').value = \(varName).get()[0];
                            document.getElementById('range-input-max-\(uuid.uuidString)').value = \(varName).get()[1];
                        });
                """
            }
        }
        
        /*
         <div class="form-range mb-2" id="range-simple"></div>
         */
        public func body() async -> Component {
            deps.addJSSource("/libs/nouislider/dist/nouislider.min.js")
            deps.addRawScript(self.script)
            
            return await DivC("form-range mb-2") {
                switch self.style {
                case .regular:
                    Input(type: .hidden, name: name)
                        .id("range-input-\(uuid.uuidString)")
                case .range:
                    Input(type: .hidden, name: "min\(name.capitalized)")
                        .id("range-input-min-\(uuid.uuidString)")
                    Input(type: .hidden, name: "max\(name.capitalized)")
                        .id("range-input-max-\(uuid.uuidString)")
                }
            }
            .id("range-\(uuid.uuidString)")
            .class(color.textCSS)
        }
    }
}

fileprivate extension Optional<Int> {
    func clamped(to range:ClosedRange<Int>) -> Int? {
        guard let i = self else { return nil }
        return max(min(i, range.upperBound), range.lowerBound)
    }
}
