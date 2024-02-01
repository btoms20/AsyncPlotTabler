//
//  Form+Checkbox.swift
//  PlotTabler
//

import Plot

extension Plot.Form {
    
    public struct Checkbox:Component {
        public enum Style {
            case check
            case radio
            case toggle
            
            var value:String {
                switch self {
                case .check, .toggle: "checkbox"
                case .radio: "radio"
                }
            }
            
            var css:String {
                switch self {
                case .check, .radio: ""
                case .toggle: "form-switch"
                }
            }
        }
        
        let style:Style
        let name:String?
        let value:String?
        let label:Component?
        let description:Component?
        let isChecked:Bool
        let isRequired:Bool
        let isDisabled:Bool
        let triggersFormOnCheck:Bool
        
        public init(style: Style = .check, name:String? = nil, value:String? = nil, label:String? = nil, description:String? = nil, checked: Bool = false, required:Bool = true, disabled:Bool = false, triggersFormOnCheck:Bool = false) {
            self.style = style
            self.name = name
            self.value = value
            self.label = label == nil ? nil : Text(label!)
            self.description = description == nil ? nil : Text(description!)
            self.isChecked = checked
            self.isRequired = required
            self.isDisabled = disabled
            self.triggersFormOnCheck = triggersFormOnCheck
        }
        
        public init(style: Style = .check, name:String? = nil, value:String? = nil, checked: Bool = false, required:Bool = true, disabled:Bool = false, triggersFormOnCheck:Bool = false, @ComponentBuilder label: ContentProvider) async {
            await self.init(style: style, name: name, value: value, checked: checked, required: required, disabled: disabled, triggersFormOnCheck: triggersFormOnCheck, label: label, description: { EmptyComponent() })
        }
        
        public init(style: Style = .check, name:String? = nil, value:String? = nil, checked: Bool = false, required:Bool = true, disabled:Bool = false, triggersFormOnCheck:Bool = false, @ComponentBuilder label: ContentProvider, @ComponentBuilder description: ContentProvider) async {
            self.style = style
            self.name = name
            self.value = value
            
            let l = await label()
            if l.members.count == 1 && l.members.first is EmptyComponent {
                self.label = nil
            } else {
                self.label = l
            }
            
            let d = await description()
            if d.members.count == 1 && d.members.first is EmptyComponent {
                self.description = nil
            } else {
                self.description = d
            }
            
            self.isChecked = checked
            self.isRequired = required
            self.isDisabled = disabled
            self.triggersFormOnCheck = triggersFormOnCheck
        }
        
        public func body() async -> Component {
            if style == .toggle || label != nil {
                await Element(name: "label") {
                    await checkbox()
                    if let label {
                        Span { label }
                            .class("form-check-label")
                            .class(isRequired ? "required" : "")
                        if let description {
                            Span { description }
                                .class("form-check-description")
                        }
                    }
                }
                .class("form-check")
                .class(style.css)
            } else {
                await checkbox()
            }
        }
        
        func checkbox() async -> Component {
            await Element(name: "input") {}
                .class("form-check-input")
                .attribute(named: "type", value: style.value)
                .optionalAttribute(name: "name", value: name)
                .optionalAttribute(name: "value", value: value)
                .optionalAttribute(isChecked, name: "checked", ignoreValueIfEmpty: false)
                .optionalAttribute(isRequired, name: "required", ignoreValueIfEmpty: false)
                .optionalAttribute(isDisabled, name: "disabled", ignoreValueIfEmpty: false)
                .class(isDisabled ? "disabled" : "")
                .optionalAttribute(self.triggersFormOnCheck, name: "onChange", value: "this.form.submit()")
        }
    }
}
