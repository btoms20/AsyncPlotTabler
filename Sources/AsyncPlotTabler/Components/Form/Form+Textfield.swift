//
//  Form+Textfield.swift
//  PlotTabler
//

import Plot

extension Plot.Form {
    public struct Textfield:Component {
        public enum InputType {
            case text
            case email
            case password
            case search
            case url
            
            var htmlType:HTMLInputType {
                switch self {
                case .text: .text
                case .email: .email
                case .password: .password
                case .search: .search
                case .url: .url
                }
            }
        }
        
        public enum Style {
            case regular
            case rounded
            case flush
            
            var css:String {
                switch self {
                case .regular: ""
                case .rounded: "form-control-rounded"
                case .flush: "form-control-flush"
                }
            }
        }
        
        public struct DataMask {
            let mask:String
            let isVisible:Bool
            
            public init(mask: String, isVisible: Bool = true) {
                self.mask = mask
                self.isVisible = isVisible
            }
        }
        
        let inputType:InputType
        let name:String?
        let value:String?
        let placeholder:String?
        let style:Style
        let isRequired:Bool
        let disabled:Bool
        let readonly:Bool
        let dataMask:DataMask?
        
        public init(type:InputType = .text, name: String, value: String? = nil, placeholder: String? = nil, style:Style = .regular, isRequired: Bool = true, disabled: Bool = false, readonly:Bool = false, dataMask:DataMask? = nil) {
            self.inputType = type
            self.name = name
            self.value = value
            self.placeholder = placeholder ?? (dataMask?.isVisible == true ? dataMask?.mask : nil)
            self.style = style
            self.isRequired = isRequired
            self.disabled = disabled
            self.readonly = readonly
            self.dataMask = dataMask
        }
        
        public func body() async -> Component {
            applyDatamaskIfNecessary(
                Input(type: inputType.htmlType, name: name, value: value, isRequired: isRequired, placeholder: placeholder)
                    .class("form-control")
                    .class(style.css)
                    .class(disabled ? "disabled" : "")
                    .optionalAttribute(readonly, name: "readonly", value: nil, ignoreValueIfEmpty: false)
                    .optionalAttribute(disabled, name: "disabled", value: nil, ignoreValueIfEmpty: false)
            )
        }
        
        private func applyDatamaskIfNecessary(_ comp:Component) -> Component {
            if let dataMask {
                return comp
                    .attribute(named: "data-mask", value: dataMask.mask)
                    .attribute(named: "data-mask-visible", value: dataMask.isVisible ? "true" : "false")
            } else {
                return comp
            }
        }
    }
}
