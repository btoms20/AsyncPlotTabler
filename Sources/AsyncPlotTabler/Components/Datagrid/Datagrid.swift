//
//  Datagrid.swift
//  PlotTabler
//

import Plot
import Foundation

public struct Datagrid: Component {
    let uuid:UUID = UUID()
    let items:[Item]
    
    public init(items: [Item]) {
        self.items = items
    }
    
    public func body() async -> Component {
        await DivC("datagrid") {
            for item in items {
                await DivC("datagrid-item") {
                    item
                }
            }
        }
    }
}

extension Datagrid {
    public struct Item: Component {
        
        var title:String
        let content:Component
        
        public init(title: String, @ComponentBuilder _ content: ContentProvider) async {
            self.title = title
            self.content = await content()
        }
        
        public func body() async -> Component {
            await ComponentGroup {
                await DivC("datagrid-title") {
                    Text(title)
                }
                await DivC("ddatagrid-content") {
                    content
                }
            }
        }
    }
}

