//
//  Datatables.swift
//  PlotTabler
//

import Plot
import Foundation

public struct Datatables<T:Codable>: Component {
    @EnvironmentValue(.dependencies) var deps:DependencyAccumulator
    
    public struct Column {
        public enum DataType {
            case string
            case date
            case progress
        }
        
        let label:String
        let tag:String
        let dataType:DataType
        
        public init(label:String, dataType:DataType = .string) {
            self.label = label
            self.tag = label.lowercased()
            self.dataType = dataType
        }
        
        var sortDescriptor:String {
            switch dataType {
            case .string:
                return "'sort-\(tag)'"
            case .date:
                return "{ attr: 'data-date', name: 'sort-\(tag)' }"
            case .progress:
                return "{ attr: 'data-progress', name: 'sort-\(tag)' }"
            }
        }
        
        var className:String {
            return "sort-\(tag)"
        }
    }
    
    let uuid:UUID
    let columns:[Column]
    
    let data:[T]
    
    let script:String
    
    public init(data: [T]) {
        var cols:[Column] = []
        if let firstObj = data.first {
            Mirror(reflecting: firstObj).children.forEach {
                let dt:Column.DataType
                if $0.value is Date {
                    dt = .date
                } else {
                    dt = .string
                }
                if let label = $0.label {
                    cols.append(
                        Column(label: label.capitalized, dataType: dt)
                    )
                } else {
                    print($0)
                }
            }
        }
        self.uuid = UUID()
        self.columns = cols
        self.data = data
        
        print( self.columns.map { $0.sortDescriptor }.joined(separator: ", ") )
        
        self.script = """
        document.addEventListener("DOMContentLoaded", function() {
            const list = new List('table-\(uuid.uuidString)', {
                sortClass: 'table-sort',
                listClass: 'table-tbody',
                valueNames: [ \(self.columns.map { $0.sortDescriptor }.joined(separator: ", ")) ]
            });
        })
        """
    }
    
    public func body() async -> Component {
        // Library
        deps.addJSSource("/libs/list.js/dist/list.min.js")
        // Script
        deps.addRawScript(self.script)
        
        return await DivC("table-responsive") {
            await Element(name: "table") {
                
                // Table Header
                await Element(name: "thead") {
                    await Element(name: "tr") {
                        for column in columns {
                            await Element(name: "th") {
                                Button {
                                    Text(column.label)
                                }
                                .class("table-sort")
                                .attribute(named: "data-sort", value: "sort-\(column.tag)")
                            }
                        }
                    }
                }
                
                await Element(name: "tbody") {
                    for item in data {
                        await Element(name: "tr") {
                            for col in columns {
                                await Element(name: "td") {
                                    if let p = fetchParamFrom(item, forTag: col.tag) {
                                        Text("\(p.value)")
                                    } else {
                                        Text("")
                                    }
                                }.class(col.className)
                            }
                        }
                    }
                }.class("table-tbody")
                
                
            }.class("table")
        }
        .id("table-\(uuid.uuidString)")
    }
    
    private func fetchParamFrom(_ item:T, forTag tag:String) -> Mirror.Child? {
        Mirror(reflecting: item).children.first(where: {
            if let label = $0.label, label.localizedCaseInsensitiveContains(tag) {
                return true
            } else {
                return false
            }
        })
    }
}

struct Person:Codable {
    let name:String
    let city:String
    let type:String
    let score:Double
    let date:Date
    let quantity:Int
    let progress:Double
}
