//
//  Form+ToggleGroup.swift
//  PlotTabler
//

import Plot

extension Plot.Form {
    struct ToggleSettingsGroup:Component {
        
        struct Setting {
            let value:Bool
            let label:String
            let description:String?
            let color:Colors
            
            init(value: Bool = false, label: String, description: String? = nil, color: Colors = .primary) {
                self.value = value
                self.label = label
                self.description = description
                self.color = color
            }
        }
        
        let title:String
        let settings:[Setting]
        
        func body() async -> Component {
            await ComponentGroup {
                Plot.Form.Label(self.title)
                await DivC("divide-y") {
                    for item in settings {
                        Div {
                            await Element(name: "label") {
                                await DivC("col") {
                                    Span { Text(item.label) }
                                    if let desc = item.description {
                                        Div { Text(desc) }.class("text-secondary mb-0")
                                    }
                                }
                                Span {
                                    Plot.Form.Checkbox(style: .toggle, checked: item.value)
                                        .class("form-check-single")
                                }.class("col-auto")
                            }.class("row")
                        }
                    }
                }
            }
        }
    }
}
