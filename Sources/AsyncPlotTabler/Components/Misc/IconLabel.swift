//
//  IconLabel.swift
//  PlotTabler
//

import Plot

struct IconLabel: Component {
    let icon:SVGIcon
    let content:Component
    let badge:Badge?
    
    init(icon: Icons, text: String, badge: Badge? = nil) {
        self.icon = SVGIcon(icon: icon)
        self.content = Text(text)
        self.badge = badge
    }
    
    init(icon: SVGIcon, text: String, badge: Badge? = nil) {
        self.icon = icon
        self.content = Text(text)
        self.badge = badge
    }
    
    init(icon: SVGIcon, badge: Badge? = nil, @ComponentBuilder _ content: ContentProvider) async {
        self.icon = icon
        self.content = await content()
        self.badge = badge
    }
    
    private var badgePadding:String {
        if let badge {
            switch badge.shape {
            case .rect, .pill, .dot:
                if badge.isNotification { return "margin-left:4xp" }
                return "margin-left:4px"
            case .blinkingDot:
                if badge.isNotification { return "" }
                return "margin-left:4px"
            }
        }
        return ""
    }
    
    private var labelMargin:String {
        if let badge, badge.isNotification {
            return "margin-right:12px"
        } else {
            return ""
        }
    }
    
    func body() async -> Component {
        Span {
            // Icon Label
            Span {
                icon
                    .style("margin-right:4px")
                content
                    
            }
            .style(labelMargin)
            
            // Badge
            if let badge {
                badge
                    .style(badgePadding)
            }
        }
        .class(badge?.badgePositionCSS ?? "")
    }
}
