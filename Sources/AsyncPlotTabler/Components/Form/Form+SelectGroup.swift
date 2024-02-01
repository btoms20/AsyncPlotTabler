//
//  Form+SelectGroup.swift
//  PlotTabler
//

import Plot

extension Plot.Form {
    public struct SelectGroup:Component {
        
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
        
        public enum Layout {
            case inline
            case vertical(includeCheckbox:Bool)
            
            var labelCSS:String {
                switch self {
                case .inline: ""
                case .vertical: "flex-fill"
                }
            }
            
            var containerCSS:String {
                switch self {
                case .inline: ""
                case .vertical: "form-selectgroup-boxes d-flex flex-column"
                }
            }
        }
        
        public enum Style {
            case regular
            case pills
            
            var css:String {
                switch self {
                case .regular: ""
                case .pills: "form-selectgroup-pills"
                }
            }
        }
        
        let name:String
        let items:[KeyedComponent]
        let selection:Selection
        let layout:Layout
        let style:Style
        
        public init(name: String, selection: Selection = .one, layout: Layout = .inline, style: Style = .regular, items: [KeyedComponent]) {
            self.name = name
            self.items = items
            self.selection = selection
            self.layout = layout
            self.style = style
        }
        
        public func body() async -> Component {
            await DivC("form-selectgroup") {
                for item in items {
                    await Element(name: "label") {
                        Input(type: selection.inputType, name: name, value: item.key)
                            .class("form-selectgroup-input")
                        switch layout {
                        case .inline:
                            inlineElement(item.component)
                        case .vertical(let showCheckbox):
                            await verticalElement(item.component, includeCheckbox: showCheckbox)
                        }
                    }
                    .class("form-selectgroup-item")
                    .class(layout.labelCSS)
                }
            }
            .class(layout.containerCSS)
            .class(style.css)
        }
        
        func inlineElement(_ comp:Component) -> Component {
            Span { comp }
                .class("form-selectgroup-label")
        }
        
        func verticalElement(_ comp:Component, includeCheckbox:Bool) async -> Component {
            await DivC("form-selectgroup-label d-flex align-items-center p-3") {
                if includeCheckbox {
                    await DivC("me-3") {
                        Span { }.class("form-selectgroup-check")
                    }
                    await DivC("form-selectgroup-label-content d-flex align-items-center") {
                        comp
                    }
                } else {
                    comp
                }
            }
        }
    }
}
