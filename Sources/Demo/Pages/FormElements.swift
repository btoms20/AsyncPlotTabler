import AsyncPlotTabler
import Foundation

struct FormElementsPage: Component {
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(header: .init(header: "Form Elements"), content: {
            await CardVStack {
                await Card(
                    header: .init({
                        Card.Title("Form elements")
                    }),
                    body: .init({
                        await CardHStack(margin: false) {
                            await Card(
                                border: .none,
                                body: .init({
                                    // Textfields
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Static")
                                        Plot.Form.Plaintext("Input Value")
                                    }
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Text")
                                        Plot.Form.Textfield(type: .text, name: "example-text-input", placeholder: "Input placeholder")
                                    }
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Password")
                                        Plot.Form.Textfield(type: .password, name: "example-password-input", value: "password", placeholder: "password")
                                    }
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Disabled")
                                        Plot.Form.Textfield(type: .text, name: "example-disabled-input", value: "Disabled", placeholder: "Input placeholder", disabled: true)
                                    }
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Read Only")
                                        Plot.Form.Textfield(type: .text, name: "example-readonly-input", value: "Readonly", placeholder: "Input placeholder", readonly: true)
                                    }
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Required")
                                            .class("required")
                                        Plot.Form.Textfield(type: .text, name: "example-required-input", placeholder: "Required...")
                                    }
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Textarea")
                                        Plot.Form.Textarea(name: "example-textarea-input", placeholder: "lots of text", rows: 5)
                                    }
                                    
                                    // Selections
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Select")
                                        await Plot.Form.Selection(name: "simple-select", options: [
                                            .init(value: "1", label: { Text("One") }),
                                            .init(value: "2", label: { Text("Two") }),
                                            .init(value: "3", label: { Text("Three") })
                                        ])
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Select Multiple")
                                        await Plot.Form.Selection(name: "multiple-select", multiselect: true, options: [
                                            .init(value: "1", label: { Text("One") }),
                                            .init(value: "2", label: { Text("Two") }),
                                            .init(value: "3", label: { Text("Three") })
                                        ])
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Select Multiple Tags")
                                        await Plot.Form.TomSelection(multiselect: true, options: [
                                            .init(value: "AL", label: { Text("Alabama") }),
                                            .init(value: "AK", label: { Text("Alaska") }),
                                            .init(value: "AZ", label: { Text("Arizona") }),
                                            .init(value: "AR", label: { Text("Arkansas") }),
                                            .init(value: "CA", label: { Text("California") }),
                                            .init(value: "CO", label: { Text("Colorado") }),
                                            .init(value: "CT", label: { Text("Connecticut") }),
                                            .init(value: "DE", label: { Text("Delaware") }),
                                        ])
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Input Group")
                                        await Plot.Form.InputGroup {
                                            Plot.Form.Textfield(name: "input-group-textfield", placeholder: "Search for...")
                                            await RawButton { Text("Go!") }
                                        }
                                        await Plot.Form.InputGroup {
                                            await Plot.Form.DropDownButton(label: "Action", items: [
                                                DropDownMenu_SingleItem(url: "#", content: { Text("Action") }),
                                                DropDownMenu_SingleItem(url: "#", content: { Text("Another action") }),
                                            ])
                                            Plot.Form.Textfield(name: "input-group-textfield", placeholder: "Text input with dropdown button")
                                            
                                        }
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Input Group Buttons")
                                        await Plot.Form.InputGroup {
                                            Plot.Form.Textfield(name: "input-group-buttons-textfield", placeholder: "Text input with multiple buttons")
                                            await RawButton { Text("Action") }
                                            await Plot.Form.DropDownButton(label: "", items: [
                                                DropDownMenu_SingleItem(url: "#", content: { Text("Action") }),
                                                DropDownMenu_SingleItem(url: "#", content: { Text("Another action") }),
                                            ])
                                        }
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Icon Input")
                                        await Plot.Form.InputWithIcon(trailing: .icon(.search)) {
                                            Plot.Form.Textfield(name: "input-group-textfield", placeholder: "Search for...")
                                        }
                                        await Plot.Form.InputWithIcon(leading: .icon(.user)) {
                                            Plot.Form.Textfield(name: "input-group-textfield", placeholder: "Username")
                                        }
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Loader Input")
                                        await Plot.Form.InputWithIcon(trailing: .loading(color: .secondary)) {
                                            Plot.Form.Textfield(name: "input-group-textfield", placeholder: "Loading...")
                                        }
                                        await Plot.Form.InputWithIcon(leading: .loading(color: .azure)) {
                                            Plot.Form.Textfield(name: "input-group-textfield", placeholder: "Loading...")
                                        }
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Separated Input")
                                        await DivC("row g-2") {
                                            await DivC("col") {
                                                Plot.Form.Textfield(name: "input-group-textfield", placeholder: "Search for...")
                                            }
                                            await DivC("col-auto") {
                                                await RawButton {
                                                    SVGIcon(icon: .search).class("m-0")
                                                }
                                            }
                                        }
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Input with help icon")
                                        await DivC("row g-2") {
                                            await DivC("col") {
                                                Plot.Form.Textfield(name: "input-group-textfield", placeholder: "Search for...")
                                            }
                                            await DivC("col-auto align-self-center") {
                                                Span { Text("?") }
                                                .class("form-help")
                                                .attribute(named: "data-bs-toggle", value: "popover")
                                                .attribute(named: "data-bs-placement", value: "top")
                                                .attribute(named: "data-bs-content", value: """
                                                <p>ZIP Code must be US or CDN format. You can use an extended ZIP+4 code to determine address more accurately.</p>
                                                <p class='mb-0'><a href='#'>USP ZIP codes lookup tools</a></p>
                                                """)
                                            }
                                        }
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Form Control Rounded")
                                        
                                        Plot.Form.Textfield(name: "input-group-textfield-rounded", placeholder: "Text...", style: .rounded)
                                            .style("margin-bottom:8px")
                                        
                                        await Plot.Form.InputWithIcon(trailing: .icon(.search)) {
                                            Plot.Form.Textfield(name: "input-group-textfield-rounded-icon", placeholder: "Search for...", style: .rounded)
                                        }
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Form Control Flush")
                                        
                                        Plot.Form.Textfield(name: "input-group-textfield-flush", placeholder: "Text...", style: .flush)
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Input Group With Static Prefix / Suffix")
                                        
                                        await Plot.Form.InputGroup {
                                            await Plot.Form.InputGroupText { Text("@") }
                                            Plot.Form.Textfield(name: "input-prefix-text-textfield", placeholder: "Username")
                                        }
                                        
                                        await Plot.Form.InputGroup {
                                            Plot.Form.Textfield(name: "input-suffix-text-textfield", placeholder: "subdomain")
                                            await Plot.Form.InputGroupText { Text(".tabler.io") }
                                        }
                                        
                                        await  Plot.Form.InputGroup {
                                            await Plot.Form.InputGroupText { Text("https://") }
                                            Plot.Form.Textfield(name: "input-prefix-suffix-text-textfield", placeholder: "subdomain")
                                            await Plot.Form.InputGroupText { Text(".tabler.io") }
                                        }
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Input Group With Checkbox / Radios")
                                        
                                        await Plot.Form.InputGroup {
                                            await Plot.Form.InputGroupText {
                                                Plot.Form.Checkbox(checked: true)
                                                    .class("m-0")
                                            }
                                            Plot.Form.Textfield(name: "input-checkbox-textfield", placeholder: "An optional textfield")
                                        }
                                        
                                        await Plot.Form.InputGroup {
                                            Plot.Form.Textfield(name: "input-radio-textfield", placeholder: "An optional textfield")
                                            await Plot.Form.InputGroupText {
                                                Plot.Form.Checkbox(style: .radio, checked: true)
                                                    .class("m-0")
                                            }
                                        }
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Input Group With Inline Prefixed Text")
                                        
                                        await Plot.Form.InputGroup {
                                            await Plot.Form.InputGroupText { Text("https://tabler.io/users/") }
                                            Plot.Form.Textfield(name: "input-prepended-text-textfield", placeholder: "your-username")
                                                .class("ps-0")
                                        }.class("input-group-flat")
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Input Group With Inline Suffixed Text")
                                        
                                        await Plot.Form.InputGroup {
                                            Plot.Form.Textfield(name: "input-appended-text-textfield", placeholder: "your-subdomain")
                                                .class("text-end pe-0")
                                            await Plot.Form.InputGroupText { Text(".tabler.io") }
                                        }.class("input-group-flat")
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Input Group With Inline Suffixed link")
                                        
                                        await Plot.Form.InputGroup {
                                            Plot.Form.Textfield(name: "input-appended-link-textfield", placeholder: "password")
                                            await Plot.Form.InputGroupText {
                                                Plot.Link("Show password", url: "#")
                                                    .class("input-group-link")
                                            }
                                        }.class("input-group-flat")
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Input Group With Inline Suffixed KBD")
                                        
                                        await Plot.Form.InputGroup {
                                            Plot.Form.Textfield(name: "input-appended-kbd-textfield", placeholder: "some input")
                                            await Plot.Form.InputGroupText {
                                                await Element(name: "kbd") {
                                                    Text("ctrl + K")
                                                }
                                            }
                                        }.class("input-group-flat")
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Input Group With Inline Suffixed Buttons")
                                        
                                        await Plot.Form.InputGroup {
                                            Plot.Form.Textfield(name: "input-appended-kbd-textfield", placeholder: "some input")
                                            await Plot.Form.InputGroupText {
                                                Plot.Link(url: "#") {
                                                    SVGIcon(icon: .x, color: .secondary)
                                                }
                                                .class("link-secondary")
                                                .attribute(named: "title", value: "Clear Search")
                                                .attribute(named: "data-bs-toggle", value: "tooltip")
                                                
                                                Plot.Link(url: "#") {
                                                    SVGIcon(icon: .adjustments, color: .secondary)
                                                }
                                                .class("link-secondary ms-2")
                                                .attribute(named: "title", value: "Search settings")
                                                .attribute(named: "data-bs-toggle", value: "tooltip")
                                                
                                                Plot.Link(url: "#") {
                                                    SVGIcon(icon: .bell, color: .secondary)
                                                }
                                                .class("link-secondary ms-2 disabled")
                                                .attribute(named: "title", value: "Add notification")
                                                .attribute(named: "data-bs-toggle", value: "tooltip")
                                            }
                                        }.class("input-group-flat")
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Floating inputs")
                                        
                                        await DivC("form-floating mb-3") {
                                            Plot.Form.Textfield(type: .email, name: "floating-email", value: "name@example.com")
                                            await Element(name: "label") {
                                                Text("Email address")
                                            }.class("floating-input")
                                        }
                                        
                                        await DivC("form-floating mb-3") {
                                            Plot.Form.Textfield(type: .password, name: "floating-password", value: "password")
                                            await Element(name: "label") {
                                                Text("Password")
                                            }.class("floating-input")
                                        }
                                        
                                        await DivC("form-floating mb-3") {
                                            await Plot.Form.Selection(name: "floating-selection", options: [
                                                .init(value: "") { Text("Open this select menu") },
                                                .init(value: "1") { Text("One") },
                                                .init(value: "2") { Text("Two") },
                                                .init(value: "3") { Text("Three") }
                                            ])
                                            .attribute(named: "aria-label", value: "Floating label select example")
                                            await Element(name: "label") {
                                                Text("Select")
                                            }.class("floating-input")
                                        }
                                        
                                    }
                                    
                                })
                            )
                            await Card(
                                border: .none,
                                body: .init({
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Image Check")
                                        Plot.Form.ImageSelection(name: "imageselection-check", selection: .many, colWidth: .num(4), options: [
                                            .init(value: "1", src: "./static/photos/beautiful-blonde-woman-relaxing-with-a-can-of-coke-on-a-tree-stump-by-the-beach.jpg", alt: "Beautiful blonde woman relaxing with a can of coke on a tree stump by the beach", selected: false),
                                            .init(value: "2", src: "./static/photos/brainstorming-session-with-creative-designers.jpg", alt: "Brainstorming session with creative designers", selected: true),
                                            .init(value: "3", src: "./static/photos/finances-us-dollars-and-bitcoins-currency-money.jpg", alt: "Finances - US Dollars and Bitcoins - Currency - Money", selected: false),
                                            .init(value: "4", src: "./static/photos/group-of-people-brainstorming-and-taking-notes-2.jpg", alt: "Group of people brainstorming and taking notes", selected: true),
                                            .init(value: "5", src: "./static/photos/blue-sofa-with-pillows-in-a-designer-living-room-interior.jpg", alt: "Blue sofa with pillows in a designer living room interior", selected: false),
                                            .init(value: "6", src: "./static/photos/home-office-desk-with-macbook-iphone-calendar-watch-and-organizer.jpg", alt: "Home office desk with Macbook, iPhone, calendar, watch & organizer", selected: false),
                                        ])
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Image Radio")
                                        Plot.Form.ImageSelection(name: "imageselection-check", selection: .one, colWidth: .num(4), options: [
                                            .init(value: "1", src: "./static/photos/group-of-people-sightseeing-in-the-city.jpg", alt: "Group of people sightseeing in the city", selected: true),
                                            .init(value: "2", src: "./static/photos/color-palette-guide-sample-colors-catalog-.jpg", alt: "Color Palette Guide. Sample Colors Catalog.", selected: false),
                                            .init(value: "3", src: "./static/photos/stylish-workplace-with-computer-at-home.jpg", alt: "Stylish workplace with computer at home", selected: false),
                                            .init(value: "4", src: "./static/photos/pink-desk-in-the-home-office.jpg", alt: "Pink desk in the home office", selected: true),
                                            .init(value: "5", src: "./static/photos/young-woman-sitting-on-the-sofa-and-working-on-her-laptop.jpg", alt: "Young woman sitting on the sofa and working on her laptop", selected: false),
                                            .init(value: "6", src: "./static/photos/coffee-on-a-table-with-other-items.jpg", alt: "Coffee on a table with other items", selected: false),
                                        ])
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Color Input")
                                        await DivC("row g-2") {
                                            for color in Colors.allColors.prefix(11) {
                                                await DivC("col-auto") {
                                                    await Element(name: "label") {
                                                        Input(type: .radio, name: "color", value: color.css)
                                                            .class("form-colorinput-input")
                                                        Span { }.class("form-colorinput-color \(color.backgroundCSS)")
                                                    }.class("form-colorinput")
                                                }
                                            }
                                        }
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Color Input")
                                        await DivC("row g-2") {
                                            for color in Colors.allColors.prefix(11) {
                                                await DivC("col-auto") {
                                                    await Element(name: "label") {
                                                        Input(type: .radio, name: "color-rounded", value: color.css)
                                                            .class("form-colorinput-input")
                                                        Span { }.class("form-colorinput-color \(color.backgroundCSS) rounded-circle")
                                                    }.class("form-colorinput")
                                                }
                                            }
                                        }
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Color picker")
                                        Plot.Form.ColorPicker(defaultColor: "#0054a6", style: .system)
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Validation States")
                                        Plot.Form.Textfield(type: .text, name: "validation-state-valid", placeholder: "valid state")
                                            .class("is-valid mb-2")
                                        Plot.Form.Textfield(type: .text, name: "validation-state-invalid", placeholder: "invalid state")
                                            .class("is-invalid mb-2")
                                        await DivC("invalid-feedback") { Text("Invalid feedback") }
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Validation States (lite)")
                                        Plot.Form.Textfield(type: .text, name: "validation-state-valid-lite", value: "A valid input", placeholder: "valid state")
                                            .class("is-valid is-valid-lite mb-2")
                                        Plot.Form.Textfield(type: .text, name: "validation-state-invalid-lite", placeholder: "invalid state")
                                            .class("is-invalid is-invalid-lite mb-2")
                                    }
                                    
                                    Plot.Form.Label("Form fieldset")
                                    Plot.FieldSet {
                                        await DivC("mb-3") {
                                            Plot.Form.Label("Full name")
                                                .class("required")
                                            Plot.Form.Textfield(type: .text, name: "fieldset-name", placeholder: "Full name")
                                        }
                                        await DivC("mb-3") {
                                            Plot.Form.Label("Company")
                                                .class("required")
                                            Plot.Form.Textfield(type: .text, name: "fieldset-company", placeholder: "Company")
                                        }
                                        await DivC("mb-3") {
                                            Plot.Form.Label("Email")
                                                .class("required")
                                            Plot.Form.Textfield(type: .email, name: "fieldset-name", placeholder: "email@address.com")
                                        }
                                        await DivC("mb-3") {
                                            Plot.Form.Label("Phone number")
                                            Plot.Form.Textfield(type: .text, name: "fieldset-name", placeholder: "(123)456-7890")
                                        }
                                        Form.Checkbox(label: "I agree to the Terms & Conditions", required: true)
                                            
                                    }.class("form-fieldset")
                                    
                                    await DivC("col-md-6 col-xl-12") {
                                        
                                        await DivC("mb-3") {
                                            Plot.Form.Label("Simple selectgroup")
                                            await Plot.Form.SelectGroup(name: "selectgroup-simple", selection: .many, layout: .inline, style: .regular, items: [
                                                .init(key: "HTML", { Text("HTML") }),
                                                .init(key: "CSS", { Text("CSS") }),
                                                .init(key: "PHP", { Text("PHP") }),
                                                .init(key: "JS", { Text("JavaScript") })
                                            ])
                                        }
                                        
                                        await DivC("mb-3") {
                                            Plot.Form.Label("Icon selectgroup")
                                            await Plot.Form.SelectGroup(name: "selectgroup-icon", selection: .one, layout: .inline, style: .regular, items: [
                                                .init(key: "sun", { SVGIcon(icon: .sun) }),
                                                .init(key: "moon", { SVGIcon(icon: .moon) }),
                                                .init(key: "cloud-rain", { SVGIcon(icon: .cloud_rain) }),
                                                .init(key: "cloud", { SVGIcon(icon: .cloud) }),
                                                .init(key: "other", { Text("Other") })
                                            ])
                                        }
                                        
                                        await DivC("mb-3") {
                                            Plot.Form.Label("Selectgroup with icons and text")
                                            await Plot.Form.SelectGroup(name: "selectgroup-icon-text", selection: .one, layout: .inline, style: .regular, items: [
                                                .init(key: "home",   { IconLabel(icon: .home, text: "Home")      }),
                                                .init(key: "user",   { IconLabel(icon: .user, text: "User")      }),
                                                .init(key: "circle", { IconLabel(icon: .circle, text: "Circle")  }),
                                                .init(key: "square", { IconLabel(icon: .square, text: "Square")  }),
                                            ])
                                        }
                                        
                                        await DivC("mb-3") {
                                            Plot.Form.Label("Pills selectgroup")
                                            await Plot.Form.SelectGroup(name: "selectgroup-simple-pills", selection: .many, layout: .inline, style: .pills, items: [
                                                .init(key: "HTML", { Text("HTML") }),
                                                .init(key: "CSS", { Text("CSS") }),
                                                .init(key: "PHP", { Text("PHP") }),
                                                .init(key: "JS", { Text("JavaScript") })
                                            ])
                                        }
                                        
                                        await DivC("mb-3") {
                                            Plot.Form.Label("Payment Method selectgroup")
                                            await Plot.Form.SelectGroup(name: "selectgroup-payment-method", selection: .one, layout: .vertical(includeCheckbox: true), items: [
                                                .init(key: "visa", {
                                                    Span { }.class("payment payment-provider-visa payment-xs me-2")
                                                    Text("ending in&nbsp;")
                                                    await Element(name: "strong") { Text("7998") }
                                                }),
                                                .init(key: "mastercard", {
                                                    Span { }.class("payment payment-provider-mastercard payment-xs me-2")
                                                    Text("ending in&nbsp;")
                                                    await Element(name: "strong") { Text("2807") }
                                                }),
                                                .init(key: "paypal", {
                                                    Span { }.class("payment payment-provider-paypal payment-xs me-2")
                                                    Text("Paypal Account")
                                                }),
                                            ])
                                        }
                                        
                                        await DivC("mb-3") {
                                            Plot.Form.Label("Project Manager selectgroup")
                                            await Plot.Form.SelectGroup(name: "selectgroup-project-manager", selection: .many, layout: .vertical(includeCheckbox: true), items: [
                                                .init(key: "PK", {
                                                    Avatar(size: .lg, .text("PK"))
                                                        .margin(.trailing(3))
                                                    Div {
                                                        Div { Text("Pawel Kuna") }.fontWeight(.medium)
                                                        Div { Text("UI Designer") }.textColor(.secondary)
                                                    }
                                                }),
                                                .init(key: "JL", {
                                                    Avatar(size: .lg, .text("JL"))
                                                        .margin(.trailing(3))
                                                    Div {
                                                        Div { Text("Jeffie Lewzey") }.fontWeight(.medium)
                                                        Div { Text("Chemical Engineer") }.textColor(.secondary)
                                                    }
                                                }),
                                                .init(key: "MH", {
                                                    Avatar(size: .lg, .text("MH"))
                                                        .margin(.trailing(3))
                                                    Div {
                                                        Div { Text("Mallory Hulme") }.fontWeight(.medium)
                                                        Div { Text("Geologist IV") }.textColor(.secondary)
                                                    }
                                                }),
                                                .init(key: "DS", {
                                                    Avatar(size: .lg, .text("DS"))
                                                        .margin(.trailing(3))
                                                    Div {
                                                        Div { Text("Dunn Slane") }.fontWeight(.medium)
                                                        Div { Text("Research Nurse") }.textColor(.secondary)
                                                    }
                                                }),
                                                .init(key: "EL", {
                                                    Avatar(size: .lg, .text("EL"))
                                                        .margin(.trailing(3))
                                                    Div {
                                                        Div { Text("Emmy Levet") }.fontWeight(.medium)
                                                        Div { Text("VP Product Management") }.textColor(.secondary)
                                                    }
                                                }),
                                            ])
                                        }
                                        
                                        await DivC("mb-3") {
                                            Plot.Form.Label("Button Group")
                                            await Plot.Form.ButtonGroup(name: "buttongroup-horizontal", selection: .one, layout: .inline, items: [
                                                .init(key: "1", { Text("1 min") }),
                                                .init(key: "5", { Text("5 mins") }),
                                                .init(key: "10", { Text("10 mins") }),
                                                .init(key: "30", { Text("30 mins") }),
                                            ])
                                        }
                                        
                                        await DivC("mb-3") {
                                            Plot.Form.Label("Button Group w/ Dropdown")
                                            
                                            await Plot.Form.ButtonGroup(name: "buttongroup-horizontal-dropdown", selection: .one, layout: .inline, items: [
                                                .init(key: "1", { Text("1 min") }),
                                                .init(key: "5", { Text("5 mins") }),
                                                .init(key: "10", { Text("10 mins") }),
                                            ], withDropDownMenu: [
                                                .init(key: "15", { Text("15 mins") }),
                                                .init(key: "30", { Text("30 mins") }),
                                                .init(key: "60", { Text("60 mins") }),
                                            ])
                                        }
                                        
                                        await DivC("row") {
                                            await DivC("col") {
                                                await DivC("mb-3") {
                                                    Plot.Form.Label("Vertical button group")
                                                    await Plot.Form.ButtonGroup(name: "buttongroup-vertical", selection: .one, layout: .vertical, items: [
                                                        .init(key: "1", { Text("1 min") }),
                                                        .init(key: "5", { Text("5 mins") }),
                                                        .init(key: "10", { Text("10 mins") }),
                                                        .init(key: "30", { Text("30 mins") }),
                                                    ])
                                                }
                                            }
                                            await DivC("col") {
                                                await DivC("mb-3") {
                                                    Plot.Form.Label("Vertical button dropdown")
                                                    await Plot.Form.ButtonGroup(name: "buttongroup-vertical-dropdown", selection: .many, layout: .vertical, items: [
                                                        .init(key: "1", { Text("1 min") }),
                                                        .init(key: "5", { Text("5 mins") }),
                                                        .init(key: "10", { Text("10 mins") }),
                                                    ], withDropDownMenu: [
                                                        .init(key: "15", { Text("15 mins") }),
                                                        .init(key: "30", { Text("30 mins") }),
                                                        .init(key: "60", { Text("60 mins") }),
                                                    ])
                                                }
                                            }
                                        }
                                        
                                        await DivC("mb-3") {
                                            Plot.Form.Label("Button Group")
                                            await Plot.Form.ButtonGroup(
                                                name: "buttongroup-toolbar",
                                                selection: .one,
                                                layout: .inline,
                                                items: Array<Icons>([.bold, .italic, .underline, .copy, .scissors, .file_plus, .file_minus]).enumerated().asyncMap { item in
                                                    await .init(key: "\(item.offset)", { SVGIcon(icon: item.element) })
                                                },
                                                itemsClass: "btn-icon"
                                            )
                                        }
                                    }
                                })
                            )
                            await Card(
                                border: .none,
                                body: .init({
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Radios")
                                        Div {
                                            for i in (1...4) {
                                                Plot.Form.Checkbox(
                                                    style: .radio,
                                                    name: "vertical-radios",
                                                    label: "Option \(i)",
                                                    checked: i == 1 || i == 4,
                                                    required: false,
                                                    disabled: i == 4
                                                )
                                            }
                                        }
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Inline Radios")
                                        Div {
                                            for i in (1...3) {
                                                Plot.Form.Checkbox(
                                                    style: .radio,
                                                    name: "inline-radios",
                                                    label: "Option \(i)",
                                                    checked: i == 1,
                                                    required: false,
                                                    disabled: i == 3
                                                )
                                                .class("form-check-inline")
                                            }
                                        }
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Checkboxes")
                                        Div {
                                            for i in (1...3) {
                                                Plot.Form.Checkbox(style: .check, label: "Option \(i)", checked: i == 3, required: false, disabled: i == 2)
                                            }
                                        }
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Inline Checkboxes")
                                        Div {
                                            for i in (1...3) {
                                                Plot.Form.Checkbox(style: .check, label: "Option \(i)", checked: i == 3, required: false, disabled: i == 2)
                                                .class("form-check-inline")
                                            }
                                        }
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Checkboxes w/ descriptions")
                                        Div {
                                            for i in (1...3) {
                                                Plot.Form.Checkbox(
                                                    label: "Option \(i)",
                                                    description: "Ab alias aut, consequuntur cumque esse eveniet incidunt laborum minus molestiae.",
                                                    checked: i == 2,
                                                    required: false
                                                )
                                            }
                                        }
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Toggle Switches")
                                        Div {
                                            for i in (1...3) {
                                                Plot.Form.Checkbox(
                                                    style: .toggle,
                                                    label: "Option \(i)",
                                                    description: i == 3 ? "Ab alias aut, consequuntur cumque esse eveniet incidunt laborum minus molestiae." : nil,
                                                    checked: i == 3
                                                )
                                            }
                                        }
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Single Switch w/ Label")
                                        Plot.Form.Checkbox(style: .toggle, label: "I agree with the terms and conditions", checked: false)
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Notification Group")
                                        Plot.Form.ToggleSettingsGroup(title: "Notifications", settings: [
                                            .init(value: true, label: "Push Notifications", description: "iOS / Android alerts / badges / banners", color: .blue),
                                            .init(value: false, label: "SMS Notifications", description: "carrier rates may apply", color: .red),
                                            .init(value: true, label: "Email Notifications", description: "promotional and news letters", color: .orange)
                                        ])
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Custom File Input")
                                        Input(type: .file).class("form-control")
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Date of birth")
                                        await DivC("row g-2") {
                                            await DivC("col-5") {
                                                await Plot.Form.Selection(name: "user-dob-month", options: [
                                                    .init(value: "01", label: { Text("January") }),
                                                    .init(value: "02", label: { Text("February") }),
                                                    .init(value: "03", label: { Text("March") }),
                                                    .init(value: "04", label: { Text("April") }),
                                                    .init(value: "05", label: { Text("May") }),
                                                    .init(value: "06", label: { Text("June") }),
                                                    .init(value: "07", label: { Text("July") }),
                                                    .init(value: "08", label: { Text("August") }),
                                                    .init(value: "09", label: { Text("September") }),
                                                    .init(value: "10", label: { Text("October") }),
                                                    .init(value: "11", label: { Text("November") }),
                                                    .init(value: "12", label: { Text("December") })
                                                ])
                                                .class("form-select")
                                            }
                                            await DivC("col-3") {
                                                await Plot.Form.Selection(name: "user-dob-day", options: (1...31).asyncMap { i in
                                                    await .init(value: "\(i)", label: { Text("\(i)") })
                                                })
                                                .class("form-select")
                                            }
                                            await DivC("col-4") {
                                                await Plot.Form.Selection(name: "user-dob-year", options: (1897...2023).asyncMap { i in
                                                    await .init(value: "\(i)", label: { Text("\(i)") })
                                                })
                                                .class("form-select")
                                            }
                                        }
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Text Mask")
                                        Plot.Form.Textfield(name: "input-mask-1", placeholder: "00/00/0000", dataMask: .init(mask: "00/00/0000"))
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Telephone Mask")
                                        Plot.Form.Textfield(name: "input-mask-2", placeholder: "(000) 000-0000", dataMask: .init(mask: "(000) 000-0000"))
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Autosize Textarea")
                                        Plot.Form.Textarea(name: "autosize-textarea", placeholder: "type something...", autosize: true)
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Datalist example")
                                        await Plot.Form.DataList(placeholder: "Type to search...", options: [
                                            .init(value: "Andorra",         label: { Text("Andorra") }),
                                            .init(value: "Afghanistan",     label: { Text("Afghanistan") }),
                                            .init(value: "Antigua",         label: { Text("Antigua") }),
                                            .init(value: "Anguilla",        label: { Text("Anguilla") }),
                                            .init(value: "Armenia",         label: { Text("Armenia") }),
                                            .init(value: "Angolan",         label: { Text("Angolan") }),
                                            .init(value: "Antarctica",      label: { Text("Antarctica") }),
                                            .init(value: "Argentina",       label: { Text("Argentina") }),
                                            .init(value: "American Samoa",  label: { Text("American Samoa") }),
                                        ])
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Range input")
                                        Plot.Form.Range(range: 0...100, value: 40, step: 10, color: .red)
                                        Plot.Form.NoUISlider(name: "slider1", range: 0...100, style: .regular(defaultStart: 20))
                                        Plot.Form.NoUISlider(name: "slider2", range: 0...100, style: .range(defaultStart: 20, defaultEnd: 60, limit: nil, margin: 10))
                                        Plot.Form.NoUISlider(name: "slider3", range: 0...100, style: .regular(defaultStart: 20), color: .green)
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Datepicker")
                                        Plot.Form.DatePicker(style: .regular, name: "datepicker-1", date: Date())
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Inline Datepicker")
                                        Plot.Form.DatePicker(style: .inline, name: "datepicker-2", date: Date())
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Progress")
                                        ProgressBar(progress: .init(progress: 38))
                                            .class("mb-2")
                                        ProgressBar(inditerminate: .green)
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Form Buttons")
                                        await Row {
                                            await Column {
                                                Link(url: "#") {
                                                    IconLabel(icon: .brand_github, text: "Login with Github", badge: nil)
                                                }.class("btn")
                                            }
                                            await Column {
                                                Link(url: "#") {
                                                    IconLabel(icon: SVGIcon(icon: .brand_twitter, color: .azure), text: "Login with Twitter", badge: nil)
                                                }.class("btn")
                                            }
                                        }
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Tags Input")
                                        await Plot.Form.TomSelection(name: "select-tags", multiselect: true, options: [
                                            .init(value: "HTML", label: { Text("HTML") }),
                                            .init(value: "JavaScript", label: { Text("JavaScript") }),
                                            .init(value: "CSS", label: { Text("CSS") }),
                                            .init(value: "jQuery", label: { Text("jQuery") }),
                                            .init(value: "Bootstrap", label: { Text("Bootstrap") }),
                                            .init(value: "Ruby", label: { Text("Ruby") }),
                                            .init(value: "Python", label: { Text("Python") }),
                                            .init(value: "Swift", label: { Text("Swift") }),
                                        ])
                                        .attribute(named: "placeholder", value: "Select tags")
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Advance Select")
                                        await Plot.Form.TomSelection(name: "select-users", options: [
                                            .init(value: "Chuck Tesla", label: { Text("Chuck Tesla") }),
                                            .init(value: "Elon Musk", label: { Text("Elon Musk") }),
                                            .init(value: "Pawel Kuna", label: { Text("Pawel Kuna") }),
                                            .init(value: "Nikola Tesla", label: { Text("Nikola Tesla") }),
                                        ])
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Advance Select w/ OptionGroups")
                                        await Plot.Form.TomSelection(name: "tom-select-optgroups", optionGroups: [
                                            .init(groupLabel: "Tags", options: [
                                                .init(value: "HTML", label: { Text("HTML") }),
                                                .init(value: "JavaScript", label: { Text("JavaScript") }),
                                                .init(value: "CSS", label: { Text("CSS") }),
                                                .init(value: "jQuery", label: { Text("jQuery") }),
                                                .init(value: "Bootstrap", label: { Text("Bootstrap") }),
                                                .init(value: "Ruby", label: { Text("Ruby") }),
                                                .init(value: "Python", label: { Text("Python") }),
                                                .init(value: "Swift", label: { Text("Swift") }),
                                            ]),
                                            .init(groupLabel: "People", options: [
                                                .init(value: "Chuck Tesla", label: { Text("Chuck Tesla") }),
                                                .init(value: "Elon Musk", label: { Text("Elon Musk") }),
                                                .init(value: "Pawel Kuna", label: { Text("Pawel Kuna") }),
                                                .init(value: "Nikola Tesla", label: { Text("Nikola Tesla") }),
                                            ])
                                        ])
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Avatar Select")
                                        await Plot.Form.TomSelection(name: "avatar-select", options: MockData.Users.enumerated().asyncMap { idx, user in
                                            await .init(value: "\(idx)", customData: Avatar(size: .xs, user.avatar), label: { Text(user.name) })
                                        })
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Select w/ flags")
                                        await Plot.Form.TomSelection(name: "region-select", options: Flags.allCases.asyncMap { flag in
                                            await .init(value: flag.title, customData: FlagIcon(size: .xs, flag: flag), label: { Text(flag.title) })
                                        })
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("Select with Labels")
                                        await Plot.Form.TomSelection(name: "label-select", options: [
                                            .init(value: "copy",  customData: Badge(fill: .light, { Text("cmd + c") }), label: { Text("Copy")  }),
                                            .init(value: "paste", customData: Badge(fill: .light, { Text("cmd + v") }), label: { Text("Paste") }),
                                            .init(value: "cut",   customData: Badge(fill: .light, { Text("cmd + x") }), label: { Text("Cut")   }),
                                        ])
                                    }
                                    
                                    await DivC("mb-3") {
                                        Plot.Form.Label("TODO: Advance Select w/ validation states")
                                    }
                                    
                                })
                            )
                        }
                    }),
                    footer: .init({
                        await DivC("d-flex") {
                            ButtonLink("Cancel", link: "#", theme: .raw)
                            ButtonLink("Submit", link: "#", pullRight: true)
                        }
                    })
                )
                
                await Card(body: .init({
                    Card.Title("Switch Icons")
                    await Row(alignItemsCenter: true) {
                        await Column {
                            Plot.Form.Switch(off: .init(icon: .circle, color: .secondary), on: .init(icon: .circle_filled, color: .blue))
                        }.class("d-flex justify-content-center")
                        await Column {
                            Plot.Form.Switch(off: .init(icon: .heart, color: .secondary), on: .init(icon: .heart_filled, color: .red), animation: .fade)
                        }.class("d-flex justify-content-center")
                        await Column {
                            Plot.Form.Switch(off: .init(icon: .star, color: .secondary), on: .init(icon: .star_filled, color: .yellow), animation: .scale)
                        }.class("d-flex justify-content-center")
                        await Column {
                            Plot.Form.Switch(off: .init(icon: .thumb_up, color: .secondary), on: .init(icon: .thumb_up_filled, color: .primary), animation: .flip)
                        }.class("d-flex justify-content-center")
                        await Column {
                            Plot.Form.Switch(off: .init(icon: .brand_twitter, color: .secondary), on: .init(icon: .brand_twitter, color: .azure), animation: .slide(.up))
                        }.class("d-flex justify-content-center")
                        await Column {
                            Plot.Form.Switch(off: .init(icon: .check, color: .green), on: .init(icon: .x, color: .red), animation: .slide(.left), checked: true)
                        }.class("d-flex justify-content-center")
                        await Column {
                            Plot.Form.Switch(off: .init(icon: .arrow_down, color: .secondary), on: .init(icon: .arrow_up, color: .secondary), animation: .slide(.down))
                        }.class("d-flex justify-content-center")
                        await Column {
                            Plot.Form.Switch(off: .init(icon: .car, color: .secondary), on: .init(icon: .caravan, color: .secondary), animation: .slide(.right))
                        }.class("d-flex justify-content-center")
                        await Column {
                            Plot.Form.Switch(off: .init(icon: .heart, color: .secondary), on: .init(icon: .heart, color: .red, animation: .pulse), animation: .fade, checked: true)
                        }.class("d-flex justify-content-center")
                    }
                }))
                
                await CardHStack {
                    await Card(
                        body: .init({
                            Card.Title("Project ID", subTitle: "Used when interacting with the API")
                            await Plot.Form.InputWithIcon(trailing: .icon(.files)) {
                                Plot.Form.Textfield(name: "api-key", value: "prj_5ae74426fe935327a8fa178b07d84ad9", readonly: true)
                            }
                        }),
                        footer: .init({
                            await Row(alignItemsCenter: true) {
                                await DivC("col") {
                                    Text("Learn more about the")
                                    Link(url: "#", label: { Text("Project ID") })
                                }
                                await DivC("col-auto") {
                                    ButtonLink("Save", link: "#", theme: .primary)
                                }
                            }
                            
                        })
                    )
                    
                    await Card(
                        body: .init({
                            Card.Title("Node.js Version", subTitle: "The version of Node.js that is used in the Build Step and for Serverless Functions. A new Deployment is required for your changes to take effect.")
                            await Plot.Form.Selection(name: "nodejs-select", options: [
                                .init(value: "1", label: { Text("14.x") }),
                                .init(value: "2", label: { Text("12.x") }),
                            ])
                        }),
                        footer: .init({
                            await Row(alignItemsCenter: true) {
                                await DivC("col") {
                                    Text("Learn more about the")
                                    Link(url: "#", label: { Text("Node.js Version") })
                                }
                            }
                        })
                    )
                }
                
                await CardHStack {
                    
                    await Card(
                        type: .form(url: "#", method: .get, contentType: nil, enableValidation: false),
                        header: .init({
                            Card.Title("Basic Form")
                        }),
                        body: .init({
                            await DivC("mb-3") {
                                Plot.Form.Label("Email Address")
                                Plot.Form.Textfield(name: "email", placeholder: "Enter email", isRequired: true)
                                Plot.Form.Hint("We'll never share your email with anyone else.")
                            }
                            
                            await DivC("mb-3") {
                                Plot.Form.Label("Password")
                                Plot.Form.Textfield(name: "password", placeholder: "Password", isRequired: true)
                                Plot.Form.Hint("Your password must be 8-20 characters long, contain letters and numbers, and must not contain spaces, special characters, or emoji.")
                            }
                            
                            await DivC("mb-3") {
                                Plot.Form.Label("Select")
                                await Plot.Form.Selection(name: "form-select", options: [
                                    .init(value: "1", label: { Text("Option 1") }),
                                    .init(value: "2", label: { Text("Option 2") }),
                                    .init(value: "3", label: { Text("Option 3") }),
                                    .init(value: "4", label: { Text("Option 4") }),
                                    .init(value: "5", label: { Text("Option 5") }),
                                ])
                                Plot.Form.Hint("Your password must be 8-20 characters long, contain letters and numbers, and must not contain spaces, special characters, or emoji.")
                            }
                            
                            await DivC("mb-3") {
                                Plot.Form.Label("Checkboxes")
                                for i in 1...3 {
                                    Plot.Form.Checkbox(style: .check, label: "Option \(i)", checked: i == 3, required: false, disabled: i == 2)
                                }
                            }
                        }),
                        footer: .init({
                            SubmitButton("Submit").class("btn btn-primary")
                        }, class: "text-end")
                    )
                    
                    await Card(
                        type: .form(url: "#", method: .get, contentType: nil, enableValidation: false),
                        header: .init({
                            Card.Title("Horizontal Form")
                        }),
                        body: .init({
                            await DivC("mb-3 row") {
                                Plot.Form.Label("Email Address").class("col-3 col-form-label required")
                                await Column {
                                    Plot.Form.Textfield(name: "email", placeholder: "Enter email", isRequired: true)
                                    Plot.Form.Hint("We'll never share your email with anyone else.")
                                }
                            }
                            
                            await DivC("mb-3 row") {
                                Plot.Form.Label("Password").class("col-3 col-form-label required")
                                await Column {
                                    Plot.Form.Textfield(name: "password", placeholder: "Password", isRequired: true)
                                    Plot.Form.Hint("Your password must be 8-20 characters long, contain letters and numbers, and must not contain spaces, special characters, or emoji.")
                                }
                            }
                            
                            await DivC("mb-3 row") {
                                Plot.Form.Label("Select").class("col-3 col-form-label required")
                                await Column {
                                    await Plot.Form.Selection(name: "form-select", options: [
                                        .init(value: "1", label: { Text("Option 1") }),
                                        .init(value: "2", label: { Text("Option 2") }),
                                        .init(value: "3", label: { Text("Option 3") }),
                                        .init(value: "4", label: { Text("Option 4") }),
                                        .init(value: "5", label: { Text("Option 5") }),
                                    ])
                                    Plot.Form.Hint("Your password must be 8-20 characters long, contain letters and numbers, and must not contain spaces, special characters, or emoji.")
                                }
                            }
                            
                            await DivC("mb-3 row") {
                                Plot.Form.Label("Checkboxes").class("col-3 col-form-label required")
                                await Column {
                                    for i in 1...3 {
                                        Plot.Form.Checkbox(style: .check, label: "Option \(i)", checked: i == 3, required: false, disabled: i == 2)
                                    }
                                }
                            }
                        }),
                        footer: .init({
                            SubmitButton("Submit").class("btn btn-primary")
                        }, class: "text-end")
                    )
                    
                }
                
                await CardHStack {
                    await Column(size: .full(.num(4))) {
                        await Card(
                            header: .init({
                                Card.Title("Input Mask")
                            }),
                            body: .init({
                                await DivC("mb-3") {
                                    Plot.Form.Label("Date")
                                    Plot.Form.Textfield(name: "datamask-date", placeholder: nil, dataMask: .init(mask: "00/00/0000", isVisible: true))
                                }
                                
                                await DivC("mb-3") {
                                    Plot.Form.Label("Hour")
                                    Plot.Form.Textfield(name: "datamask-hour", placeholder: nil, dataMask: .init(mask: "00:00:00", isVisible: true))
                                }
                                
                                await DivC("mb-3") {
                                    Plot.Form.Label("Date & Hour")
                                    Plot.Form.Textfield(name: "datamask-datehour", placeholder: nil, dataMask: .init(mask: "00/00/0000 00:00:00", isVisible: true))
                                }
                                
                                await DivC("mb-3") {
                                    Plot.Form.Label("ZIP Code")
                                    Plot.Form.Textfield(name: "datamask-zip", placeholder: nil, dataMask: .init(mask: "00000-000", isVisible: true))
                                }
                                
                                await DivC("mb-3") {
                                    Plot.Form.Label("Money")
                                    Plot.Form.Textfield(name: "datamask-money", placeholder: nil, dataMask: .init(mask: "000,000,000,000.00", isVisible: true))
                                }
                                
                                await DivC("mb-3") {
                                    Plot.Form.Label("Telephone")
                                    Plot.Form.Textfield(name: "datamask-phone", placeholder: nil, dataMask: .init(mask: "+0 (000) 000-0000", isVisible: true))
                                }
                                
                                await DivC("mb-3") {
                                    Plot.Form.Label("IP Address")
                                    Plot.Form.Textfield(name: "datamask-phone", placeholder: nil, dataMask: .init(mask: "000.000.000.000", isVisible: true))
                                }
                            })
                        ).margin(.body(3))
                        
                        await Card(
                            header: .init({
                                Card.Title("My Profile")
                            }),
                            body: .init({
                                let user = MockData.Users.randomElement()!
                                await DivC("mb-3") {
                                    await Row {
                                        
                                        await DivC("col-auto") {
                                            Avatar(size: .xl, user.avatar, shape: .regular, badge: nil)
                                        }
                                        await Column {
                                            Plot.Form.Label("Nickname")
                                            Plot.Form.Textfield(name: "profile-name", placeholder: user.name)
                                        }
                                    }
                                    
                                }
                                
                                await DivC("mb-3") {
                                    Plot.Form.Label("BIO")
                                    Plot.Form.Textarea(name: "profile-bio", value: user.jobTitle, rows: 5)
                                }
                                
                                await DivC("mb-3") {
                                    Plot.Form.Label("Email Address")
                                    Plot.Form.Textfield(name: "profile-email", placeholder: "your@email.com")
                                }
                                
                                await DivC("mb-3") {
                                    Plot.Form.Label("Password")
                                    Plot.Form.Textfield(type: .password, name: "profile-password", placeholder: nil)
                                }
                            }),
                            footer: .init({
                                SubmitButton("Submit").class("btn btn-primary")
                            }, class: "text-end")
                        )
                    }
                    
                    await Column(size: .full(.num(8))) {
                        
                        await Card(
                            type: .form(url: "#", method: .post, contentType: nil, enableValidation: false),
                            body: .init({
                                Card.Title("Edit Profile")
                                await Row {
                                    await Column {
                                        await DivC("mb-3") {
                                            Plot.Form.Label("Company")
                                            Plot.Form.Textfield(name: "edit-profile-company", value: "Creative Code Inc.", placeholder: "Company", disabled: true)
                                        }
                                    }
                                    await Column {
                                        await DivC("mb-3") {
                                            Plot.Form.Label("Username")
                                            Plot.Form.Textfield(name: "edit-profile-username", value: "micheal23", placeholder: "username")
                                        }
                                    }
                                    await Column {
                                        await DivC("mb-3") {
                                            Plot.Form.Label("Email Address")
                                            Plot.Form.Textfield(name: "edit-profile-email", placeholder: "email")
                                        }
                                    }
                                }.class("row-cards")
                                
                                await Row {
                                    await Column {
                                        await DivC("mb-3") {
                                            Plot.Form.Label("First Name")
                                            Plot.Form.Textfield(name: "edit-profile-firstname", value: "Chet", placeholder: "first name")
                                        }
                                    }
                                    await Column {
                                        await DivC("mb-3") {
                                            Plot.Form.Label("Last Name")
                                            Plot.Form.Textfield(name: "edit-profile-lastname", value: "Faker", placeholder: "last name")
                                        }
                                    }
                                }
                                
                                await Row {
                                    await Column {
                                        await DivC("mb-3") {
                                            Plot.Form.Label("Address")
                                            Plot.Form.Textfield(name: "edit-profile-address", value: "Melbourne, Australia", placeholder: "address")
                                        }
                                    }
                                }
                                
                                await Row {
                                    await Column {
                                        await DivC("mb-3") {
                                            Plot.Form.Label("City")
                                            Plot.Form.Textfield(name: "edit-profile-city", value: "Melbourne", placeholder: "city", disabled: true)
                                        }
                                    }
                                    await Column {
                                        await DivC("mb-3") {
                                            Plot.Form.Label("Postal Code")
                                            Plot.Form.Textfield(name: "edit-profile-postalcode", value: "micheal23", placeholder: "username")
                                        }
                                    }
                                    await Column {
                                        await DivC("mb-3") {
                                            Plot.Form.Label("Country")
                                            await Plot.Form.Selection(name: "edit-profile-country", options: [
                                                .init(value: "1", label: { Text("Germany") }),
                                            ])
                                        }
                                    }
                                }.class("row-cards")
                                
                                await Row {
                                    await Column {
                                        Plot.Form.Textarea(name: "edit-profile-about-me", value: "This is a bit about me...", placeholder: "tell us about yourself", rows: 5)
                                    }
                                }
                            }),
                            footer: .init({
                                SubmitButton("Update Profile").class("btn btn-primary")
                            }, class: "text-end")
                        )
                        .margin(.body(3))
                        
                        await Card(
                            type: .form(url: "#", method: .post, contentType: nil, enableValidation: false),
                            header: .init({
                                Card.Title("HTTP Request")
                            }),
                            body: .init({
                                await Row {
                                    await Column(size: .full(.num(4))) {
                                        await DivC("mb-3") {
                                            Plot.Form.Label("Method").class("required")
                                            await Plot.Form.Selection(name: "request-method", options: [
                                                .init(value: "GET", label: { Text("GET") }),
                                                .init(value: "POST", label: { Text("POST") }),
                                                .init(value: "PUT", label: { Text("PUT") }),
                                                .init(value: "HEAD", label: { Text("HEAD") }),
                                                .init(value: "DELETE", label: { Text("DELETE") }),
                                                .init(value: "PATCH", label: { Text("PATCH") }),
                                            ])
                                        }
                                    }
                                    
                                    await Column {
                                        await DivC("mb-3") {
                                            Plot.Form.Label("URL").class("required")
                                            Plot.Form.Textfield(name: "request-url", value: "https://content.googleapis.com/discovery/v1/apis/surveys/v2/rest", placeholder: "url")
                                        }
                                    }
                                }.class("row-cards")
                                
                                
                                Plot.Form.Label("Assertions")
                                
                                await Tables(style: .regular, editable: false, items: MockData.HTTPRequestAssertions.mockData)
                                
                            }),
                            footer: .init({
                                SubmitButton("Make Request").class("btn btn-primary")
                            }, class: "text-end")
                        )
                        
                    }
                    
                }
            }
        }))
    }
}
