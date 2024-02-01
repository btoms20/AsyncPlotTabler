//
//  Form+Range.swift
//  PlotTabler
//

import Plot

extension Plot.Form {
    struct Range:Component {
        
        let name:String?
        let value:Int
        let step:Int
        let range:ClosedRange<Int>
        let color:Colors // doesn't have an effect
        let isRequired:Bool
        let isDisabled:Bool
        
        init(name: String? = nil, range: ClosedRange<Int>, value: Int? = nil, step: Int? = nil, color: Colors = .primary, required:Bool = true, disabled:Bool = false) {
            self.name = name
            self.range = range
            self.value = value.clamped(to: range) ?? range.lowerBound
            self.step = step ?? (range.upperBound - range.lowerBound) / 10
            self.color = color
            self.isRequired = required
            self.isDisabled = disabled
        }
        
        /*
         <input type="range" class="form-range mb-2" value="40" min="0" max="100" step="10">
         */
        func body() async -> Component {
            Input(type: .range, name: name, value: "\(value)", isRequired: isRequired)
                .class("form-range mb-2")
                .class(color.textCSS)
                .attribute(named: "min", value: "\(range.lowerBound)")
                .attribute(named: "max", value: "\(range.upperBound)")
                .attribute(named: "step", value: "\(step)")
                .optionalAttribute(isDisabled, name: "disabled")
        }
    }
}

fileprivate extension Optional<Int> {
    func clamped(to range:ClosedRange<Int>) -> Int? {
        guard let i = self else { return nil }
        return max(min(i, range.upperBound), range.lowerBound)
    }
}
