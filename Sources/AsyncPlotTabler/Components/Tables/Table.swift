//
//  Tables.swift
//  PlotTabler
//

import Plot

public struct KeyedComponent {
    let colSpan:Int?
    let truncate:Bool
    let noHeader:Bool
    let key:String
    let component:Component
    let cellClass:String?
    
    public init(colSpan:Int? = nil, truncate:Bool = false, noHeader:Bool = false, key: String, component: Component, cellClass:String? = nil) {
        self.colSpan = colSpan
        self.truncate = truncate
        self.noHeader = noHeader
        self.key = key
        self.component = component
        self.cellClass = cellClass
    }
    
    public init(colSpan:Int? = nil, truncate:Bool = false, noHeader:Bool = false, key: String, @ComponentBuilder _ content:@escaping() async -> Component, cellClass:String? = nil) async {
        self.colSpan = colSpan
        self.truncate = truncate
        self.noHeader = noHeader
        self.key = key
        self.component = await content()
        self.cellClass = cellClass
    }
}

public protocol KeyedComponentGroup {
    //var keyed:[KeyedComponent] { get }
    func keyed() async -> [KeyedComponent]
}

public struct Tables: Component {
    public struct Group {
        let title:Component
        let items:[KeyedComponentGroup]
        
        public init(title: Component, items: [KeyedComponentGroup]) {
            self.title = title
            self.items = items
        }
    }
    
    public enum Style {
        case regular
        case striped
        case smallBorderless
        
        var css:String {
            switch self {
            case .regular: "table-vcenter card-table"
            case .striped: "table-vcenter card-table table-striped"
            case .smallBorderless: "table-sm table-borderless"
            }
        }
    }
    
    let style:Style
    let editable:Bool
    let groups:[Group]
    let caption:TableCaption? = nil
    private let columnCount:Int
    private let isGrouped:Bool
    
    public init(style: Style = .regular, editable:Bool = false, items: [KeyedComponentGroup]) async {
        self.style = style
        self.editable = editable
        self.groups = [Group(title: EmptyComponent(), items: items)]
        self.isGrouped = false
        self.columnCount = await groups.first?.items.first?.keyed().count ?? 1
    }
    
    public init(style: Style = .regular, editable:Bool = false, groups: [Group]) async {
        self.style = style
        self.editable = editable
        self.groups = groups
        self.isGrouped = true
        self.columnCount = await groups.first?.items.first?.keyed().count ?? 1
    }
    
    public func body() async -> Component {
        await DivC("table-responsive") {
            Plot.Table(
                caption: caption,
                header: TableRow(content: {
                    if let object = groups.first?.items.first {
                        for param in await object.keyed() {
                            if param.noHeader {
                                EmptyComponent()
                            } else {
                                if let cs = param.colSpan {
                                    await TableHeaderCell(param.key)
                                        .attribute(named: "colspan", value: "\(cs)")
                                } else {
                                    await TableHeaderCell(param.key)
                                }
                            }
                        }
                        if editable {
                            await TableHeaderCell("")
                        }
                    }
                }),
                footer: nil,
                rows: {
                    for group in groups {
                        if isGrouped {
                            TableRow {
                                TableCell {
                                    group.title
                                }
                                .attribute(named: "colspan", value: "\(columnCount)")
                                .class("subheader")
                            }
                        }
                        for item in group.items {
                            TableRow {
                                for (i, param) in await item.keyed().enumerated() {
                                    await TableCell(param.component)
                                        .class(i == 0 ? "" : "text-secondary")
                                        .class(param.truncate ? "td-truncate" : "")
                                        .class(param.cellClass ?? "")
                                }
                                if editable {
                                    await TableCell(Link(url: "#") { Text("Edit") })
                                }
                            }
                        }
                    }
                }
            )
            .class("table \(style.css)")
        }
    }
}

//public struct GroupedTables: Component {
//    
//    public struct Group {
//        let title:Component
//        let items:[KeyedComponentGroup]
//        
//        public init(title: Component, items: [KeyedComponentGroup]) {
//            self.title = title
//            self.items = items
//        }
//    }
//    
//    let style:Tables.Style
//    let editable:Bool
//    let groups:[Group]
//    let caption:TableCaption? = nil
//    private let columnCount:Int
//    
//    public init(style: Tables.Style = .regular, editable:Bool = false, groups: [Group]) async {
//        self.style = style
//        self.editable = editable
//        self.groups = groups
//        self.columnCount = await groups.first?.items.first?.keyed().count ?? 1
//    }
//    
//    public func body() async -> Component {
//        await DivC("table-responsive") {
//            Plot.Table(
//                caption: caption,
//                header: TableRow(content: {
//                    if let object = groups.first?.items.first {
//                        for param in await object.keyed() {
//                            if param.noHeader {
//                                EmptyComponent()
//                            } else {
//                                if let cs = param.colSpan {
//                                    await TableHeaderCell(param.key)
//                                        .attribute(named: "colspan", value: "\(cs)")
//                                } else {
//                                    await TableHeaderCell(param.key)
//                                }
//                            }
//                        }
//                        if editable {
//                            await TableHeaderCell("")
//                        }
//                    }
//                }),
//                footer: nil,
//                rows: {
//                    for group in groups {
//                        TableRow {
//                            TableCell {
//                                group.title
//                            }
//                            .attribute(named: "colspan", value: "\(columnCount)")
//                            .class("subheader")
//                        }
//                        for item in group.items {
//                            TableRow {
//                                for (i, param) in await item.keyed().enumerated() {
//                                    await TableCell(param.component)
//                                        .class(i == 0 ? "" : "text-secondary")
//                                        .class(param.truncate ? "td-truncate" : "")
//                                        .class(param.cellClass ?? "")
//                                }
//                                if editable {
//                                    await TableCell(Link(url: "#") { Text("Edit") })
//                                }
//                            }
//                        }
//                    }
//                }
//            )
//            .class("table \(style.css)")
//        }
//    }
//}

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

fileprivate struct TestUserFancy:KeyedComponentGroup {
    let name:String
    let title:String
    let department:String
    let email:String
    let role:String
    
    func keyed() async -> [KeyedComponent] {
        [
            await KeyedComponent(key: "name") {
                await DivC("d-flex py-1 align-items-center") {
                    Avatar(size: .md, .text(name.initials)).class("me-3")
                    await DivC("flex-fill") {
                        await DivC("font-weight-medium") { Text(name) }
                        await DivC("text-secondary") { Link(url: "#") { Text(email) }.class("text-reset") }
                    }
                }
            },
            await KeyedComponent(key: "title") {
                await ComponentGroup {
                    Div { Text(title) }.class("text-dark")
                    Div { Text(department) }.class("text-secondary")
                }
            },
            KeyedComponent(key: "role",  component: Text(role))
        ]
    }
    
    static let mockData:[TestUserFancy] = [
        TestUserFancy(name: "Pawel Kuna", title: "UI Designer", department: "Training", email: "pawelkuna@howstuffworks.com", role: "User"),
        TestUserFancy(name: "Jeffie Lewzey", title: "Chemical Engineer", department: "Support", email: "jlewzey1@seesaa.net", role: "Admin"),
        TestUserFancy(name: "Mallory Hulme", title: "Geologist IV", department: "Support", email: "mhulme2@domainmarket.com", role: "User")
    ]
}

fileprivate extension String {
    var initials:String {
        return self.split(separator: " ").map { $0.prefix(1) }.joined().uppercased()
    }
}
