//
//  NavBar.swift
//  PlotTabler
//

import Plot

fileprivate struct Navigation:Component {
    @ComponentBuilder let content:Component
    /*
     <div class="navbar-nav flex-row order-md-last">
        ...
     </div>
     */
    func body() async -> Component {
        Div {
            content
        }.class("navbar-nav flex-row order-md-last")
    }
}

extension NavBar {
    fileprivate struct Badge:Component {
        let color:String
        let size:String
        
        @ComponentBuilder let content:Component
        /*
         <span class="badge badge-sm bg-green-lt text-uppercase ms-auto">New</span>
         */
        func body() async -> Component {
            Span {
                content
            }.class("badge badge-\(size) bg-\(color) text-uppercase ms-auto")
        }
    }
}

extension NavBar {
    public struct NewBadge:Component {
        /*
         <span class="badge badge-sm bg-green-lt text-uppercase ms-auto">New</span>
         */
        public func body() async -> Component {
            NavBar.Badge(color: "green-lt", size: "sm", content: {
                Text("New")
            })
        }
    }
}

public struct NavBar: Component {
    
    let brand:Brand
    let routes:[NavBar.RouteItem]
    let themeToggleEnabled:Bool
    let notificationsEnabled:Bool
    let searchEnabled:Bool
    let userMenu:UserMenu?
    
    public init(brand:Brand, routes: [NavBar.RouteItem], themeToggleEnabled:Bool = true, notificationsEnabled:Bool = true, userMenu:NavBar.UserMenu? = nil, searchEnabled:Bool = true) {
        self.brand = brand
        self.routes = routes
        self.themeToggleEnabled = themeToggleEnabled
        self.notificationsEnabled = notificationsEnabled
        self.userMenu = userMenu
        self.searchEnabled = searchEnabled
    }
    
    public func body() async -> Component {
        await ComponentGroup {
            Header {
                await Container {
                    NavBar.RouteToggler()
                    self.brand
                    Navigation {
                        // Github Button
                        
                        // Sponsor Button
                        
                        // Light Dark and Notifications
                        if themeToggleEnabled || notificationsEnabled {
                            Div {
                                if themeToggleEnabled { NavBar.LightDarkToggler() }
                                if notificationsEnabled {
                                    NavBar.NotificationsDropDown(notifications: [
                                        NavBar.Notification(text: "Change deprecated html tags to text decoration classes (#29604)", status: .urgent),
                                        NavBar.Notification(text: "justify-content:between ⇒ justify-content:space-between (#29734)", status: .normal),
                                        NavBar.Notification(text: "Update change-version.js (#29736)", status: .normal),
                                        NavBar.Notification(text: "Regenerate package-lock.json (#29730)", status: .attention),
                                    ])
                                }
                            }
                            .class("d-none d-md-flex")
                            .margin(.trailing(2))
                        }
                        
                        // User Avatar and Menu
                        if let userMenu {
                            userMenu
                        }
                    }
                    //.class("navbar-nav flex-row order-md-last")
                }
            }
            .class("navbar navbar-expand-md d-print-none")
            Header {
                Div {
                    Div {
                        await Container {
                            await Element(name: "ul") {
                                for route in routes {
                                    route
                                }
                            }
                            .class("navbar-nav")
                            if searchEnabled {
                                NavBar.Search()
                            }
                        }
                    }
                    .class("navbar")
                }
                .class("collapse navbar-collapse")
                .id("navbar-menu")
            }
            .class("navbar-expand-md")
        }
    }
}
