//
//  Toggler.swift
//  PlotTabler
//

import Plot

struct Toggler: Component {
    
    /*
     <label class="form-check form-switch m-0">
       <input class="form-check-input position-static" type="checkbox"  checked>
     </label>
     */
    func body() async -> Component {
        Label("") {
            Input(type: .checkbox)
                .class("form-check-input position-static")
        }
        .class("form-check form-switch m-0")
    }
}
