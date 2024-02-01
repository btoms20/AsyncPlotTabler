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
            case range(defaultStart:Int?, defaultEnd:Int?)
            
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
                case .range(let start, let end):
                    return "[\(start.clamped(to: range) ?? range.lowerBound), \(end.clamped(to: range) ?? range.upperBound)]"
                }
            }
        }
        
        let uuid:UUID
        let range:ClosedRange<Int>
        let step:Int
        let color:Colors
        let style:Style
        let script:String
        
        public init(uuid: UUID = UUID(), range: ClosedRange<Int>, style: Style? = nil, step:Int? = nil, color: Colors = .primary) {
            self.uuid = uuid
            self.range = range
            self.step = step ?? (range.upperBound - range.lowerBound) / 10
            self.color = color
            self.style = style ?? .regular(defaultStart: range.lowerBound)
            self.script = """

            document.addEventListener("DOMContentLoaded", function () {
                 window.noUiSlider && (noUiSlider.create(document.getElementById('range-\(uuid.uuidString)'), {
                          start: \(self.style.startValue(range)),
                          connect: [\(self.style.connectValue)],
                          step: \(self.step),
                          range: {
                              min: \(self.range.lowerBound),
                              max: \(self.range.upperBound)
                          }
                 }));
            });
            
            """
        }
        
        /*
         <div class="form-range mb-2" id="range-simple"></div>
         */
        public func body() async -> Component {
            deps.addJSSource("/libs/nouislider/dist/nouislider.min.js")
            deps.addRawScript(self.script)
            
            return await DivC("form-range mb-2") { }
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
