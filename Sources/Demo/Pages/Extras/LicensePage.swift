import AsyncPlotTabler

/// License Demo View
struct LicensePage: Component {
    
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(
            header: .init(header: "Tabler License"),
            content: {
                await CardVStack {
                    await CardHStack {
                        await Card(
                            size: .large(.num(8)),
                            cardSize: .lg,
                            body: .init({
                                await DivC("markdown") {
                                    Paragraph {
                                        Text("This is a legal agreement between you, the Purchaser, and Tabler. Purchasing or downloading of any Tabler product (Tabler Free, Tabler PRO, Tabler Email), constitutes your acceptance of the terms of this license, ")
                                        Span { Link(url: "https://tabler.io/terms-of-service.html") { Text("Tabler terms of service") } }
                                        Text(" and ")
                                        Span { Link(url: "https://tabler.io/privacy-policy.html") { Text("Tabler private policy") } }
                                    }
                                    
                                    Paragraph {
                                        Text("A license grants you a non-exclusive and non-transferable right to use and incorporate the item in your personal or commercial projects.")
                                    }
                                    
                                    H3 { Text("Tabler Free License") }.id("tabler-free-license")
//
                                    Paragraph {
                                        Text("Tabler Free is available under MIT License")
                                    }
                                    Paragraph {
                                        Text("Copyright 2023 Tabler")
                                    }
                                    Paragraph {
                                        Text("Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:")
                                    }
                                    Paragraph {
                                        Text("The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.")
                                    }
                                    Paragraph {
                                        Text("THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.")
                                    }
                                    
                                    H3 { Text("Tabler PRO and Tabler Email License") }.id("tabler-pro-and-tabler-email-license")
                                    Paragraph {
                                        Text("After Purchasing you are granted the use products under the conditions featured belowed.")
                                    }
                                    Paragraph {
                                        Text("Rights")
                                    }
                                    await Plot.List([
                                        .init("You have rights to use our resources for any or all of your personal and commercial projects."),
                                        .init("You may modify the resources according to your requirements."),
                                        .init("You are not required to attribute or link to Tabler in any of your projects.")
                                    ]).listStyle(.ordered)
                                    Paragraph {
                                        Text("Restrictions")
                                    }
                                    await Plot.List([
                                        .init("You do not have the rights to redistribute, resell, lease, license, sub-license or offer the file downloaded to any third party."),
                                        .init("For any resalable web applications or software programs, you cannot include our graphic resources as an additional attachment."),
                                        .init("You cannot redistribute any of the software, or products created with Tabler paid  products."),
                                        .init("You cannot add our source code to any open source repository."),
                                        .init("The source code may not be placed on any website in a complete or archived downloadable format.")
                                    ]).listStyle(.ordered)
                                }
                            })
                        )
                        
                        await Card(
                            body: .init({
                                await  DivC("d-flex align-items-center mb-3") {
                                    await DivC("me-3") {
                                        SVGIcon(icon: .scale, size: .md)
                                    }
                                    Div {
                                        await Element(name: "small") {
                                            Text("tabler/tabler is licensed under the")
                                        }.textColor(.secondary)
                                        H3 { Text("MIT License") }.class("lh-1")
                                    }
                                }
                                Div { Text("A short and simple permissive license with conditions only requiring preservation of copyright and license notices. Licensed works, modifications, and larger works may be distributed under different terms and without source code.") }
                                    .textColor(.secondary)
                                    .margin(.body(3))
                                H4 { Text("Permissions") }
                                await Plot.List([
                                    (true, "Commercial use"),
                                    (true, "Modification"),
                                    (true, "Distribution"),
                                    (true, "Private use")
                                ], content: { item in
                                    IconLabel(icon: SVGIcon(icon: item.0 ? .check : .x, color: item.0 ? .green : .red), text: item.1)
                                })
                                .listStyle(.unordered)
                                .class("list-unstyled space-y-1")
                                
                                H4 { Text("Limitations") }
                                await Plot.List([
                                    (false, "Liability"),
                                    (false, "Warranty")
                                    
                                ], content: { item in
                                    IconLabel(icon: SVGIcon(icon: item.0 ? .check : .x, color: item.0 ? .green : .red), text: item.1)
                                })
                                .listStyle(.unordered)
                                .class("list-unstyled space-y-1")
                                
                                H4 { Text("Conditions") }
                                await Plot.List([
                                    "License and copyright notice",
                                    
                                ], content: { item in
                                    IconLabel(icon: SVGIcon(icon: .info_circle, color: .blue), text: item)
                                })
                                .listStyle(.unordered)
                                .class("list-unstyled space-y-1")
                            }),
                            footer: .init({
                                Text("This is not legal advice.")
                                Link(url: "#", label: { Text("Learn more about repository licenses.") })
                            })
                        )
                    }
                }
            })
        )
    }
}
