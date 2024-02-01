//
//  Datagrid.swift
//  PlotTabler
//

import Plot
import Foundation

struct Datagrid: Component {
    let uuid:UUID = UUID()
    let items:[Item]
    
    func body() async -> Component {
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
    struct Item: Component {
        
        var title:String
        @ComponentBuilder let content:Component
        
        func body() async -> Component {
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

