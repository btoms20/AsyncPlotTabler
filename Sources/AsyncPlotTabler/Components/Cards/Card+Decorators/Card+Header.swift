//
//  Card+Header.swift
//  PlotTabler
//

import Foundation
import Plot

extension Card {
    public struct Header:Component {
        let style:Header.Style
        let content:Component
        let css:String?
        
        public init(style:Header.Style = .regular, @ComponentBuilder _ content:@escaping () async -> Component, class:String? = nil) async  {
            self.style = style
            self.css = `class`
            self.content = await content()
        }
        
        public func body() async -> Component {
            Div {
                content
            }
            .class("card-header\(css.spacePrefixedUnwrap())")
            .class(style.css)
        }
    }
}

extension Card.Header {
    public enum Style {
        case regular
        case light
        
        var css:String {
            switch self {
            case .regular: ""
            case .light: "card-header-light"
            }
        }
    }
}

extension Card {
    public struct HeaderTabs:Component {
        public enum Style {
            case tabs
            case pills
            
            var css:String {
                switch self {
                case .tabs: "nav-tabs card-header-tabs"
                case .pills: "nav-pills card-header-pills"
                }
            }
        }
        let style:Style
        let items:[HeaderTabsItem]
        
        let settings:[Plot.Link]?
        
        public init(style:Style = .tabs, items: [HeaderTabsItem], settings:[Plot.Link]? = nil) {
            self.style = style
            self.items = items
            self.settings = settings
        }
        
        /*
         <ul class="nav nav-tabs card-header-tabs">
           <li class="nav-item">
             <a class="nav-link active" href="#">
               ...
             </a>
           </li>
         </ul>
         */
        public func body() async -> Component {
            await Element(name: "ul") {
                for item in items {
                    item
                }
                
                if let settings, !settings.isEmpty {
                    Settings(items: settings)
                        .style("padding-right:8px")
                }
            }.class("nav \(style.css)")
        }
        
    }
}

extension Card.HeaderTabs {
    struct Settings:Component {
        let items:[Plot.Link]
        
        /*
           <li class="nav-item">
             <a class="nav-link active" href="#">
               ...
             </a>
           </li>
         */
        func body() async -> Component {
            Div {
                Link(url: "#") {
                    SVGIcon(icon: .settings)
                }
                .class("nav-link d-flex lh-1 text-reset p-0 text-secondary")
                .attribute(named: "data-bs-toggle", value: "dropdown")
                .attribute(named: "tabindex", value: "-1")
                .attribute(named: "aria-label", value: "Open user menu")
                
                Div {
                    for item in items {
                        item.class("dropdown-item")
                    }
                }
                .class("dropdown-menu dropdown-menu-end dropdown-menu-arrow")
                
            }
            .class("nav-item ms-auto dropdown")
        }
    }
    
    public struct HeaderTabsItem:Component {
        let isActive:Bool
        let isDisabled:Bool
        let content:Component
        
        public init(active:Bool = false, disabled:Bool = false, @ComponentBuilder _ content:@escaping () -> Component) {
            self.isActive = active
            self.isDisabled = disabled
            self.content = content()
        }
        
        var css:String {
            var s = ""
            if isActive { s += " active" }
            if isDisabled { s += " disabled" }
            return s
        }
        
        /*
           <li class="nav-item">
             <a class="nav-link active" href="#">
               ...
             </a>
           </li>
         */
        public func body() async -> Component {
            ListItem {
                await Element(name: "a", content: {
                    content
                }).class("nav-link\(css)")
            }.class("nav-item")
        }
    }
}
