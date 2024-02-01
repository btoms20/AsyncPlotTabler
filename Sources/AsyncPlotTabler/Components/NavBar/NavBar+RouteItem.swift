//
//  NavBar+RouteItem.swift
//  PlotTabler
//

import Plot

extension NavBar {
    public struct RouteItem: Component {
        
        public struct SubLink {
            let title:String
            let url:URLRepresentable
            let decoration:Component?
            let subLinks:[SubLink]
            
            public init(title: String, url: URLRepresentable, decoration: Component? = nil) {
                self.title = title
                self.url = url
                self.decoration = decoration
                self.subLinks = []
            }
            
            public init(title: String, subLinks:[SubLink], decoration: Component? = nil) {
                self.title = title
                self.url = "#sidebar-\(title.lowercased())"
                self.decoration = decoration
                self.subLinks = subLinks
            }
        }
        
        let title:String
        let url:String
        let icon:Icons
        let active:Bool
        
        let subLinks:[[SubLink]]
        
        public init(title: String, url: String, icon:Icons, active:Bool = false) {
            self.title = title
            self.url = url
            self.icon = icon
            self.subLinks = []
            self.active = active
        }
        
        public init(title: String, icon:Icons, subLinks:[[SubLink]] = [], active:Bool = false) {
            self.title = title
            self.url = "#sidebar-\(title.lowercased())"
            self.icon = icon
            self.subLinks = subLinks
            self.active = active
        }
        
        private var isDropdown:Bool {
            !self.subLinks.isEmpty
        }
        
        /*
         <li class="nav-item">
         <a class="nav-link" href="./" >
         <span class="nav-link-icon d-md-none d-lg-inline-block"><!-- Download SVG icon from http://tabler-icons.io/i/home -->
         <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M5 12l-2 0l9 -9l9 9l-2 0" /><path d="M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-7" /><path d="M9 21v-6a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v6" /></svg>
         </span>
         <span class="nav-link-title">
         Home
         </span>
         </a>
         </li>
         */
        public func body() async -> Component {
            ListItem {
                
                // The main SVG NavBar Link Button
                if isDropdown {
                    Link(url: "#navbar-base") {
                        Span {
                            SVGIcon(icon: icon)
                        }
                        .class("nav-link-icon d-md-none d-lg-inline-block")
                        Span {
                            Text(title)
                        }
                        .class("nav-link-title")
                    }
                    .class("nav-link dropdown-toggle")
                    .attribute(named: "data-bs-toggle", value: "dropdown")
                    .attribute(named: "data-bs-auto-close", value: "outside")
                    .attribute(named: "role", value: "button")
                    .attribute(named: "aria-expanded", value: "false")
                    
                    await DropDownMenu(columns: self.subLinks.asyncCompactMap { await routeSubLinksBuilder($0) } )
                } else {
                    Link(url: url) {
                        Span {
                            SVGIcon(icon: icon)
                        }
                        .class("nav-link-icon d-md-none d-lg-inline-block")
                        Span {
                            Text(title)
                        }
                        .class("nav-link-title")
                    }
                    .class("nav-link")
                }
            }
            .class("nav-item \(active ? "active" : "") \(isDropdown ? "dropdown" : "")")
        }
    }
}

fileprivate func routeSubLinksBuilder(_ subLinks:[NavBar.RouteItem.SubLink]) async -> [DropDownMenuItem]? {
    guard !subLinks.isEmpty else { return nil }
    return await subLinks.asyncMap { link in
        if link.subLinks.isEmpty {
            await DropDownMenu_SingleItem(url: link.url) {
                Text(link.title)
                if let decoration = link.decoration {
                    decoration
                }
            }
        } else {
            await DropDownMenu_ParentItem(
                url: link.url,
                childrenItems: routeSubLinksBuilder(link.subLinks)!
            ) {
                Text(link.title)
                if let decoration = link.decoration {
                    decoration
                }
            }
        }
    }
}
