//
//  Timeline.swift
//  PlotTabler
//

import Plot
import Foundation

public struct Timeline:Component {
    
    public enum Sort {
        case newAtTop
        case newAtBottom
        
        func sort(_ lhs:Date, _ rhs:Date) -> Bool {
            switch self {
            case .newAtTop: lhs > rhs
            case .newAtBottom: lhs < rhs
            }
        }
    }
    
    public enum Style {
        case regular
        case simple
        
        var css:String {
            switch self {
            case .regular: ""
            case .simple: "timeline-simple"
            }
        }
    }
    
    public struct Event {
        let date:Date
        let content:Component
        
        public init(date: Date, title: String, description: String) async {
            self.date = date
            //self.content = await SimpleEvent(date: date.formatted(), title: title, description: { Paragraph { Text(description) }.textColor(.secondary) })
            self.content = await SimpleEvent(date: DateFormatter().string(from: date), title: title, description: { Paragraph { Text(description) }.textColor(.secondary) })
        }
        
        public init(date: Date, title: String, @ComponentBuilder _ content: ContentProvider) async {
            self.date = date
            //self.content = await SimpleEvent(date: date.formatted(), title: title, description: content)
            self.content = await SimpleEvent(date: DateFormatter().string(from: date), title: title, description: content)
        }
        
        public init(date: Date, customCard card:Card) {
            self.date = date
            self.content = card
        }
    }
    
    public struct Item {
        let icon:SVGIcon
        let event:Event
        
        public init(icon: SVGIcon, event: Event) {
            self.icon = icon
            self.event = event
        }
    }
    
    let style:Style
    let isTransparent:Bool
    let items:[Item]
    
    public init(sort: Sort = .newAtTop, isTransparent:Bool = false, iconTimeline items: [Item]) {
        self.style = .regular
        self.isTransparent = isTransparent
        self.items = items.sorted(by: { sort.sort($0.event.date, $1.event.date) })
    }
    
    public init(sort: Sort = .newAtTop, isTransparent:Bool = false, simpleTimeline events: [Event]) {
        self.style = .simple
        self.isTransparent = isTransparent
        self.items = events.map { Item(icon: .init(icon: .x), event: $0) }.sorted(by: { sort.sort($0.event.date, $1.event.date) })
    }
    
    public func body() async -> Component {
        await Element(name: "ul") {
            for item in items {
                await listItem(item)
            }
        }
        .class("timeline")
        .class(style.css)
    }
    
    private func listItem(_ item:Item) async -> Component {
        await Element(name: "li") {
            if self.style == .regular {
                Div { item.icon }
                    .class("timeline-event-icon")
            }
            item.event.content
                .class("timeline-event-card")
                .style(isTransparent ? "backgroundColor: transparent; background: transparent; margin-left: 14px;" : "")
        }
        .class("timeline-event")
    }
}

fileprivate struct SimpleEvent:Component {
    let date:String
    let title:String
    let description:Component
    
    init(date: String, title: String, @ComponentBuilder description: ContentProvider) async {
        self.date = date
        self.title = title
        self.description = await description()
    }
    
    func body() async -> Component {
        await Card(body: .init({
            await DivC("text-secondary float-end") { Text(date) }
            H4 { Text(title) }
            description
        }))
    }
}
