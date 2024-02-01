//
//  Card+Navigation.swift
//  PlotTabler
//

import Plot

public struct CardWithNavigation:Component {
    
    let navGroups:[Plot.Form.ListGroup.Group]?
    let navItems:[Plot.Form.ListGroup.Item]?
    
    let activeComponent:Component
    
    public init(navGroups: [Plot.Form.ListGroup.Group], @ComponentBuilder activeComponent:ContentProvider) async {
        self.navGroups = navGroups
        self.navItems = nil
        self.activeComponent = await activeComponent()
    }
    
    public init(navItems: [Plot.Form.ListGroup.Item], @ComponentBuilder activeComponent:ContentProvider) async {
        self.navGroups = nil
        self.navItems = navItems
        self.activeComponent = await activeComponent()
    }
    
    public func body() async -> Component {
        await DivC("card") {
            await Row(g: 0) {
                // Side Bar Menu
                await Column(size: .full(.num(12)), .medium(.num(3))) {
                    if let navGroups {
                        Plot.Form.ListGroup(style: .link, theme: .flush, background: .regular, scrollable: false, preventHorizontalScroll: true, hoverable: true, groupedItems: navGroups)
                    } else if let navItems {
                        Plot.Form.ListGroup(style: .link, theme: .flush, background: .regular, scrollable: false, preventHorizontalScroll: true, hoverable: true, items: navItems)
                    } else {
                        EmptyComponent()
                    }
                }
                .class("border-end")
                
                // Content
                await Column(size: .full(.num(12)), .medium(.num(9))) {
                    activeComponent
                }
                .class("d-flex flex-column")
            }
        }
    }
}
