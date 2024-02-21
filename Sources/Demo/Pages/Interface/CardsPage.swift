import AsyncPlotTabler

/// Card Page from Demo Website
struct CardsPage: Component {
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(header: .init(header: "Icons"), content: {
            await CardVStack {
                // Basic Cards
                await CardHStack {
                    await Card(
                        header: .init({ Card.Title("Card title") }),
                        body: .init({ Text("Simple card") })
                    )
                    await Card(
                        header: .init(style: .light, { Card.Title("Card title")  }),
                        body: .init({ Text("Card with header background") })
                    )
                    await Card(border: .none,
                        header: .init({ Card.Title("Card title") }),
                        body: .init({ Text("Card without border") })
                    )
                    await Card(
                        header: .init({
                            Card.Title("Card title", subTitle: "Subtitle")
                        }),
                        body: .init({ Text("Card with title and subtitle") })
                    )
                }
                
                // Hovers
                await CardHStack {
                    await Card(hover: .hover,
                        body: .init({ Text("Default hover effect") })
                    )
                    await Card(hover: .rotate,
                        body: .init({ Text("Rotate hover effect") })
                    )
                    await Card(hover: .pop,
                        body: .init({ Text("Pop hover effect") })
                    )
                }
                
                // States
                await CardHStack {
                    await Card(state: .rotateRight,
                        body: .init({ Text("Card rotated right") })
                    )
                    await Card(state: .rotateLeft,
                        body: .init({ Text("Card rotated left") })
                    )
                    await Card(state: .active,
                        body: .init({ Text("A card in an active state") })
                    )
                    await Card(state: .inactive,
                        body: .init({ Text("A card in a disabled state") })
                    )
                }
                
                // Stamps and Backgrounds
                await CardHStack {
                    await Card(stamp: .init(icon: .bell, color: .yellow),
                        body: .init({
                            Card.Title("Card with icon bg")
                            await Paragraph(loremIpsum())
                                .class("text-secondary")
                        })
                    )
                    await Card(background: .light,
                        body: .init({
                            Card.Title("Card with a primary light background")
                            await Paragraph(loremIpsum())
                                .class("text-secondary")
                        })
                    )
                    await Card(background: .dark,
                        body: .init({
                            Card.Title("Card with background")
                            await Paragraph(loremIpsum())
                        })
                    )
                    await Card(background: .dark, stamp: .init(icon: .star, color: .white),
                        body: .init({
                            Card.Title("Card with background and icon")
                            await Paragraph(loremIpsum())
                        })
                    )
                }
                
                // Status and Stacked
                await CardHStack {
                    await Card(status: .init(position: .top, color: .red),
                        body: .init({
                            Card.Title("Card with top status")
                            await Paragraph(loremIpsum())
                                .class("text-secondary")
                        })
                    )
                    await Card(status: .init(position: .bottom, color: .green),
                        body: .init({
                            Card.Title("Card with bottom status")
                            await Paragraph(loremIpsum())
                                .class("text-secondary")
                        })
                    )
                    await Card(status: .init(position: .leading, color: .blue),
                        body: .init({
                            Card.Title("Card with side status")
                            await Paragraph(loremIpsum())
                        })
                    )
                    await Card(border: .stacked,
                        body: .init({
                            Card.Title("Stacked Card")
                            await Paragraph(loremIpsum())
                                .class("text-secondary")
                        })
                    )
                }
                
                // Ribbon and Progress
                await CardHStack {
                    await Card(ribbon: .init(style: .icon(.star), color: .yellow, position: .top),
                        body: .init({
                            Card.Title("Card with top icon ribbon")
                            await Paragraph(loremIpsum())
                                .class("text-secondary")
                        })
                    )
                    await Card(ribbon: .init(style: .text("new"), color: .red, position: .trailing),
                        body: .init({
                            Card.Title("Card with text side ribbon")
                            await Paragraph(loremIpsum())
                                .class("text-secondary")
                        })
                    )
                    await Card(ribbon: .init(style: .custom(IconLabel(icon: .ghost, text: "Boo!")), color: .purple, position: .trailing),
                        body: .init({
                            Card.Title("Card with icon + text side ribbon")
                            await Paragraph(loremIpsum())
                                .class("text-secondary")
                        })
                    )
                    await Card(progress: .init(style: .progress(.init(progress: 38)), color: .azure),
                        body: .init({
                            Card.Title("Card with progress bar")
                            await Paragraph(loremIpsum())
                                .class("text-secondary")
                        })
                    )
                }
                
                // Images
                await CardHStack {
                    await Card(
                        size: .large(.num(6)),
                        image: .init(
                            src: "./static/photos/home-office-desk-with-macbook-iphone-calendar-watch-and-organizer.jpg",
                            size: .init(width: 100, height: 100),
                            position: .trailing
                        ),
                        body: .init({
                            Card.Title("Card with right side image")
                            await Paragraph(loremIpsum())
                                .class("text-secondary")
                        })
                    )
                    await Card(
                        size: .large(.num(6)),
                        image: .init(
                            src: "./static/photos/home-office-desk-with-macbook-iphone-calendar-watch-and-organizer.jpg",
                            size: .init(width: 100, height: 100),
                            position: .leading
                        ),
                        body: .init({
                            Card.Title("Card with left side image")
                            await Paragraph(loremIpsum())
                                .class("text-secondary")
                        })
                    )
                    await Card(
                        size: .large(.num(3)),
                        image: .init(
                            src: "./static/photos/home-office-desk-with-macbook-iphone-calendar-watch-and-organizer.jpg",
                            size: .init(width: 100, height: 100),
                            position: .top
                        ),
                        body: .init({
                            Card.Title("Card with top image")
                            await Paragraph(loremIpsum())
                                .class("text-secondary")
                        })
                    )
                    await Card(
                        size: .large(.num(3)),
                        image: .init(
                            src: "./static/photos/home-office-desk-with-macbook-iphone-calendar-watch-and-organizer.jpg",
                            size: .init(width: 100, height: 100),
                            position: .bottom
                        ),
                        body: .init({
                            Card.Title("Card with bottom image")
                            await Paragraph(loremIpsum())
                                .class("text-secondary")
                        })
                    )
                    await Card(
                        size: .large(.num(3)),
                        image: .init(
                            src: "./static/photos/home-office-desk-with-macbook-iphone-calendar-watch-and-organizer.jpg",
                            size: .init(width: 100, height: 100),
                            position: .top
                        ),
                        body: .init({
                            await Paragraph(loremIpsum())
                                .class("text-secondary")
                        }),
                        footer: .init({
                            await Paragraph("Card with top image and footer")
                                .class("text-secondary")
                        })
                    )
                    await Card(
                        size: .large(.num(3)),
                        image: .init(
                            src: "./static/photos/home-office-desk-with-macbook-iphone-calendar-watch-and-organizer.jpg",
                            size: .init(width: 100, height: 100),
                            position: .bottom
                        ),
                        header: .init({
                            Card.Title("Card with bottom image and header")
                        }),
                        body: .init({
                            await Paragraph(loremIpsum())
                                .class("text-secondary")
                        })
                    )
                }
                
                // Footer Cards
                await CardHStack {
                    /*
                    Card(style: .borderless)
                     */
                    await Card(
                        body: .init({
                            Card.Title("Card with footer")
                            await Paragraph(loremIpsum())
                                .class("text-secondary")
                        }),
                        footer: .init({ Text("This is a standard card footer") })
                    )
                    await Card(
                        body: .init({
                            Card.Title("Card with transparent footer")
                            await Paragraph(loremIpsum())
                                .class("text-secondary")
                        }),
                        footer: .init({ Text("This is a standard card footer") }, class: "card-footer-transparent")
                    )
                    await Card(
                        body: .init({
                            Card.Title("Card with footer button")
                            await Paragraph(loremIpsum())
                                .class("text-secondary")
                        }),
                        footer: .init({
                            ButtonLink("Go somewhere", link: "#")
                        })
                    )
                    await Card(
                        body: .init({
                            Card.Title("Card with footer buttons")
                            await Paragraph(loremIpsum())
                                .class("text-secondary")
                        }),
                        footer: .init({
                            await DivC("d-flex") {
                                ButtonLink("Cancel", link: "#", theme: .raw)
                                ButtonLink("Go somewhere", link: "#")
                                    .class("ms-auto")
                            }
                        })
                    )
                }
                
                // Misc Footers and Tabs
                await CardHStack {
                    await Card(size: .large(.num(3)),
                        body: .init({
                            await Paragraph(loremIpsum())
                                .class("text-secondary")
                        }),
                        footer: .init({
                            await DivC("row align-items-center") {
                                await DivC("col-auto") {
                                    ButtonLink("More information", link: "#", theme: .raw)
                                }
                                await DivC("col-auto ms-auto") {
                                    Toggler()
                                }
                            }.style("margin:-16px 0px -16px 0px")
                        })
                    )
                    
                    await Card(size: .large(.num(3)),
                        body: .init({
                            await Paragraph(loremIpsum())
                                .class("text-secondary")
                        }),
                        footer: .init({
                            await DivC("row align-items-center") {
                                await DivC("col-auto ms-auto") {
                                    await DivC("avatar-list avatar-list-stacked") {
                                        for _ in 0...5 {
                                            Span { Text("JT") }
                                                .class("avatar avatar-sm rounded")
                                                .style("background-image: url(./static/avatars/000m.jpg)")
                                        }
                                        Span { Text("+3") }
                                            .class("avatar avatar-sm rounded")
                                            .style("background-image: url(./static/avatars/000m.jpg)")
                                    }
                                }
                            }.style("margin:-12px 0px -12px 0px")
                        })
                    )
                    
                    await Card(size: .large(.num(4)),
                        header: .init({
                            Card.HeaderTabs(style: .tabs, items: [
                                .init(active: true, { Text("Active") }),
                                .init({
                                    Div {
                                        SVGIcon(icon: .star)
                                            .style("padding-right:4px")
                                        Text("Link")
                                    }
                                }),
                                .init(disabled: true, { Text("Disabled") })
                            ], settings: [
                                Link("Hide", url: "./hidecomponent/123")
                            ])
                            .class("align-items-center")
                        }),
                        body: .init({
                        await Paragraph(loremIpsum())
                                .class("text-secondary")
                        })
                    )
                }
                
                // Tabbed Cards
                await CardHStack {
                    await Card(
                        header: .init({
                            Card.HeaderTabs(style: .pills, items: [
                                .init(active: true, { Text("Active") }),
                                .init({
                                    Div {
                                        SVGIcon(icon: .star)
                                            .style("padding-right:4px")
                                        Text("Link")
                                    }
                                }),
                                .init(disabled: true, { Text("Disabled") })
                            ], settings: [
                                Link("Hide", url: "./hidecomponent/123")
                            ])
                            .class("align-items-center")
                        }),
                        body: .init({
                            await Paragraph(loremIpsum())
                                .class("text-secondary")
                        })
                    )
                    
                    await TabbedCard(
                        sections: [
                            .init(tab: {
                                Text("Tab 1")
                            }, body: {
                                Card.Title("Content of tab #1")
                                await Paragraph(loremIpsum())
                                .class("text-secondary")
                            }),
                            .init(tab: {
                                Text("Tab 2")
                            }, body: {
                                Card.Title("Content of tab #2")
                                await Paragraph(loremIpsum())
                                .class("text-secondary")
                            }),
                            .init(tab: {
                                Text("Tab 3")
                            }, body: {
                                Card.Title("Content of tab #3")
                                await Paragraph(loremIpsum())
                                .class("text-secondary")
                            }),
                            .init(tab: {
                                Text("Tab 4")
                            }, body: {
                                Card.Title("Content of tab #4")
                                await Paragraph(loremIpsum())
                                .class("text-secondary")
                            })
                        ]
                    )
                    
                    await TabbedCard(tabLocation: .bottom,
                        sections: [
                            .init(tab: {
                                Text("Tab 1")
                            }, body: {
                                Card.Title("Content of tab #1")
                                await Paragraph(loremIpsum())
                                .class("text-secondary")
                            }),
                            .init(tab: {
                                Text("Tab 2")
                            }, body: {
                                Card.Title("Content of tab #2")
                                await Paragraph(loremIpsum())
                                .class("text-secondary")
                            }),
                            .init(tab: {
                                Text("Tab 3")
                            }, body: {
                                Card.Title("Content of tab #3")
                                await Paragraph(loremIpsum())
                                .class("text-secondary")
                            }),
                            .init(tab: {
                                Text("Tab 4")
                            }, body: {
                                Card.Title("Content of tab #4")
                                await Paragraph(loremIpsum())
                                .class("text-secondary")
                            })
                        ]
                    )
                }
                
                // Embedded Cards
                await CardHStack {
                    await Card(
                        header: .init({
                            Card.Title("Cards inside card")
                        }),
                        body: .init({
                            await CardHStack(margin: false) {
                                await Card(status: .init(position: .top, color: .red),
                                    header: .init({
                                        Card.Title("First card")
                                    }),
                                    body: .init({
                                        await Paragraph(loremIpsum())
                                            .class("text-secondary")
                                    })
                                )
                                await Card(status: .init(position: .top, color: .green),
                                    header: .init({
                                        Card.Title("Second card")
                                    }),
                                    body: .init({
                                        await Paragraph(loremIpsum())
                                            .class("text-secondary")
                                    })
                                )
                                await Card(status: .init(position: .top, color: .blue),
                                    header: .init({
                                        Card.Title("Third card")
                                    }),
                                    body: .init({
                                        await Paragraph(loremIpsum())
                                            .class("text-secondary")
                                    })
                                )
                            }
                        })
                    )
                }
                
                // Card Group
                CardGroup(cards: [
                    await Card(status: .init(position: .top, color: .red),
                        header: .init({
                            Card.Title("First card")
                        }),
                        body: .init({
                            await Paragraph(loremIpsum())
                                .class("text-secondary")
                        })
                    ),
                    await Card(status: .init(position: .top, color: .green),
                        header: .init({
                            Card.Title("Second card")
                        }),
                        body: .init({
                            await Paragraph(loremIpsum())
                                .class("text-secondary")
                        })
                    ),
                    await Card(status: .init(position: .top, color: .blue),
                        header: .init({
                            Card.Title("Third card")
                        }),
                        body: .init({
                            await Paragraph(loremIpsum())
                                .class("text-secondary")
                        })
                    )
                ])
                
                // Long Content Cards
                await CardHStack {
                    await Card(
                        header: .init({
                            Card.Title("Card title")
                        }),
                        body: .init({
                            await Paragraph(loremIpsum())
                                .class("text-secondary")
                        }),
                        footer: .init({ 
                            Text("Last updated 3 mins ago")
                        })
                    )
                    await Card(
                        header: .init({
                            Card.Title("Card title")
                        }),
                        body: .init({
                            await Paragraph(loremIpsum())
                                .class("text-secondary")
                            await Paragraph(loremIpsum())
                                .class("text-secondary")
                        }),
                        footer: .init({
                            Text("Last updated 3 mins ago")
                        })
                    )
                    await Card(
                        header: .init({
                            Card.Title("Card with very long content")
                        }),
                        body: .init({
                            Div {
                                await Paragraph(loremIpsum())
                                    .class("text-secondary")
                                await Paragraph(loremIpsum())
                                    .class("text-secondary")
                                await Paragraph(loremIpsum())
                                    .class("text-secondary")
                            }
                            .style("height:136px; overflow-y:auto")
                        }),
                        footer: .init({
                            Text("Last updated 3 mins ago")
                        })
                    )
                }
                
                // Misc Cards
                await CardHStack {
                    ActionItemCard(size: .large(.num(4)))
                    await Card(size: .large(.num(4)),
                        body: .init({
                            Plot.Form(url: "#") {
                                await DivC("mb-3") {
                                    Div { Text("Card number") }.class("form-label")
                                    //<input type="text" name="input-mask" class="form-control" data-mask="0000 0000 0000 0000" data-mask-visible="true" placeholder="0000 0000 0000 0000"autocomplete="off"/>
                                    Input(type: .text, name: "input-mask", placeholder: "0000 0000 0000 0000")
                                        .attribute(named: "data-mask", value: "0000 0000 0000 0000")
                                        .attribute(named: "data-mask-visible", value: "true")
                                        .attribute(named: "autocomplete", value: "off")
                                        .class("form-control")
                                }
                                await DivC("mb-3") {
                                    Div { Text("Card name") }.class("form-label")
                                    Input(type: .text, placeholder: "name on card")
                                        .class("form-control")
                                }
                                await DivC("row") {
                                    await Column(size: .full(.num(8))) {
                                        await DivC("mb-3") {
                                            await DivC("form-label") { Text("Expiration Date") }
                                            await DivC("row g-2") {
                                                await Column {
                                                    await Element(name: "select") {
                                                        for i in 1...12 {
                                                            await Element(name: "option") {
                                                                Text("\(i)")
                                                            }.attribute(named: "value", value: "\(i)")
                                                        }
                                                    }.class("form-select")
                                                }
                                                await Column {
                                                    await Element(name: "select") {
                                                        for i in 2020...2040 {
                                                            await Element(name: "option") {
                                                                Text("\(i)")
                                                            }.attribute(named: "value", value: "\(i)")
                                                        }
                                                    }.class("form-select")
                                                }
                                            }
                                        }
                                    }
                                    await Column {
                                        await DivC("mb-3") {
                                            Div { Text("CVV") }.class("form-label")
                                            Input(type: .number, placeholder: "000")
                                                .class("form-control")
                                        }
                                    }
                                }
                                await DivC("mt-2") {
                                    ButtonLink("Pay now", link: "#", icon: .moneybag)
                                        .class("w-100")
                                }
                            }
                        })
                    )
                }
            }
        }))
    }
}
