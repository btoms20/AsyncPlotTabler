import AsyncPlotTabler

/// Widgets Demo View
struct WidgetsPage: Component {
    
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(
            header: .init(header: "Widgets"),
            content: {
                await CardVStack {
                    
                    await CardHStack {
                        
                        await Card(
                            body: .init({
                                await Row(alignItemsCenter: true) {
                                    await Column(size: .full(.num(3))) {
                                        Image("https://cdn.dribbble.com/users/844826/screenshots/14553706/media/2be9a4847b939e02702648d058cf2df8.png")
                                            .class("rounded")
                                    }
                                    await Column {
                                        H3 {
                                            Link(url: "#", label: { Text("Food Deliver UI dashboards") })
                                                .class("text-reset")
                                        }.class("card-title mb-1")
                                        Div {
                                            Text("Updated 3 miutes ago")
                                        }.textColor(.secondary)
                                        
                                        Div {
                                            await Row(alignItemsCenter: true) {
                                                await Column {
                                                    Text("25%")
                                                }.class("col-auto")
                                                await Column {
                                                    ProgressBar(style: .progress(.init(progress: 25)), size: .sm)
                                                }
                                            }
                                        }.margin(.top(3))
                                    }
                                    await Column {
                                        await DivC("dropdown") {
                                            Link(url: "#") {
                                                SVGIcon(icon: .dots_vertical)
                                            }
                                            .class("btn-action")
                                            .attribute(named: "data-bs-toggle", value: "dropdown")
                                            .attribute(named: "aria-expanded", value: "false")
                                            await DropDownMenu(columns: [[
                                                DropDownMenu_SingleItem(url: "#", content: {
                                                    Text("Action")
                                                }),
                                                DropDownMenu_SingleItem(url: "#", content: {
                                                    Text("Another Action")
                                                })
                                            ]])
                                        }
                                    }.class("col-auto")
                                }
                            })
                        )
                        
                        await Card(
                            body: .init({
                                await Row(alignItemsCenter: true) {
                                    await Column(size: .full(.num(3))) {
                                        Image("https://cdn.dribbble.com/users/844826/screenshots/14547977/media/e7749bd1b09d9415b8dc265a7dbe81f6.png")
                                            .class("rounded")
                                    }
                                    await Column {
                                        H3 {
                                            Link(url: "#", label: { Text("Projects Dashboard") })
                                                .class("text-reset")
                                        }.class("card-title mb-1")
                                        Div {
                                            Text("Updated 2 hours ago")
                                        }.textColor(.secondary)
                                        
                                        Div {
                                            await Row(alignItemsCenter: true) {
                                                await Column {
                                                    Text("76%")
                                                }.class("col-auto")
                                                await Column {
                                                    ProgressBar(style: .progress(.init(progress: 76)), size: .sm)
                                                }
                                            }
                                        }
                                        .margin(.top(3))
                                    }
                                    await Column {
                                        await DivC("dropdown") {
                                            Link(url: "#") {
                                                SVGIcon(icon: .dots_vertical)
                                            }
                                            .class("btn-action")
                                            .attribute(named: "data-bs-toggle", value: "dropdown")
                                            .attribute(named: "aria-expanded", value: "false")
                                            await DropDownMenu(columns: [[
                                                DropDownMenu_SingleItem(url: "#", content: {
                                                    Text("Action")
                                                }),
                                                DropDownMenu_SingleItem(url: "#", content: {
                                                    Text("Another Action")
                                                })
                                            ]])
                                        }
                                    }.class("col-auto")
                                }
                            })
                        )
                        
                    }
                    
                    await CardHStack {
                        for (i, user) in MockData.Users.prefix(4).enumerated() {
                            await Card(
                                body: .init({
                                    await LabeledAvatar(style: i >= 2 ? .trailingAvatar : .leadingAvatar, avatar: .init(size: .md, user.avatar), title: user.name, subTitle: user.jobTitle, link: "#")
                                })
                            )
                        }
                    }
                    
                    await CardHStack {
                        for user in MockData.Users.prefix(4) {
                            await Card(
                                body: .init({
                                    Avatar(size: .xl, user.avatar)
                                        .margin(.body(3))
                                    Card.Title(user.name)
                                        .margin(.body(1))
                                    Div { Text(user.jobTitle) }
                                        .textColor(.secondary)
                                }, class: "text-center"),
                                flex: .init({
                                    Link(url: "#", label: { Text("View Full Profile") })
                                        .class("card-btn")
                                })
                            )
                        }
                    }
                    
                    await CardHStack {
                        for user in MockData.Users.prefix(4) {
                            await Card(
                                type: .link("#"),
                                cover: .init(style: .image("./static/photos/blond-using-her-laptop-at-her-bedroom.jpg"), {
                                    Avatar(size: .xl, user.avatar)
                                }),
                                body: .init({
                                    Card.Title(user.name)
                                        .margin(.body(1))
                                    Div { Text(user.jobTitle) }
                                        .textColor(.secondary)
                                })
                            )
                        }
                    }
                    
                    await CardHStack {
                        for user in MockData.Users.randomSample(count: 2) {
                            await Card(
                                body: .init({
                                    await LabeledAvatar(avatar: .init(size: .xl, user.avatar), link: "#", content: {
                                        Link(url: "#") {
                                            Text(user.name)
                                        }
                                        .class("text-reset d-block text-truncate")
                                        await DivC("text-secondary text-truncate mt-n1") {
                                            Text(user.jobTitle)
                                        }
                                        await DivC("small mt-1") {
                                            Span {
                                                Badge(style: .dot(.green))
                                                    .margin(.trailing(2))
                                                Text("Online")
                                            }
                                        }
                                    }, trailingContent: {
                                        ButtonLink("Subscribe", link: "#", style: .outline, theme: .color(.muted))
                                       
                                        await DivC("dropdown") {
                                            Link(url: "#") {
                                                SVGIcon(icon: .dots_vertical)
                                            }
                                            .class("btn-action")
                                            .attribute(named: "data-bs-toggle", value: "dropdown")
                                            .attribute(named: "aria-expanded", value: "false")
                                            await DropDownMenu(columns: [[
                                                DropDownMenu_SingleItem(url: "#", content: {
                                                    Text("Action")
                                                }),
                                                DropDownMenu_SingleItem(url: "#", content: {
                                                    Text("Another Action")
                                                })
                                            ]])
                                        }
                                    })
                                })
                            )
                        }
                    }
                    
                    await CardHStack {
                        await Card(body: .init({
                            await LabeledAvatar(
                                avatar: .init(size: .md, .icon(.currency_dollar, iconColor: .white, bgColor: .blue)),
                                title: "132 Sales",
                                subTitle: "12 waiting payments",
                                link: "#"
                            )
                        }))
                        
                        await Card(body: .init({
                            await LabeledAvatar(
                                avatar: .init(size: .md, .icon(.shopping_cart, iconColor: .white, bgColor: .green)),
                                title: "78 Orders",
                                subTitle: "32 shipped",
                                link: "#"
                            )
                        }))
                        
                        await Card(body: .init({
                            await LabeledAvatar(
                                avatar: .init(size: .md, .icon(.user, iconColor: .white, bgColor: .red)),
                                title: "1352 Members",
                                subTitle: "163 registered today",
                                link: "#"
                            )
                        }))
                        
                        await Card(body: .init({
                            await LabeledAvatar(
                                avatar: .init(size: .md, .icon(.message, iconColor: .white, bgColor: .yellow)),
                                title: "132 Comments",
                                subTitle: "16 unread",
                                link: "#"
                            )
                        }))
                    }
                    
                    await CardHStack {
                        await Card(body: .init({
                            await LabeledAvatar(
                                avatar: .init(size: .md, .icon(.arrow_up, iconColor: .green, bgColor: .green)), link: "#", content: {
                                    Span {
                                        Text("$5,256.99 ")
                                        Span { Text("+4%") }.textColor(.green)
                                    }
                                    .class("text-reset d-block text-truncate")
                                    await DivC("text-secondary text-truncate mt-n1") {
                                        Text("Revenue last 30 days")
                                    }
                                }
                            )
                        }))
                        
                        await Card(body: .init({
                            await LabeledAvatar(
                                avatar: .init(size: .md, .icon(.arrow_down, iconColor: .red, bgColor: .red)), link: "#", content: {
                                    Span {
                                        Text("342 ")
                                        Span { Text("-4.3%") }.textColor(.red)
                                    }
                                    .class("text-reset d-block text-truncate")
                                    await DivC("text-secondary text-truncate mt-n1") {
                                        Text("Sales last 30 days")
                                    }
                                }
                            )
                        }))
                        
                        await Card(body: .init({
                            await LabeledAvatar(
                                avatar: .init(size: .md, .icon(.arrow_up, iconColor: .green, bgColor: .green)), link: "#", content: {
                                    Span {
                                        Text("132 ")
                                        Span { Text("+6.8%") }.textColor(.green)
                                    }
                                    .class("text-reset d-block text-truncate")
                                    await DivC("text-secondary text-truncate mt-n1") {
                                        Text("Customers last 30 days")
                                    }
                                }
                            )
                        }))
                        
                        await Card(body: .init({
                            await LabeledAvatar(
                                avatar: .init(size: .md, .icon(.arrow_down, iconColor: .red, bgColor: .red)), link: "#", content: {
                                    Span {
                                        Text("78 ")
                                        Span { Text("-2%") }.textColor(.red)
                                    }
                                    .class("text-reset d-block text-truncate")
                                    await DivC("text-secondary text-truncate mt-n1") {
                                        Text("Members registered today")
                                    }
                                }
                            )
                        }))
                    }
                    
                    await CardHStack(margin: false) {
                        
                        await CardVStack {
                            await Card(body: .init({
                                Span { Text("1700") }
                                .class("text-reset d-block text-truncate")
                                await DivC("text-secondary text-truncate mt-n1") {
                                    Text("Users")
                                }
                            }))
                            
                            await Card(body: .init({
                                await LabeledAvatar(avatar: .init(size: .md, .icon(.heart, iconColor: .white, bgColor: .red)), title: "1700", subTitle: "Users", link: "#")
                            }))
                            
                            await Card(body: .init({
                                await LabeledAvatar(avatar: .init(size: .md, .icon(.brand_github, iconColor: .white, bgColor: .green)), title: "1700", subTitle: "Users", link: "#")
                            }))
                            
                            await Card(body: .init({
                                await LabeledAvatar(avatar: .init(size: .md, .text("HS")), title: "1700", subTitle: "Users", link: "#")
                            }))
                            
                            for user in MockData.Users.randomSample(count: 3) {
                                await Card(body: .init({
                                    await LabeledAvatar(avatar: .init(size: .md, user.avatar), title: user.name, subTitle: user.jobTitle, link: "#")
                                }))
                            }
                            
                            await Card(body: .init({
                                for user in MockData.Users.randomSample(count: 1) {
                                    await LabeledAvatar(avatar: .init(size: .md, user.avatar), link: "#", content: {
                                        Span {
                                            Text("1700 ")
                                            SVGIcon(icon: .trending_down, color: .red, size: .sm)
                                        }
                                        .class("text-reset d-block text-truncate")
                                        await DivC("text-secondary text-truncate mt-n1") {
                                            Text("Users last 30 days")
                                        }
                                    })
                                }
                            }))
                            
                            await Card(
                                header: .init({ Card.Title("Card with code") }),
                                body: .raw({
                                    Markdown.CodeBlock(code: """
                                    .card-footer {
                                        background: transparent;

                                        &:last-child {
                                            border-radius: 0 0 1 2;
                                        }
                                    }
                                    """)
                                }, class: "card-code")
                            )
                        }
                        
                        await Card(
                            progress: .init(style: .progress(.init(progress: 43))),
                            body: .init({
                                Avatar(size: .xl, .text("W"))
                                    .margin(.body(3))
                                Card.Title("New Website")
                                    .margin(.body(1))
                                Div { Text("Due by: 28 Aug 2019") }
                                    .textColor(.secondary)
                                    .margin(.body(3))
                                Div { Badge(style: .inlineBadge(.light, "Waiting", .red)) }.margin(.body(3))
                                Div { AvatarList(size: .md, avatars: MockData.Users.randomSample(count: 5).map { $0.avatar }) }
                            }, class: "text-center")
                        )
                        
                        await CardVStack {
                            await Card(
                                progress: .init(style: .progress(.init(progress: 40)), color: .red, location: .top),
                                body: .init({
                                    H3 {
                                        Text("Tabler UI")
                                        Badge(style: .inlineBadge(.light, "v1.0", .muted)).margin(.leading(2))
                                    }
                                    .class("card-title")
                                    
                                    Div { AvatarList(size: .md, avatars: MockData.Users.randomSample(count: 4).map { $0.avatar }) }.margin(.body(3))
                                    
                                    await DivC("card-meta d-flex justify-content-between") {
                                        await DivC("d-flex align-items-center") {
                                            SVGIcon(icon: .check)
                                            Span { Text("4/10") }
                                        }
                                        Span { Text("Due 72 days") }
                                    }
                                })
                            )
                            
                            await Card(
                                progress: .init(style: .progress(.init(progress: 80)), color: .green, location: .top),
                                body: .init({
                                    H3 { Text("Tabler React") }
                                    .class("card-title")
                                    
                                    Div { AvatarList(size: .md, avatars: MockData.Users.randomSample(count: 8).map { $0.avatar }) }.margin(.body(3))
                                    
                                    await DivC("card-meta d-flex justify-content-between") {
                                        await DivC("d-flex align-items-center") {
                                            SVGIcon(icon: .check)
                                            Span { Text("8/10") }
                                        }
                                        Span { Text("Due 2 days") }
                                    }
                                })
                            )
                            
                            await Card(
                                body: .init({
                                    H3 { Text("Basic info") }
                                    .class("card-title")
                                    
                                    Div {
                                        SVGIcon(icon: .book, color: .secondary).margin(.trailing(2))
                                        Text("Went to: ")
                                        await Element(name: "strong") { Text("University of Ljubljana") }
                                    }.margin(.body(2))
                                    
                                    Div {
                                        SVGIcon(icon: .briefcase, color: .secondary).margin(.trailing(2))
                                        Text("Warked at: ")
                                        await Element(name: "strong") { Text("Devpulse") }
                                    }.margin(.body(2))
                                    
                                    Div {
                                        SVGIcon(icon: .home, color: .secondary).margin(.trailing(2))
                                        Text("Lives in: ")
                                        await Element(name: "strong") { Text("Šentilj v Slov. Goricah, Slovenia") }
                                    }.margin(.body(2))
                                    
                                    Div {
                                        SVGIcon(icon: .map_pin, color: .secondary).margin(.trailing(2))
                                        Text("From: ")
                                        await Element(name: "strong") { Text("Slovenia") }
                                    }.margin(.body(2))
                                    
                                    Div {
                                        SVGIcon(icon: .calendar, color: .secondary).margin(.trailing(2))
                                        Text("Birth date: ")
                                        await Element(name: "strong") { Text("13/01/1985") }
                                    }.margin(.body(2))
                                    
                                    Div {
                                        SVGIcon(icon: .map_pin, color: .secondary).margin(.trailing(2))
                                        Text("Time zone: ")
                                        await Element(name: "strong") { Text("Europe/Ljubljana") }
                                    }.margin(.body(2))
                                })
                            )
                            
                            await Card(
                                header: .init({
                                    Card.Title("Configuration")
                                    await DivC("card-actions") {
                                        Link(url: "#") {
                                            Text("Edit Configuration ")
                                            SVGIcon(icon: .edit)
                                        }
                                    }
                                }),
                                body: .init({
                                    await Row {
                                        await Element(name: "dt") { Text("Date:") }
                                            .class("col-5")
                                        await Element(name: "dd") { Text("2020-01-05 16:42:29 UTC") }
                                            .class("col-7")
                                        
                                        await Element(name: "dt") { Text("Account:") }
                                            .class("col-5")
                                        await Element(name: "dd") { Text("tabler") }
                                            .class("col-7")
                                        
                                        await Element(name: "dt") { Text("Location:") }
                                            .class("col-5")
                                        await Element(name: "dd") { Text("Poland") }
                                            .class("col-7")
                                        
                                        await Element(name: "dt") { Text("IP Address:") }
                                            .class("col-5")
                                        await Element(name: "dd") { Text("46.113.11.3") }
                                            .class("col-7")
                                        
                                        await Element(name: "dt") { Text("Operating System:") }
                                            .class("col-5")
                                        await Element(name: "dd") { Text("OS X 10.15.2 64-bit") }
                                            .class("col-7")
                                        
                                        await Element(name: "dt") { Text("Browser:") }
                                            .class("col-5")
                                        await Element(name: "dd") { Text("Chrome") }
                                            .class("col-7")
                                    }
                                })
                            )
                        }
                        
                    }
                    
                }
            })
        )
    }
}


