//
//  Notification.swift
//  PlotTabler
//

import Plot

extension NavBar {
    struct NotificationsDropDown:Component {
        let notifications:[Notification]
        
        /*
         <a href="#" class="nav-link px-0" data-bs-toggle="dropdown" tabindex="-1" aria-label="Show notifications">
         <!-- Download SVG icon from http://tabler-icons.io/i/bell -->
         <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M10 5a2 2 0 1 1 4 0a7 7 0 0 1 4 6v3a4 4 0 0 0 2 3h-16a4 4 0 0 0 2 -3v-3a7 7 0 0 1 4 -6" /><path d="M9 17v1a3 3 0 0 0 6 0v-1" /></svg>
         <span class="badge bg-red"></span>
         </a>
         <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-end dropdown-menu-card">
         */
        func body() async -> Component {
            Div {
                Link(url: "#") {
                    // Bell Icon
                    SVGIcon(icon: .bell)
                    
                    // Render Badge if we have notifications
                    if !notifications.isEmpty {
                        Span { }
                            .class("badge bg-red")
                    }
                }
                .class("nav-link px-0")
                .attribute(named: "data-bs-toggle", value: "dropdown")
                .attribute(named: "tabindex", value: "-1")
                .attribute(named: "aria-label", value: "Show notifications")
                
                Div {
                    await Card(
                        header: .init({
                            Text(notifications.isEmpty ? "You're all caught up!" : "Latest Notifications")
                        }),
                        body: await .init({
                            Div {
                                for notification in notifications {
                                    notification
                                }
                            }
                            .class("list-group list-group-flush list-group-hoverable")
                        })
                    )
                }
                .class("dropdown-menu dropdown-menu-arrow dropdown-menu-end dropdown-menu-card")
            }
            .class("nav-item dropdown d-none d-md-flex me-3")
        }
    }
    
    struct Notification:Component {
        enum Status {
            case urgent
            case normal
            case attention
            
            var css:String {
                switch self {
                case .urgent: "red"
                case .normal: "blue"
                case .attention: "green"
                }
            }
            
            var style:String {
                switch self {
                case .urgent, .attention: "status-dot-animated"
                case .normal: ""
                }
            }
        }
        
        let text:String
        let status:Status
        
        /*
         <div class="list-group list-group-flush list-group-hoverable">
         <div class="list-group-item">
         <div class="row align-items-center">
         <div class="col-auto"><span class="status-dot status-dot-animated bg-red d-block"></span></div>
         <div class="col text-truncate">
         <a href="#" class="text-body d-block">Example 1</a>
         <div class="d-block text-secondary text-truncate mt-n1">
         Change deprecated html tags to text decoration classes (#29604)
         </div>
         </div>
         <div class="col-auto">
         <a href="#" class="list-group-item-actions">
         <!-- Download SVG icon from http://tabler-icons.io/i/star -->
         <svg xmlns="http://www.w3.org/2000/svg" class="icon text-muted" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 17.75l-6.172 3.245l1.179 -6.873l-5 -4.867l6.9 -1l3.086 -6.253l3.086 6.253l6.9 1l-5 4.867l1.179 6.873z" /></svg>
         </a>
         </div>
         </div>
         </div>
         */
        func body() async -> Component {
            Div {
                Div {
                    Div {
                        Span { }
                            .class("status-dot \(status.style) bg-\(status.css) d-block")
                    }
                    .class("col-auto")
                    Div {
                        Link(url: "#") {
                            Text("Example 1")
                        }
                        Div {
                            Text(text)
                        }
                        .class("d-block text-secondary text-truncate mt-n1")
                    }
                    .class("col text-truncate")
                    Div {
                        Link(url: "#") {
                            // Star Icon
                            SVGIcon(icon: .star)
                        }
                        .class("list-group-item-actions")
                    }
                    .class("col-auto")
                }
                .class("row align-items-center")
            }
            .class("list-group-item")
        }
    }
}
