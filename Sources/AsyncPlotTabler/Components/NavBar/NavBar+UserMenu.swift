//
//  UserMenu.swift
//  PlotTabler
//

import Plot

extension NavBar {
    public struct UserMenu:Component {
        let avatar:Avatar.AvatarType
        let username:String
        let secondary:String
        let menuItems:[Plot.Link]
        
        public init(avatar: Avatar.AvatarType, username: String, secondary: String, menuItems: [Plot.Link]) {
            self.avatar = avatar
            self.username = username
            self.secondary = secondary
            self.menuItems = menuItems
        }
        
        /*
         <div class="nav-item dropdown">
         <a href="#" class="nav-link d-flex lh-1 text-reset p-0" data-bs-toggle="dropdown" aria-label="Open user menu">
         <span class="avatar avatar-sm" style="background-image: url(./static/avatars/000m.jpg)"></span>
         <div class="d-none d-xl-block ps-2">
         <div>Paweł Kuna</div>
         <div class="mt-1 small text-secondary">UI Designer</div>
         </div>
         </a>
         <div class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
         <a href="#" class="dropdown-item">Status</a>
         <a href="./profile.html" class="dropdown-item">Profile</a>
         <a href="#" class="dropdown-item">Feedback</a>
         <div class="dropdown-divider"></div>
         <a href="./settings.html" class="dropdown-item">Settings</a>
         <a href="./sign-in.html" class="dropdown-item">Logout</a>
         </div>
         </div>
         */
        public func body() async -> Component {
            Div {
                Link(url: "#") {
                    // User Icon
                    Avatar(size: .sm, avatar)
                    
                    Div {
                        Div { Text(username) }
                        Div { Text(secondary) }
                            .class("mt-1 small text-secondary")
                    }
                    .class("d-none d-xl-block ps-2")
                }
                .class("nav-link d-flex lh-1 text-reset p-0")
                .attribute(named: "data-bs-toggle", value: "dropdown")
                .attribute(named: "tabindex", value: "-1")
                .attribute(named: "aria-label", value: "Open user menu")
                
                Div {
                    for item in menuItems {
                        item.class("dropdown-item")
                    }
                }
                .class("dropdown-menu dropdown-menu-end dropdown-menu-arrow")
                
            }
            .class("nav-item dropdown")
        }
    }
}
