//
//  CardTable.swift
//  PlotTabler
//

import Plot

public struct CardTable: ExplicitlySized {
    let size: Column.Size?
    let table: Tables
    
    public init(size: Column.Size? = nil, table:Tables) {
        self.size = size
        self.table = table
    }
    
    public init(size: Column.Size? = nil, items:[KeyedComponentGroup]) async {
        self.size = size
        self.table = await Tables(items: items)
    }
    
    public func body() async -> Component {
        await DivC("card") {
            table
        }
    }
}


// Mock Data
fileprivate struct TestUser:KeyedComponentGroup {
    let name:String
    let title:String
    let email:String
    let role:String
    
    func keyed() async -> [KeyedComponent] {
        [
            .init(key: "name",  component: Text(name)),
            .init(key: "title", component: Text(title)),
            .init(key: "email", component: Text(email)),
            .init(key: "role",  component: Text(role)),
        ]
    }
    
    static let mockData:[TestUser] = [
        TestUser(name: "Pawel Kuna", title: "UI Designer, Training", email: "pawelkuna@howstuffworks.com", role: "User"),
        TestUser(name: "Jeffie Lewzey", title: "Chemical Engineer, Support", email: "jlewzey1@seesaa.net", role: "Admin"),
        TestUser(name: "Mallory Hulme", title: "Geologist IV, Support", email: "mhulme2@domainmarket.com", role: "User")
    ]
}
