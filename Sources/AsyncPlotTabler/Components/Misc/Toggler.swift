//
//  Toggler.swift
//  PlotTabler
//

import Plot

public struct Toggler: Component {
    
    let label:String
    
    public init(label: String? = nil) {
        self.label = label ?? ""
    }
    
    /*
     <label class="form-check form-switch m-0">
       <input class="form-check-input position-static" type="checkbox"  checked>
     </label>
     */
    public func body() async -> Component {
        Label(self.label) {
            Input(type: .checkbox)
                .class("form-check-input position-static")
        }
        .class("form-check form-switch m-0")
    }
}
