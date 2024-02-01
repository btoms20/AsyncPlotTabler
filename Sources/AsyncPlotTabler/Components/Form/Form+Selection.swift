//
//  Form+Selection.swift
//  PlotTabler
//

import Plot

extension Plot.Form {
    public struct Selection:Component {
        public enum Style {
            case regular
            case multiple
            case multipleText
        }
        
        public struct OptionGroup {
            let groupLabel:String
            let options:[Option]
            
            public init(groupLabel: String, options: [Option]) {
                self.groupLabel = groupLabel
                self.options = options
            }
        }
        
        public struct Option {
            let value:String
            let selected:Bool
            let label:Component
            
            public init(value: String, selected: Bool = false, @ComponentBuilder label: ContentProvider) async {
                self.value = value
                self.selected = selected
                self.label = await label()
            }
        }
        
        let name:String
        let options:[Option]?
        let groups:[OptionGroup]?
        let multiselect:Bool
        let isRequired:Bool
        let disabled:Bool
        
        public init(name: String, multiselect: Bool = false, isRequired: Bool = true, disabled: Bool = false, options: [Option]) {
            self.name = name
            self.options = options
            self.groups = nil
            self.multiselect = multiselect
            self.isRequired = isRequired
            self.disabled = disabled
        }
        
        public init(name: String, multiselect: Bool = false, isRequired: Bool = true, disabled: Bool = false, optionGroups: [OptionGroup]) {
            self.name = name
            self.groups = optionGroups
            self.options = nil
            self.multiselect = multiselect
            self.isRequired = isRequired
            self.disabled = disabled
        }
        
        public func body() async -> Component {
            if let groups {
                
                await Element(name: "select") {
                    for group in groups {
                        await Element(name: "optgroup") {
                            for option in group.options {
                                await Element(name: "option") {
                                    option.label
                                }
                                .attribute(named: "value", value: "\(option.value)")
                                .optionalAttribute(option.selected, name: "selected", ignoreValueIfEmpty: false)
                            }
                        }
                        .attribute(named: "label", value: group.groupLabel)
                    }
                }
                .class("form-select")
                .attribute(named: "name", value: name)
                .optionalAttribute(multiselect, name: "multiple", value: nil, ignoreValueIfEmpty: false)
                .optionalAttribute(disabled, name: "disabled", value: nil, ignoreValueIfEmpty: false)
                .class(disabled ? "disabled" : "")
                
            } else if let options {
                
                await Element(name: "select") {
                    for option in options {
                        await Element(name: "option") {
                            option.label
                        }
                        .attribute(named: "value", value: "\(option.value)")
                        .optionalAttribute(option.selected, name: "selected", ignoreValueIfEmpty: false)
                    }
                }
                .class("form-select")
                .attribute(named: "name", value: name)
                .optionalAttribute(multiselect, name: "multiple", value: nil, ignoreValueIfEmpty: false)
                .optionalAttribute(disabled, name: "disabled", value: nil, ignoreValueIfEmpty: false)
                .class(disabled ? "disabled" : "")
           
            } else {
                EmptyComponent()
            }
        }
    }
}
