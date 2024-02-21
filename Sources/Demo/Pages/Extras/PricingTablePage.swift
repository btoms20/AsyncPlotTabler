import AsyncPlotTabler

/// Pricing Table Demo View
struct PricingTablePage: Component {
    
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(header: .init(header: "Pricing table"), content: {
            await CardVStack {
                await DivC("card") {
                    await DivC("table-responsive") {
                        Table(
                            header: .init(content: {
                                TableHeaderCell {
                                    await H2("Pricing plans for teams of all sizes")
                                    Div { Text("Choose an affordable plan that comes with the best features to engage your audience, create customer loyalty and increase sales.") }
                                        .textColor(.secondary)
                                        .class("text-wrap")
                                }
                                .class("w-50")
                                TableHeaderCell {
                                    await DivC("text-uppercase text-secondary font-weight-medium") {
                                        Text("Starter")
                                    }
                                    await DivC("display-6 fw-bold my-3") {
                                        Text("$0")
                                    }
                                    ButtonLink("Choose Plan", link: "#", style: .outline, theme: .color(.muted))
                                        .class("w-100")
                                }
                                .class("text-center")
                                TableHeaderCell {
                                    await DivC("text-uppercase text-secondary font-weight-medium") {
                                        Text("Professional")
                                    }
                                    await DivC("display-6 fw-bold my-3") {
                                        Text("$9")
                                    }
                                    ButtonLink("Choose Plan", link: "#", theme: .success)
                                        .class("w-100")
                                }
                                .class("text-center")
                                TableHeaderCell {
                                    await DivC("text-uppercase text-secondary font-weight-medium") {
                                        Text("Business")
                                    }
                                    await DivC("display-6 fw-bold my-3") {
                                        Text("$16")
                                    }
                                    ButtonLink("Choose Plan", link: "#", style: .outline, theme: .color(.muted))
                                        .class("w-100")
                                }
                                .class("text-center")
                            }), footer: .init(content: {
                                TableCell {
                                    EmptyComponent()
                                }
                                //.class("w-50")
                                TableCell {
                                    ButtonLink("Choose Plan", link: "#", style: .outline, theme: .color(.muted))
                                        .class("w-100")
                                }
                                .class("text-center")
                                TableCell {
                                    ButtonLink("Choose Plan", link: "#", theme: .success)
                                        .class("w-100")
                                }
                                .class("text-center")
                                TableCell {
                                    ButtonLink("Choose Plan", link: "#", style: .outline, theme: .color(.muted))
                                        .class("w-100")
                                }
                                .class("text-center")
                            })) {
                                // Features Section
                                TableRow {
                                    TableCell {
                                        Text("Features")
                                    }
                                    .attribute(named: "colspan", value: "4")
                                    .class("subheader")
                                }
                                .class("bg-light")
                                // Features...
                                TableRow {
                                    TableCell {
                                        Text("Some info about features")
                                    }
                                    
                                    TableCell { SVGIcon(icon: .check, color: .green) }
                                    .class("text-center")
                                    
                                    TableCell { SVGIcon(icon: .check, color: .green) }
                                    .class("text-center")
                                    
                                    TableCell { SVGIcon(icon: .check, color: .green) }
                                    .class("text-center")
                                }
                                
                                TableRow {
                                    TableCell {
                                        Text("Online Payment Gateway")
                                    }
                                    
                                    TableCell { SVGIcon(icon: .x, color: .red) }
                                    .class("text-center")
                                    
                                    TableCell { SVGIcon(icon: .check, color: .green) }
                                    .class("text-center")
                                    
                                    TableCell { SVGIcon(icon: .check, color: .green) }
                                    .class("text-center")
                                }
                                
                                TableRow {
                                    TableCell {
                                        Text("Unlimited products can be sold")
                                    }
                                    
                                    TableCell { SVGIcon(icon: .x, color: .red) }
                                    .class("text-center")
                                    
                                    TableCell { SVGIcon(icon: .x, color: .red) }
                                    .class("text-center")
                                    
                                    TableCell { SVGIcon(icon: .check, color: .green) }
                                    .class("text-center")
                                }
                                
                                // Reporting Section
                                TableRow {
                                    TableCell {
                                        Text("Reporting")
                                    }
                                    .attribute(named: "colspan", value: "4")
                                    .class("subheader")
                                }
                                .class("bg-light")
                                
                                // Reporting...
                                TableRow {
                                    TableCell {
                                        Text("Free hosting and domain name")
                                    }
                                    
                                    TableCell { SVGIcon(icon: .check, color: .green) }
                                    .class("text-center")
                                    
                                    TableCell { SVGIcon(icon: .check, color: .green) }
                                    .class("text-center")
                                    
                                    TableCell { SVGIcon(icon: .check, color: .green) }
                                    .class("text-center")
                                }
                                
                                TableRow {
                                    TableCell {
                                        Text("Admin dashboard to control items")
                                    }
                                    
                                    TableCell { SVGIcon(icon: .check, color: .green) }
                                    .class("text-center")
                                    
                                    TableCell { SVGIcon(icon: .check, color: .green) }
                                    .class("text-center")
                                    
                                    TableCell { SVGIcon(icon: .check, color: .green) }
                                    .class("text-center")
                                }
                                
                                // Support Section
                                TableRow {
                                    TableCell {
                                        Text("Support")
                                    }
                                    .attribute(named: "colspan", value: "4")
                                    .class("subheader")
                                }
                                .class("bg-light")
                                
                                // Support...
                                TableRow {
                                    TableCell {
                                        Text("Email marketing and service")
                                    }
                                    
                                    TableCell { SVGIcon(icon: .x, color: .red) }
                                    .class("text-center")
                                    
                                    TableCell { SVGIcon(icon: .x, color: .red) }
                                    .class("text-center")
                                    
                                    TableCell { SVGIcon(icon: .check, color: .green) }
                                    .class("text-center")
                                }
                                
                                TableRow {
                                    TableCell {
                                        Text("24/7 customer support online")
                                    }
                                    
                                    TableCell { SVGIcon(icon: .x, color: .red) }
                                    .class("text-center")
                                    
                                    TableCell { SVGIcon(icon: .check, color: .green) }
                                    .class("text-center")
                                    
                                    TableCell { SVGIcon(icon: .check, color: .green) }
                                    .class("text-center")
                                }
                            }
                            .class("table table-vcenter table-bordered table-nowrap card-table")
                    }
                }
            }
        }))
    }

}
