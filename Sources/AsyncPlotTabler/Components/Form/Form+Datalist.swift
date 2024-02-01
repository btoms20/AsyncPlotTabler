//
//  Form+Datalist.swift
//  PlotTabler
//

import Plot
import Foundation

extension Plot.Form {
    struct DataList:Component {
        
        let uuid:UUID
        let placeholder:String?
        let options:[Selection.Option]
        
        init(uuid: UUID = UUID(), placeholder: String? = nil, options: [Selection.Option]) {
            self.uuid = uuid
            self.placeholder = placeholder
            self.options = options
        }
        
        func body() async -> Component {
            await ComponentGroup {
                await Element(name: "input") { }
                    .attribute(named: "list", value: "datalist-\(uuid)-options")
                    .optionalAttribute(name: "placeholder", value: placeholder)
                    .class("form-control")
                await Element(name: "datalist") {
                    for option in options {
                        await Element(name: "option") { option.label }
                            .attribute(named: "value", value: option.value)
                    }
                }
                .id("datalist-\(uuid)-options")
            }
        }
    }
}

