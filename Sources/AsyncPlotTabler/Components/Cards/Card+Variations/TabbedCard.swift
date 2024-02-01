//
//  TabbedCard.swift
//  PlotTabler
//

import Plot
import Foundation

public struct TabbedCard: Component, ExplicitlySized {
    public enum Location {
        case top
        case bottom
    }
    
    let size:Column.Size?
    let location:Location
    let sections:[TabComponent]
    let uuid:UUID
    
    public init(size:Column.Size? = nil, tabLocation:Location = .top, sections:[TabComponent]) {
        self.uuid = UUID()
        self.size = size
        self.location = tabLocation
        self.sections = sections
    }
    
    func tabNav() async -> Component {
        await Element(name: "ul") {
            for (i, section) in sections.enumerated() {
                ListItem {
                    await Element(name: "a") {
                        section.tab
                    }
                    .class("nav-link\(i == 0 ? " active" : "")")
                    .attribute(named: "href", value: "#tab-top-\(i+1)-\(uuid)")
                    .attribute(named: "data-bs-toggle", value: "tab")
                }.class("nav-item")
            }
        }.class("nav nav-tabs")
    }
    
    public func body() async -> Component {
        Div {
            // Card navigation if on top
            if location == .top { await tabNav() }
            
            // Card Contents
            await DivC("tab-content") {
                for (i, section) in sections.enumerated() {
                    await DivC("card tab-pane\(i == 0 ? " active show" : "")") {
                        await Card.Body {
                            section.content
                        }
                    }
                    .id("tab-top-\(i+1)-\(uuid)")
                }
            }
            
            // Card navigation if on bottom
            if location == .bottom { await tabNav().class("nav-tabs-bottom") }
            
        }.class("card-tabs")
    }
}

extension TabbedCard {
    public struct TabComponent {
        let pullRight:Bool
        let tab:Component
        let content:Component
        let dropdown:[DropDownMenuItem]
        
        var isDropdown:Bool {
            !dropdown.isEmpty
        }
        
        public init(pullRight:Bool = false, @ComponentBuilder tab:@escaping () async -> Component, @ComponentBuilder body:@escaping () async -> Component) async {
            self.pullRight = pullRight
            self.tab = await tab()
            self.content = await body()
            self.dropdown = []
        }
        
        public init(pullRight:Bool = false, dropdownItems:[DropDownMenuItem], @ComponentBuilder tab:@escaping () async -> Component) async {
            self.pullRight = pullRight
            self.tab = await tab()
            self.content = EmptyComponent()
            self.dropdown = dropdownItems
        }
    }
}
