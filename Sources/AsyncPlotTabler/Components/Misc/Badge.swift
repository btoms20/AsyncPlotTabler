//
//  Badge.swift
//  PlotTabler
//

import Plot

public struct Badge: Component {
    public enum Style {
        case dot(Colors)
        case blinkingDot(Colors)
        case cornerPill(Badge.Fill, String, Colors)
        case inlineBadge(Badge.Fill, String, Colors)
    }
    
//    init(badge: Badge? = nil, @ComponentBuilder _ content:@escaping () -> Component) {
//        self.content = content()
//        self.badge = badge
//    }
//    

    
//    var badgePositionCSS:String {
//        if let badge {
//            switch badge.shape {
//            case .rect:
//                return ""
//            case .pill, .dot:
//                return "position-relative"
//            }
//        }
//        return ""
//    }
//    
//    var badgeNotificationCSS:String {
//        if let badge {
//            switch badge.shape {
//            case .rect:
//                return ""
//            case .pill, .dot:
//                return "badge-notification"
//            }
//        }
//        return ""
//    }
//    
//    var badgePadding:String {
//        if let badge {
//            switch badge.shape {
//            case .rect:
//                return "margin-left:8px"
//            case .pill, .dot:
//                return ""
//            }
//        }
//        return ""
//    }
    
    public enum Fill {
        case solid
        case light
        case outline
    }
    
    public enum Shape {
        case rect
        case pill
        case dot
        case blinkingDot
    }
    
    public enum Size {
        case small
        case regular
        case large
        
        var css:String {
            switch self {
            case .small: "badge-sm"
            case .regular: ""
            case .large: "badge-lg"
            }
        }
    }
    
    let fill:Fill
    let shape:Shape
    let size:Size
    let color:Colors
    let content:Component
    let isNotification:Bool
    
    public init(fill:Fill = .solid, shape:Shape = .rect, size:Size = .regular, color: Colors = .blue, @ComponentBuilder _ content:ContentProvider) async {
        self.fill = fill
        self.shape = shape
        self.size = size
        self.color = color
        self.isNotification = false
        self.content = await content()
    }
    
    public init(style:Style) {
        switch style {
        case .dot(let color):
            self.fill = .solid
            self.shape = .dot
            self.size = .regular
            self.color = color
            self.isNotification = false
            self.content = EmptyComponent()
        case .blinkingDot(let color):
            self.fill = .solid
            self.shape = .blinkingDot
            self.size = .regular
            self.color = color
            self.isNotification = true
            self.content = EmptyComponent()
        case .cornerPill(let fill, let str, let color):
            self.fill = fill
            self.shape = .pill
            self.size = .regular
            self.color = color
            self.isNotification = true
            self.content = Text(str)
        case .inlineBadge(let fill, let str, let color):
            self.fill = fill
            self.shape = .rect
            self.size = .regular
            self.color = color
            self.isNotification = false
            self.content = Text(str)
        }
    }
    
    var styleCSS:String {
        switch fill {
        case .solid: return "\(color.backgroundCSS) \(color.textLiteCSS)"
        case .light: return "\(color.backgroundLiteCSS) \(color.textCSS)"
        case .outline: return "badge-outline \(color.textCSS)"
        }
    }
    
    var shapeCSS:String {
        switch shape {
        case .rect: return ""
        case .pill: return "badge-pill"
        case .dot: return ""
        case .blinkingDot: return "badge-blink"
        }
    }
    
    var badgePositionCSS:String {
        switch shape {
        case .rect, .dot:
            return ""
        case .pill, .blinkingDot:
            return "position-relative"
        }
    }
    
    var badgeNotificationCSS:String {
        if self.isNotification {
            return "badge-notification"
        } else {
            return ""
        }
    }
    
    /*
     <span class="badge bg-blue text-blue-fg">Blue</span>
     <span class="badge badge-sm bg-green-lt text-uppercase ms-auto">New</span>
     */
    public func body() async -> Component {
        Span { content }
            .class("badge")
            .class(size.css)
            .class(styleCSS)
            .class(shapeCSS)
            .class(badgeNotificationCSS)
    }
    
    public static func dot(color:Colors) -> Badge {
        Badge(style: .dot(color))
    }
    
    public static func blinkingDot(color:Colors) -> Badge {
        Badge(style: .blinkingDot(color))
    }
    
    public static func cornerPill(fill: Badge.Fill = .solid, label:String, color:Colors) -> Badge {
        Badge(style: .cornerPill(fill, label, color))
    }
    
    public static func inlineBadge(fill:Fill = .solid, label:String, color:Colors) -> Badge {
        Badge(style: .inlineBadge(fill, label, color))
    }
}
