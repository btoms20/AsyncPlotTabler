//
//  BadgedButton.swift
//  PlotTabler
//

import Plot

public struct RawButton: Component {
    // Button
    let content:Component
    
    // Badge
    let badge:Badge?
    
    public init(badge: Badge? = nil, @ComponentBuilder _ content:ContentProvider) async {
        self.content = await content()
        self.badge = badge
    }
    
    public init(withBadge style:Badge.Style, @ComponentBuilder _ content:ContentProvider) async {
        self.content = await content()
        self.badge = Badge(style: style)
    }
    
    var badgePadding:String {
        if let badge {
            if !badge.isNotification {
                return "margin-left:8px"
            }
        }
        return ""
    }
    
    public func body() async -> Component {
        Button(content: {
            content
            badge
                .style(badgePadding)
        })
        .class("btn")
        .class(badge?.badgePositionCSS ?? "")
    }
}
