//
//  Form+ImageSelection.swift
//  PlotTabler
//

import Plot

extension Plot.Form {
    public struct ImageSelection:Component {
        public enum Selection {
            case one
            case many
            
            var inputType:HTMLInputType {
                switch self {
                case .one: .radio
                case .many: .checkbox
                }
            }
        }
        
        public struct Option {
            let value:String
            let src:URLRepresentable
            let alt:String?
            let selected:Bool
            
            public init(value: String, src: URLRepresentable, alt: String? = nil, selected:Bool = false) {
                self.value = value
                self.src = src
                self.alt = alt
                self.selected = selected
            }
        }
        
        let name:String
        let options:[Option]
        let selection:Selection
        let colWidth:Column.Width
        let isRequired:Bool
        let disabled:Bool
        
        public init(name: String, selection: Selection = .many, isRequired: Bool = true, disabled: Bool = false, colWidth:Column.Width = .full, options: [Option]) {
            self.name = name
            self.options = options
            self.selection = selection
            self.colWidth = colWidth
            self.isRequired = isRequired
            self.disabled = disabled
        }
        
        public func body() async -> Component {
            await Row {
                for option in options {
                    await Column(size: .full(colWidth)) {
                        await Element(name: "label") {
                            Input(type: selection.inputType, name: name, value: option.value, isRequired: isRequired)
                                .class("form-imagecheck-input")
                                .optionalAttribute(option.selected, name: "checked", value: nil, ignoreValueIfEmpty: false)
                            Span {
                                Plot.Image(url: option.src, description: "\(option.alt ?? "")")
                                    .class("form-imagecheck-image")
                            }
                            .class("form-imagecheck-figure")
                        }
                        .class("form-imagecheck")
                        .class(disabled ? "disabled" : "")
                    }
                }
            }
        }
    }
}
