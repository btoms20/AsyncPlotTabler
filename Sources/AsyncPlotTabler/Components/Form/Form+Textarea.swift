//
//  Form+Textarea.swift
//  PlotTabler
//

import Plot

extension Plot.Form {
    public struct Textarea:Component {
        let name:String
        let value:String?
        let placeholder:String?
        let rows:Int?
        let isRequired:Bool
        let disabled:Bool
        let readonly:Bool
        let autosize:Bool
        
        public init(name: String, value: String? = nil, placeholder: String? = nil, rows:Int? = nil, isRequired: Bool = true, disabled: Bool = false, readonly: Bool = false, autosize:Bool = false) {
            self.name = name
            self.value = value
            self.placeholder = placeholder
            self.rows = rows
            self.isRequired = isRequired
            self.disabled = disabled
            self.readonly = readonly
            self.autosize = autosize
        }
        
        public func body() async -> Component {
            TextArea(text: value ?? "", name: name, numberOfRows: rows, numberOfColumns: nil, isRequired: isRequired)
                .class("form-control")
                .class(disabled ? "disabled" : "")
                .attribute(named: "placeholder", value: placeholder)
                .optionalAttribute(autosize, name: "data-bs-toggle", value: "autosize")
        }
    }
}
