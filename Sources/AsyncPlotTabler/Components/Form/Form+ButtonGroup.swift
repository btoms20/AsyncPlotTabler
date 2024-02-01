//
//  Form+ButtonGroup.swift
//  PlotTabler
//

import Plot
import Foundation

extension Plot.Form {
    struct ButtonGroup:Component {
        
        enum Selection {
            case one
            case many
            
            var inputType:HTMLInputType {
                switch self {
                case .one: .radio
                case .many: .checkbox
                }
            }
        }
        
        enum Layout {
            case inline
            case vertical
            
            var containerCSS:String {
                switch self {
                case .inline: "btn-group"
                case .vertical: "btn-group-vertical"
                }
            }
        }
        
        let uuid:UUID
        let name:String
        let items:[KeyedComponent]
        let itemsClass:String?
        let selection:Selection
        let layout:Layout
        let dropdownMenu:[KeyedComponent]?
        
        init(name: String, selection: Selection = .one, layout: Layout = .inline, items: [KeyedComponent], itemsClass:String? = nil, withDropDownMenu:[KeyedComponent]? = nil) {
            self.uuid = UUID()
            self.name = name
            self.items = items
            self.itemsClass = itemsClass
            self.selection = selection
            self.layout = layout
            self.dropdownMenu = withDropDownMenu
        }
        
        func body() async -> Component {
            await DivC("w-100") {
                for (i, item) in items.enumerated() {
                    Input(type: selection.inputType, name: name, value: item.key)
                        .class("btn-check")
                        .id("buttongroup-\(uuid.uuidString)-\(i)")
                    await Element(name: "label") {
                        item.component
                    }
                    .attribute(named: "for", value: "buttongroup-\(uuid.uuidString)-\(i)")
                    .attribute(named: "type", value: "button")
                    .class("btn")
                    .class(itemsClass ?? "")
                }
                await buildDropdownMenu()
            }
            .class(layout.containerCSS)
            .attribute(named: "role", value: "group")
        }
        
        func buildDropdownMenu() async -> Component {
            guard let dropdownMenu else { return EmptyComponent() }
            return await DivC("btn-group") {
                Input(type: selection.inputType, name: name)
                    .class("btn-check")
                    .id("buttongroup-\(uuid.uuidString)-dropdown")
                await Element(name: "label") {
                    Text("Other")
                }
                .attribute(named: "for", value: "buttongroup-\(uuid.uuidString)-dropdown")
                .attribute(named: "data-bs-toggle", value: "dropdown")
                .attribute(named: "aria-haspopup", value: "true")
                .attribute(named: "aria-expanded", value: "false")
                .class("btn dropdown-toggle")
                await DivC("dropdown-menu") {
                    for item in dropdownMenu {
                        await Element(name: "label") {
                            Input(type: selection.inputType, name: name, value: item.key)
                                .class("form-check-input m-0 me-2")
                            item.component
                        }
                        .class("dropdown-item")
                    }
                }
            }
            .attribute(named: "role", value: "group")
        }
    }
}
