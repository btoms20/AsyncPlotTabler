//
//  Form+Misc.swift
//  PlotTabler
//

import Plot

extension Plot.Form {
    public struct Label:Component {
        let content:Component
        let trailing:Component?
        
        public init(_ str:String) {
            self.content = Text(str)
            self.trailing = nil
        }
        
        public init(_ str:String, @ComponentBuilder trailingContent:ContentProvider) async {
            self.content = Text(str)
            self.trailing = await trailingContent()
        }
        
        public init(@ComponentBuilder _ content:ContentProvider) async {
            self.content = await content()
            self.trailing = nil
        }
        
        public init(@ComponentBuilder _ content:ContentProvider, @ComponentBuilder trailingContent:ContentProvider) async {
            self.content = await content()
            self.trailing = await trailingContent()
        }
        
        public func body() async -> Component {
            await Element(name: "label") {
                content
                if let trailing {
                    Span { trailing }
                        .class("form-label-description")
                }
            }.class("form-label")
        }
    }
    
    public struct Plaintext:Component {
        let content:Component
        
        public init(_ str:String) {
            self.content = Text(str)
        }
        
        public init(@ComponentBuilder _ content:ContentProvider) async {
            self.content = await content()
        }
        
        public func body() async -> Component {
            await Element(name: "label") {
                content
            }.class("form-control-plaintext")
        }
    }
    
    public struct Hint:Component {
        let content:Component
        
        public init(_ str:String) {
            self.content = Text(str)
        }
        
        public init(@ComponentBuilder _ content:ContentProvider) async {
            self.content = await content()
        }
        
        public func body() async -> Component {
            await Element(name: "small") {
                content
            }.class("form-hint")
        }
    }
    
    public struct InputGroup:Component {
        let content:Component
        
        public init(@ComponentBuilder _ content:ContentProvider) async {
            self.content = await content()
        }
        
        public func body() async -> Component {
            await DivC("input-group", margin: .body(2)) {
                content
            }
        }
    }
    
    public struct InputGroupText:Component {
        let content: Component
        
        public init(@ComponentBuilder _ content:ContentProvider) async {
            self.content = await content()
        }
        
        public func body() async -> Component {
            Span {
                content
            }.class("input-group-text")
        }
    }
    
    public struct InputWithIcon:Component {
        public enum Style {
            case icon(Icons)
            case svgIcon(SVGIcon)
            case loading(color: Colors = .secondary)
        }
        
        let style:Style
        let leading:Bool
        let content: Component
        
        public init(leading icon:Style, @ComponentBuilder _ content: ContentProvider) async {
            self.style = icon
            self.leading = true
            self.content = await content()
        }
        
        public init(trailing icon:Style, @ComponentBuilder _ content: ContentProvider) async {
            self.style = icon
            self.leading = false
            self.content = await content()
        }
        
        public func body() async -> Component {
            await DivC("input-icon") {
                if leading { icon }
                content
                if !leading { icon }
            }
        }
        
        var icon:Component {
            switch self.style {
            case .icon(let icon):
                return Span { SVGIcon(icon: icon) }.class("input-icon-addon")
            case .svgIcon(let svg):
                return Span { svg }.class("input-icon-addon")
            case .loading(let color):
                return Span {
                    await DivC("spinner-border spinner-border-sm \(color.textCSS)") { }
                        .attribute(named: "role", value: "status")
                }.class("input-icon-addon")
            }
        }
    }
    
    public struct DropDownButton: Component {
        let label:String
        let items:[DropDownMenuItem]
        
        public init(label: String, items: [DropDownMenuItem]) {
            self.label = label
            self.items = items
        }
        
        public func body() async -> Component {
            await ComponentGroup {
                await Element(name: "button") {
                    Text(label)
                }
                .attribute(named: "type", value: "button")
                .attribute(named: "data-bs-toggle", value: "dropdown")
                .attribute(named: "aria-haspopup", value: "true")
                .attribute(named: "aria-expanded", value: "false")
                .class("btn dropdown-toggle")
                DropDownMenu(columns: [items])
            }
        }
    }
}

