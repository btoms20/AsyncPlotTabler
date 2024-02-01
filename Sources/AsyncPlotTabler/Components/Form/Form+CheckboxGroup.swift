//
//  Form+CheckboxGroup.swift
//  PlotTabler
//

import Plot

extension Plot.Form {
    public struct CheckboxGroup: Component {
        public enum Style {
            case vertical
            case inline
            
            var css:String {
                switch self {
                case .vertical: ""
                case .inline: "form-check-inline"
                }
            }
        }
        
        public enum Selection {
            case one
            case many
            
            var inputType:Plot.Form.Checkbox.Style {
                switch self {
                case .one: .radio
                case .many: .check
                }
            }
        }
        
        public struct Item {
            let value:String
            let content:Component
            let disabled:Bool
            let checked:Bool
            
            public init(value:String, isDisabled:Bool = false, isChecked:Bool = false, @ComponentBuilder content: ContentProvider) async {
                self.value = value
                self.content = await content()
                self.disabled = isDisabled
                self.checked = isChecked
            }
            
            public init(value:String, label:String, isDisabled:Bool = false, isChecked:Bool = false) {
                self.value = value
                self.content = Text(label)
                self.disabled = isDisabled
                self.checked = isChecked
            }
        }
        
        let name:String
        let items:[Item]
        let selection:Selection
        let style:Style
        
        public init(name: String, selection: Selection = .many, style: Style = .vertical, items: [Item]) {
            self.name = name
            self.items = items
            self.selection = selection
            self.style = style
        }
        
        public func body() async -> Component {
            Div {
                for item in items {
                    await Plot.Form.Checkbox(style: selection.inputType, name: name, checked: item.checked, required: false, disabled: item.disabled) {
                        item.content
                    }
                    .class(style.css)
                }
            }
        }
    }
}
