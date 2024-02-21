import AsyncPlotTabler

/// Dropdown Demo Page
struct DropdownPage: Component {
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(header: .init(header: "Dropdowns"), content: {
            await Container(size: .xl) {
                await Row {
                    await Column(size: .large(.num(3))) {
                        await DropDownMenu(columns: [[
                            DropDownMenu_Header(header: "Dropdown Header"),
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                SVGIcon(icon: .activity)
                                    .class("dropdown-item-icon")
                                Text("Item 1")
                            }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                SVGIcon(icon: .edit)
                                    .class("dropdown-item-icon")
                                Text("Item 2")
                            }),
                            DropDownMenu_SingleItem(style: .div, {
                                Link(url: "#", label: { Text("My Profile") }).class("text-reset")
                                Plot.Form.Checkbox(label: "Public")
                                    .class("m-0 ms-auto")
                            }),
                            DropDownMenu_SingleItem(style: .label, {
                                Plot.Form.Checkbox(style: .radio, label: "Radio Input")
                                    .class("m-0 me-2")
                            }),
                            DropDownMenu_SingleItem(style: .label, {
                                Plot.Form.Checkbox(style: .check, label: "Checkbox Input")
                                    .class("m-0 me-2")
                            }),
                            DropDownMenu_SingleItem(style: .label, {
                                Plot.Form.Checkbox(style: .toggle, label: "Toggle Input")
                                    .class("m-0 me-2")
                            }),
                            DropDownMenu_Divider(),
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Dropdown Item 1")
                            }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Dropdown Item 2")
                            }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), disabled: true, {
                                Text("Dropdown Item Disabled")
                            }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), active: true, {
                                Text("Dropdown Item Active")
                            }),
                            DropDownMenu_Divider(),
                        
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                let user = MockData.Users.randomElement()!
                                Avatar(user.avatar).margin(.trailing(2))
                                Text(user.name)
                            }),
                            
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                let user = MockData.Users.randomElement()!
                                Avatar(user.avatar).margin(.trailing(2))
                                Text(user.name)
                            }),
                            
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                let user = MockData.Users.randomElement()!
                                Avatar(user.avatar).margin(.trailing(2))
                                Text(user.name)
                            }),
                            
                            DropDownMenu_Divider(),
                            
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                SVGIcon(icon: .logout)
                                    .class("dropdown-item-icon")
                                Text("Logout")
                            }),
                        ]])
                        .class("dropdown-menu-demo")
                    }
                    
                    await Column(size: .large(.num(3))) {
                        await DropDownMenu(columns: [[
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Action")
                            }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Another action")
                            }),
                        ]])
                        .class("dropdown-menu-demo")
                        
                        await DropDownMenu(columns: [[
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Action")
                            }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Another action")
                            }),
                            DropDownMenu_Divider(),
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Separated link")
                            }),
                        ]])
                        .class("dropdown-menu-demo")
                        
                        await DropDownMenu(columns: [[
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Action")
                            }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Another action")
                            }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), active: true, {
                                Text("Active action")
                            }),
                        ]])
                        .class("dropdown-menu-demo")
                        
                        await DropDownMenu(columns: [[
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Action")
                            }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Another action")
                            }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), disabled: true, {
                                Text("Disabled action")
                            }),
                        ]])
                        .class("dropdown-menu-demo")
                        
                        await DropDownMenu(columns: [[
                            DropDownMenu_Header(header: "Dropdown Header"),
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Action")
                            }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Another action")
                            }),
                        ]])
                        .class("dropdown-menu-demo")
                        
                        await DropDownMenu(columns: [[
                            DropDownMenu_Header(header: "Dropdown Header"),
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                SVGIcon(icon: .settings)
                                    .class("dropdown-item-icon")
                                Text("Item 1")
                            }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                SVGIcon(icon: .edit)
                                    .class("dropdown-item-icon")
                                Text("Item 1")
                            }),
                        ]])
                        .class("dropdown-menu-demo")
                        
                        await DropDownMenu(arrow: true, columns: [[
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Action")
                            }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Another action")
                            }),
                        ]])
                        .class("dropdown-menu-demo")
                        
                        await DropDownMenu(position: .end, arrow: true, columns: [[
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Action")
                                await Badge { Text("12") }.class("ms-auto")
                            }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Another action")
                                Badge(style: .dot(.green)).class("ms-auto")
                            }),
                        ]])
                        .class("dropdown-menu-demo")
                    }
                    
                    await Column(size: .large(.num(3))) {
                        await DropDownMenu(columns: [[
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Action")
                            }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Another action")
                            }),
                        ]])
                        .class("dropdown-menu-demo")
                        .theme(.dark)
                        
                        await DropDownMenu(columns: [[
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Action")
                            }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Another action")
                            }),
                            DropDownMenu_Divider(),
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Separated link")
                            }),
                        ]])
                        .class("dropdown-menu-demo")
                        .theme(.dark)
                        
                        await DropDownMenu(columns: [[
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Action")
                            }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Another action")
                            }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), active: true, {
                                Text("Active action")
                            }),
                        ]])
                        .class("dropdown-menu-demo")
                        .theme(.dark)
                        
                        await DropDownMenu(columns: [[
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Action")
                            }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Another action")
                            }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), disabled: true, {
                                Text("Disabled action")
                            }),
                        ]])
                        .class("dropdown-menu-demo")
                        .theme(.dark)
                        
                        await DropDownMenu(columns: [[
                            DropDownMenu_Header(header: "Dropdown Header"),
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Action")
                            }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Another action")
                            }),
                        ]])
                        .class("dropdown-menu-demo")
                        .theme(.dark)
                        
                        await DropDownMenu(columns: [[
                            DropDownMenu_Header(header: "Dropdown Header"),
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                SVGIcon(icon: .settings)
                                    .class("dropdown-item-icon")
                                Text("Item 1")
                            }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                SVGIcon(icon: .edit)
                                    .class("dropdown-item-icon")
                                Text("Item 1")
                            }),
                        ]])
                        .class("dropdown-menu-demo")
                        .theme(.dark)
                        
                        await DropDownMenu(arrow: true, columns: [[
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Action")
                            }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Another action")
                            }),
                        ]])
                        .class("dropdown-menu-demo")
                        .theme(.dark)
                        
                        await DropDownMenu(position: .end, arrow: true, columns: [[
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Action")
                                await Badge { Text("12") }.class("ms-auto")
                            }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), {
                                Text("Another action")
                                Badge(style: .dot(.green)).class("ms-auto")
                            }),
                        ]])
                        .class("dropdown-menu-demo")
                        .theme(.dark)
                    }
                    
                    await Column(size: .large(.num(3))) {
                        await DropDownMenu(columns: [[
                            DropDownMenu_SingleItem(style: .label, {
                                Plot.Form.Checkbox(style: .check, name: "dropdown-options", label: "Option 1")
                                    .class("m-0 me-2")
                            }),
                            DropDownMenu_SingleItem(style: .label, {
                                Plot.Form.Checkbox(style: .check, name: "dropdown-options", label: "Option 2")
                                    .class("m-0 me-2")
                            }),
                            DropDownMenu_SingleItem(style: .label, {
                                Plot.Form.Checkbox(style: .check, name: "dropdown-options", label: "Option 3")
                                    .class("m-0 me-2")
                            }),
                        ]])
                        .class("dropdown-menu-demo")
                        
                        await DropDownMenu(columns: [[
                            DropDownMenu_SingleItem(style: .label, {
                                Plot.Form.Checkbox(style: .radio, name: "dropdown-radio", label: "Option 1")
                                    .class("m-0 me-2")
                            }),
                            DropDownMenu_SingleItem(style: .label, {
                                Plot.Form.Checkbox(style: .radio, name: "dropdown-radio", label: "Option 2")
                                    .class("m-0 me-2")
                            }),
                            DropDownMenu_SingleItem(style: .label, {
                                Plot.Form.Checkbox(style: .radio, name: "dropdown-radio", label: "Option 3")
                                    .class("m-0 me-2")
                            }),
                        ]])
                        .class("dropdown-menu-demo")
                        
                        await DropDownMenu(columns: [
                            MockData.Users.asyncMap { user in
                                await DropDownMenu_SingleItem(style: .link(url: "#"), {
                                    Avatar(user.avatar).margin(.trailing(2))
                                    Text(user.name)
                                })
                            }
                        ])
                        .class("dropdown-menu-demo")
                    }
                }
            }
        }))
    }
}
