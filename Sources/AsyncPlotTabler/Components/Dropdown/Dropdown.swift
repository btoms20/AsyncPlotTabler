//
//  Dropdown.swift
//  PlotTabler
//

import Plot

public struct Dropdown:Component {
    
    let label:String
    let items:[DropDownMenuItem]
    
    public init(label: String, items: [DropDownMenuItem]) {
        self.label = label
        self.items = items
    }
    
    public func body() async -> Component {
        await DivC("dropdown") {
            Link(url: "#") { Text(label) }
                .class("dropdown-toggle text-secondary")
                .attribute(named: "data-bs-toggle", value: "dropdown")
                .attribute(named: "aria-haspopup", value: "true")
                .attribute(named: "aria-expanded", value: "false")
            DropDownMenu(columns: [items])
        }
    }
}

public struct DropDownMenu:Component {
    public enum Position {
        case start
        case end
        
        var css:String {
            switch self {
            case .start: ""
            case .end: "dropdown-menu-end"
            }
        }
    }
    
    let arrow:Bool
    let position:Position
    let columns:[[DropDownMenuItem]]
    
    public init(position:Position = .start, arrow: Bool = false, columns: [[DropDownMenuItem]]) {
        self.arrow = arrow
        self.position = position
        self.columns = columns
    }
    
    /*
     <div class="dropdown-menu">
        ...
     </div>
     */
    public func body() async -> Component {
        Div {
            if columns.count == 1 {
                for menuItem in columns[0] {
                    menuItem
                }
            } else {
                Div {
                    for column in columns {
                        Div {
                            for menuItem in column {
                                menuItem
                            }
                        }.class("dropdown-menu-column")
                    }
                }.class("dropdown-menu-columns")
            }
        }
        .class("dropdown-menu")
        .class(position.css)
        .class(arrow ? "dropdown-menu-arrow" : "")
    }
}

public protocol DropDownMenuItem:Component { }

public struct DropDownMenu_Header:DropDownMenuItem {
    let header:String
    
    public init(header: String) {
        self.header = header
    }
    
    /*
     <h6 class="dropdown-header">Dropdown header</h6>
     */
    public func body() async -> Component {
        H6 { Text(header) }.class("dropdown-header")
    }
}

public struct DropDownMenu_Divider:DropDownMenuItem {
    
    public init() { }
    /*
     <div class="dropdown-divider"></div>
     */
    public func body() async -> Component {
        await DivC("dropdown-divider") { }
    }
}

public struct DropDownMenu_SingleItem:DropDownMenuItem {
    public enum Style {
        case link(url: URLRepresentable)
        case div
        case label
        
        func wrap(_ content:Component) async -> Component {
            switch self {
            case .link(let url):
                return Link(url: url, label: { content })
            case .div:
               return  Div { content }
            case .label:
                return await Element(name: "label") { content }
            }
        }
    }
    
    let style:Style
    let disabled:Bool
    let active:Bool
    @ComponentBuilder let content:Component
    
    public init(url: URLRepresentable, active:Bool = false, disabled:Bool = false, @ComponentBuilder content: ContentProvider) async {
        self.style = .link(url: url)
        self.active = active
        self.disabled = disabled
        self.content = await content()
    }
    
    public init(style: Style, active:Bool = false, disabled:Bool = false, @ComponentBuilder _ content: ContentProvider) async {
        self.style = style
        self.active = active
        self.disabled = disabled
        self.content = await content()
    }
    
    /*
     <a class="dropdown-item" href="./alerts.html">
       ...
     </a>
     */
    public func body() async -> Component {
        await style.wrap(content)
            .class("dropdown-item")
            .class(disabled ? "disabled" : "")
            .class(active ? "active" : "")
    }
}

public struct DropDownMenu_ParentItem:DropDownMenuItem {
    let url:URLRepresentable
    let childrenItems:[DropDownMenuItem]
    @ComponentBuilder let parentItem:Component
    
    /*
     <div class="dropend">
        <a class="dropdown-item dropdown-toggle" href="#sidebar-authentication" data-bs-toggle="dropdown" data-bs-auto-close="outside" role="button" aria-expanded="false" >
          ...
        </a>
        <div class="dropdown-menu">
          ...
        </div>
     </div>
     */
    public func body() async -> Component {
        Div {
            Link(url: url) {
                parentItem
            }
            .class("dropdown-item dropdown-toggle")
            .attribute(named: "data-bs-toggle", value: "dropdown")
            .attribute(named: "data-bs-auto-close", value: "outside")
            .attribute(named: "role", value: "button")
            .attribute(named: "aria-expanded", value: "false")
            Div {
                for child in childrenItems {
                    child
                }
            }
            .class("dropdown-menu")
        }
        .class("dropend")
    }
}
