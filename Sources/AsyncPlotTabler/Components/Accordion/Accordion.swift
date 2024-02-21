//
//  Accordion.swift
//  PlotTabler
//

import Plot
import Foundation

public struct Accordion: Component {
    public struct Item {
        let header:Plot.Button
        let content:Component
        
        public init(header: Plot.Button, @ComponentBuilder _ content: ContentProvider) async {
            self.header = header
            self.content = await content()
        }
    }
    
    let items:[Item]
    let uuid:UUID = UUID()
    
    public init(items: [Item]) {
        self.items = items
    }
    
    public func body() async -> Component {
        await DivC("accordion") {
            for (i, item) in items.enumerated() {
                await DivC("accordion-item") {
                    // Header
                    H2 {
                        item.header
                        .class("accordion-button")
                        .class(i == 0 ? "" : "collapsed")
                        .attribute(named: "type", value: "button")
                        .attribute(named: "data-bs-toggle", value: "collapse")
                        .attribute(named: "data-bs-target", value: "#accordion-\(uuid.uuidString)-collapse-\(i)")
                        //.attribute(named: "aria-expanded", value: i == 0 ? "true" : "false")
                    }
                    .id("accordion-\(uuid.uuidString)-heading-\(i)")
                    .class("accordion-header")
                    
                    // Content
                    await DivC("accordion-collapse collapse") {
                        await DivC("accordion-body pt-0") {
                            item.content
                        }
                    }
                    .id("accordion-\(uuid.uuidString)-collapse-\(i)")
                    .class(i == 0 ? "show" : "")
                    .attribute(named: "data-bs-parent", value: "#accordion-\(uuid.uuidString)-header")
                }
            }
        }
        .id("accordion-\(uuid.uuidString)-header")
    }
}
