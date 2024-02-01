//
//  Form+ListGroup.swift
//  PlotTabler
//

import Plot

extension Plot.Form {
    public struct ListGroup:Component {
        
        public enum Style {
            case link
            case div
        }
        
        public enum Theme {
            case regular
            case flush
            case card
            
            var css:String {
                switch self {
                case .regular: ""
                case .flush: "list-group-flush"
                case .card: "card-list-group"
                }
            }
        }
        
        public enum Background {
            case regular
            case transparent
            
            var css:String {
                switch self {
                case .regular: ""
                case .transparent: "list-group-transparent"
                }
            }
        }
        
        public struct Group {
            let label:String
            let items:[Item]
            
            public init(label: String, items: [Item]) {
                self.label = label
                self.items = items
            }
        }
        
        public struct Item {
            let link:URLRepresentable
            let active:Bool
            let disabled:Bool
            let content:Component
            
            public init(link: URLRepresentable, active:Bool = false, disabled:Bool = false, @ComponentBuilder content: ContentProvider) async {
                self.link = link
                self.active = active
                self.disabled = disabled
                self.content = await content()
            }
            
            public init(link: URLRepresentable, active:Bool = false, disabled:Bool = false, title:String, count:Int? = nil) async {
                self.link = link
                self.active = active
                self.disabled = disabled
                self.content = await ComponentGroup {
                    Text(title)
                    if let count {
                        await Element(name: "small") { Text("\(count)") }.class("text-secondary ms-auto")
                    }
                }
            }
        }
        
        let style:Style
        let theme:Theme
        let items:[Item]?
        let groups:[Group]?
        let background:Background
        let isScrollable:Bool
        let preventHorizontalScroll:Bool
        let isHoverable:Bool
        
        public init(style: Style = .div, theme:Theme = .regular, background:Background = .regular, scrollable:Bool = false, preventHorizontalScroll:Bool = false, hoverable:Bool = false, items: [Item]) {
            self.style = style
            self.theme = theme
            self.items = items
            self.groups = nil
            self.background = background
            self.isScrollable = scrollable
            self.preventHorizontalScroll = preventHorizontalScroll
            self.isHoverable = hoverable
        }
        
        public init(style: Style = .div, theme:Theme = .regular, background:Background = .regular, scrollable:Bool = false, preventHorizontalScroll:Bool = false, hoverable:Bool = false, groupedItems: [Group]) {
            self.style = style
            self.theme = theme
            self.items = nil
            self.groups = groupedItems
            self.background = background
            self.isScrollable = scrollable
            self.preventHorizontalScroll = preventHorizontalScroll
            self.isHoverable = hoverable
        }
        
        /*
         <div class="list-group list-group-transparent mb-3">
           <a class="list-group-item list-group-item-action d-flex align-items-center active" href="#">
             Games
             <small class="text-secondary ms-auto">24</small>
           </a>
           <a class="list-group-item list-group-item-action d-flex align-items-center" href="#">
             Clothing
             <small class="text-secondary ms-auto">149</small>
           </a>
           <a class="list-group-item list-group-item-action d-flex align-items-center" href="#">
             Jewelery
             <small class="text-secondary ms-auto">88</small>
           </a>
           <a class="list-group-item list-group-item-action d-flex align-items-center" href="#">
             Toys
             <small class="text-secondary ms-auto">54</small>
           </a>
         </div>
         */
        public func body() async -> Component {
            await DivC("list-group") {
                if let groups {
                    for group in groups {
                        await DivC("list-group-header sticky-top") { Text(group.label) }
                        for item in group.items {
                            await itemCell(item: item)
                            
                        }
                    }
                } else if let items {
                    for item in items {
                        await itemCell(item: item)
                    }
                }
                else {
                    EmptyComponent()
                }
            }
            .class(theme.css)
            .class(background.css)
            .class(isHoverable ? "list-group-hoverable" : "")
            .class(isScrollable ? (preventHorizontalScroll ? "" : "overflow-auto") : "")
            .style(styleString)
        }
        
        var styleString:String {
            var str = ""
            if isScrollable {
                str += "max-height:35rem;"
            }
            if preventHorizontalScroll {
                str += "overflow-x:hidden;"
            }
            return str
        }
        
        private func itemCell(item:Item) async -> Component {
            if style == .link {
                Plot.Link(url: item.link) {
                    item.content
                }
                .class("list-group-item list-group-item-action d-flex align-items-center")
                .class(item.active ? "active" : "")
                .class(item.disabled ? "disabled" : "")
            } else {
                await DivC("list-group-item") { item.content }
                    .class(item.active ? "active" : "")
                    .class(item.disabled ? "disabled" : "")
            }
        }
    }
}
