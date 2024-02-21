import AsyncPlotTabler

/// Home Demo Page
struct HomePage: Component {
            
    func body() async -> Plot.Component {
        await Site(
            header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes),
            page: Page(header: .init(header: {
                await Row(g: 2, alignItemsCenter: true) {
                    await Column {
                        await DivC("page-pretitle") { Text("Overview") }
                        H2 { Text("Dashboard") }.class("page-title")
                    }
                    await DivC("col-auto ms-auto d-print-none") {
                        await DivC("btn-list") {
                            Span {
                                ButtonLink("New View", link: "#", theme: .color(.white))
                            }.class("d-none d-sm-inline")
                            ButtonLink("Create new report", link: "#", icon: .plus, theme: .primary)
                                .class("d-none d-sm-inline-block")
                            ButtonLink("", link: "#", icon: .plus, theme: .primary)
                                .class("d-sm-none btn-icon")
                        }
                    }
                }
            }), content: {
                await CardVStack {
                    await CardHStack {
                        SalesWidget()
                        RevenueWidget()
                        NewClientsWidget()
                        ActiveUsersWidget()
                        
                    }
                    .class("row-deck")
                    
                    await CardHStack {
                        await IconWidget(title: "132 Sales", description: "12 waiting payments", icon: .currency_dollar, iconColor: .white, bgColor: .primary)
                        await IconWidget(title: "78 Orders", description: "32 shipped", icon: .shopping_cart, iconColor: .white, bgColor: .green)
                        await IconWidget(title: "623 Shares", description: "16 today", icon: .brand_twitter, iconColor: .white, bgColor: .azure)
                        await IconWidget(title: "132 Likes", description: "21 today", icon: .brand_facebook, iconColor: .white, bgColor: .blue)
                    }
                    
                    await CardHStack {
                        TrafficSummaryCard()
                        LocationsCard()
                    }
                    
                    await CardHStack {
                        await Column(size: .full(.num(6))) {
                            StorageUseCard()
                                .margin(.body(3))
                            ActivityCard()
                        }
                        
                        await Column(size: .full(.num(6))) {
                            DevelopmentActivity()
                        }
                    }.margin(.body(1))
                    
                    await CardHStack {
                        await Card(cardSize: .md, stamp: .init(icon: .ghost, color: .primary, size: .large), body: .init({
                            await Row(alignItemsCenter: true) {
                                await Column(size: .full(.num(10))) {
                                    H3 { Text("Tabler Icons") }.class("h1")
                                    await DivC("markdown text-secondary") {
                                        Text("All icons come from the Tabler Icons set and are MIT-licensed. Visit ")
                                        Link(url: "https://tabler-icons.io", label: { Text("tabler-icons.io") })
                                        Text(" download any of the 4637 icons in SVG, PNG or&nbsp;React and use them in your favourite design tools.")
                                    }
                                    await DivC("mt-3") {
                                        ButtonLink("Download Icons", link: "https://tabler-icons.io")
                                    }
                                }
                            }
                        }))
                    }
                    
                    await CardHStack {
                        await Card(
                            size: .large(.num(8)),
                            header: .init({
                                Card.Title("Most Visited Pages")
                            }),
                            body: nil,
                            table: .init(style: .regular, editable: false, items: MockData.PageVisits.mockData)
                        )
                        await Column {
                            Link(url: "https://github.com/sponsors/codecalm") {
                                await DivC("card-body") { }
                            }
                            .class("card card-sponsor")
                            .style("background-image: url(./static/sponsor-banner-homepage.svg)")
                            .attribute(named: "aria-label", value: "Sponsor Tabler!")
                        }
                    }
                    
                    await CardHStack {
                        SocialMediaTrafficWidget()
                        TasksWidget()
                    }
                    
                    await CardHStack {
                        InvoicesTableWidget()
                    }
                }
            })
        )
    }
    
    func IconWidget(title: String, description: String, icon:Icons, iconColor:Colors = .white, bgColor:Colors = .primary) async -> Component {
        await Card(
            cardSize: .sm,
            body: .init({
                await Row(alignItemsCenter: true) {
                    await Column {
                        Avatar(size: .md, .icon(icon, iconColor: iconColor, bgColor: bgColor))
                    }.class("col-auto")
                    await Column {
                        Div { Text(title) }
                            .fontWeight(.medium)
                        Div { Text(description) }
                            .textColor(.secondary)
                    }
                }
            })
        )
    }
    
    
    struct SalesWidget:Component {
        func body() async -> Plot.Component {
            await Card(body: .init({
                await DivC("d-flex align-items-center") {
                    await DivC("subheader") { Text("Sales") }
                    await DivC("ms-auto lh-1") {
                        await Dropdown(label: "Last 7 days", items: [
                            DropDownMenu_SingleItem(style: .link(url: "#"), active: true, { Text("Last 7 days") }),
                            await DropDownMenu_SingleItem(style: .link(url: "#"), { Text("Last 30 days") }),
                            await DropDownMenu_SingleItem(style: .link(url: "#"), { Text("Last 3 months") }),
                        ])
                    }
                }
                await DivC("h1 mb-3") { Text("75%") }
                await DivC("d-flex mb-2") {
                    Div { Text("Conversion rate") }
                    await DivC("ms-auto") {
                        Span {
                            Text("7%")
                            SVGIcon(icon: .trending_up, color: .green, size: .regular)
                        }.class("text-green d-inline-flex align-items-center lh-1")
                    }
                }
                ProgressBar(progress: .init(progress: 75), color: .primary, size: .sm)
            }))
        }
    }
    
    struct RevenueWidget:Component {
        func body() async -> Plot.Component {
            await Card(body: .init({
                await DivC("d-flex align-items-center") {
                    await DivC("subheader") { Text("Revenue") }
                    await DivC("ms-auto lh-1") {
                        await Dropdown(label: "Last 7 days", items: [
                            DropDownMenu_SingleItem(style: .link(url: "#"), active: true, { Text("Last 7 days") }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), { Text("Last 30 days") }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), { Text("Last 3 months") }),
                        ])
                    }
                }
                await DivC("d-flex align-items-baseline") {
                    await DivC("h1 mb-0 me-2") { Text("$4,300") }
                    await DivC("me-auto") {
                        Span {
                            Text("8%")
                            SVGIcon(icon: .trending_up, color: .green, size: .regular)
                        }.class("text-green d-inline-flex align-items-center lh-1")
                    }
                }
            }), other:
                    Chart(options: .init(
                        series: .labeled([.init(name: "Profits", data: [37, 35, 44, 28, 36, 24, 65, 31, 37, 39, 62, 51, 35, 41, 35, 27, 93, 53, 61, 27, 54, 43, 19, 46, 39, 62, 51, 35, 41, 67])]),
                        chart: .init(fontFamily: "inherit", height: 40, type: "area", zoom: nil, parentHeightOffset: nil, sparkline: .init(enabled: true), toolbar: nil, animations: .init(enabled: false), stacked: nil),
                        dataLabels: .init(enabled: false),
                        fill: .init(opacity: 0.16, type: "solid"),
                        stroke: .init(width: 2, lineCap: "round", curve: "smooth"),
                        title: nil,
                        tooltip: .init(theme: "dark"),
                        grid: .init(row: nil, strokeDashArray: 4, padding: nil, xaxis: nil),
                        xaxis: .init(labels: .init(padding: 0), tooltip: .init(enabled: false), axisBorder: .init(show: false), categories: nil, type: "datetime"),
                        yaxis: .init(labels: .init(padding: 4), max: nil, type: nil),
                        colors: [Colors.primary.tagValue],
                        labels: ["2020-06-20", "2020-06-21", "2020-06-22", "2020-06-23", "2020-06-24", "2020-06-25", "2020-06-26", "2020-06-27", "2020-06-28", "2020-06-29", "2020-06-30", "2020-07-01", "2020-07-02", "2020-07-03", "2020-07-04", "2020-07-05", "2020-07-06", "2020-07-07", "2020-07-08", "2020-07-09", "2020-07-10", "2020-07-11", "2020-07-12", "2020-07-13", "2020-07-14", "2020-07-15", "2020-07-16", "2020-07-17", "2020-07-18", "2020-07-19"],
                        legend: .init(show: false),
                        plotOptions: nil,
                        markers: nil
                    ))
                        .class("chart-sm")
            )
        }
    }
    
    struct NewClientsWidget:Component {
        func body() async -> Plot.Component {
            await Card(body: .init({
                await DivC("d-flex align-items-center") {
                    await DivC("subheader") { Text("New clients") }
                    await DivC("ms-auto lh-1") {
                        await Dropdown(label: "Last 7 days", items: [
                            DropDownMenu_SingleItem(style: .link(url: "#"), active: true, { Text("Last 7 days") }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), { Text("Last 30 days") }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), { Text("Last 3 months") }),
                        ])
                    }
                }
                await DivC("d-flex align-items-baseline") {
                    await DivC("h1 mb-3 me-2") { Text("6,782") }
                    await DivC("me-auto") {
                        Span {
                            Text("8%")
                            SVGIcon(icon: .minus, color: .yellow, size: .regular)
                        }.class("text-yellow d-inline-flex align-items-center lh-1")
                    }
                }
                Chart(options: .init(
                    series: .labeled([
                        .init(name: "May", data: [37, 35, 44, 28, 36, 24, 65, 31, 37, 39, 62, 51, 35, 41, 35, 27, 93, 53, 61, 27, 54, 43, 19, 46, 39, 62, 51, 35, 41, 67]),
                        .init(name: "April", data: [93, 54, 51, 24, 35, 35, 31, 67, 19, 43, 28, 36, 62, 61, 27, 39, 35, 41, 27, 35, 51, 46, 62, 37, 44, 53, 41, 65, 39, 37]),
                    ]),
                    chart: .init(fontFamily: "inherit", height: 40, type: "line", zoom: nil, parentHeightOffset: nil, sparkline: .init(enabled: true), toolbar: nil, animations: .init(enabled: false), stacked: nil),
                    dataLabels: .init(enabled: false),
                    fill: .init(opacity: 1, type: "solid"),
                    stroke: .init(width: .multiple([2, 1]), dashArray: .multiple([0, 3]), lineCap: "round", curve: "smooth"),
                    title: nil,
                    tooltip: .init(theme: "dark"),
                    grid: .init(row: nil, strokeDashArray: 4, padding: nil, xaxis: nil),
                    xaxis: .init(labels: .init(padding: 0), tooltip: .init(enabled: false), axisBorder: nil, categories: nil, type: "datetime"),
                    yaxis: .init(labels: .init(padding: 4), max: nil, type: nil),
                    colors: [Colors.primary.tagValue, Colors.gray(.g600).tagValue],
                    labels: ["2020-06-20", "2020-06-21", "2020-06-22", "2020-06-23", "2020-06-24", "2020-06-25", "2020-06-26", "2020-06-27", "2020-06-28", "2020-06-29", "2020-06-30", "2020-07-01", "2020-07-02", "2020-07-03", "2020-07-04", "2020-07-05", "2020-07-06", "2020-07-07", "2020-07-08", "2020-07-09", "2020-07-10", "2020-07-11", "2020-07-12", "2020-07-13", "2020-07-14", "2020-07-15", "2020-07-16", "2020-07-17", "2020-07-18", "2020-07-19"],
                    legend: .init(show: false),
                    plotOptions: nil,
                    markers: nil
                ))
                .class("chart-sm")
            }))
        }
    }
    
    struct ActiveUsersWidget:Component {
        func body() async -> Plot.Component {
            await Card(body: .init({
                await DivC("d-flex align-items-center") {
                    await DivC("subheader") { Text("Active users") }
                    await DivC("ms-auto lh-1") {
                        await Dropdown(label: "Last 7 days", items: [
                            DropDownMenu_SingleItem(style: .link(url: "#"), active: true, { Text("Last 7 days") }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), { Text("Last 30 days") }),
                            DropDownMenu_SingleItem(style: .link(url: "#"), { Text("Last 3 months") }),
                        ])
                    }
                }
                await DivC("d-flex align-items-baseline") {
                    await DivC("h1 mb-3 me-2") { Text("2,986") }
                    await DivC("me-auto") {
                        Span {
                            Text("4%")
                            SVGIcon(icon: .trending_up, color: .green, size: .regular)
                        }.class("text-green d-inline-flex align-items-center lh-1")
                    }
                }
                Chart(options: .init(
                    series: .labeled([
                        .init(name: "Profits", data: [37, 35, 44, 28, 36, 24, 65, 31, 37, 39, 62, 51, 35, 41, 35, 27, 93, 53, 61, 27, 54, 43, 19, 46, 39, 62, 51, 35, 41, 67]),
                    ]),
                    chart: .init(fontFamily: "inherit", height: 40, type: "bar", zoom: nil, parentHeightOffset: nil, sparkline: .init(enabled: true), toolbar: nil, animations: .init(enabled: false), stacked: nil),
                    dataLabels: .init(enabled: false),
                    fill: .init(opacity: 1, type: "solid"),
                    stroke: nil,
                    title: nil,
                    tooltip: .init(theme: "dark"),
                    grid: .init(row: nil, strokeDashArray: 4, padding: nil, xaxis: nil),
                    xaxis: .init(labels: .init(padding: 0), tooltip: .init(enabled: false), axisBorder: .init(show: false), categories: nil, type: "datetime"),
                    yaxis: .init(labels: .init(padding: 4), max: nil, type: nil),
                    colors: [Colors.primary.tagValue],
                    labels: ["2020-06-20", "2020-06-21", "2020-06-22", "2020-06-23", "2020-06-24", "2020-06-25", "2020-06-26", "2020-06-27", "2020-06-28", "2020-06-29", "2020-06-30", "2020-07-01", "2020-07-02", "2020-07-03", "2020-07-04", "2020-07-05", "2020-07-06", "2020-07-07", "2020-07-08", "2020-07-09", "2020-07-10", "2020-07-11", "2020-07-12", "2020-07-13", "2020-07-14", "2020-07-15", "2020-07-16", "2020-07-17", "2020-07-18", "2020-07-19"],
                    legend: .init(show: false),
                    plotOptions: .init(bar: .init(columnWidth: "50%", horizontal: nil)),
                    markers: nil
                ))
                .class("chart-sm")
            }))
        }
    }
    
    
    struct TrafficSummaryCard:Component {
        func body() async -> Plot.Component {
            await Card(body: .init({
                Card.Title("Traffic Summary")
                Chart(options: .init(
                    series: .labeled([
                        .init(name: "Web", data: [1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 2, 12, 5, 8, 22, 6, 8, 6, 4, 1, 8, 24, 29, 51, 40, 47, 23, 26, 50, 26, 41, 22, 46, 47, 81, 46, 6]),
                        .init(name: "Social", data: [2, 5, 4, 3, 3, 1, 4, 7, 5, 1, 2, 5, 3, 2, 6, 7, 7, 1, 5, 5, 2, 12, 4, 6, 18, 3, 5, 2, 13, 15, 20, 47, 18, 15, 11, 10, 0]),
                        .init(name: "Other", data: [2, 9, 1, 7, 8, 3, 6, 5, 5, 4, 6, 4, 1, 9, 3, 6, 7, 5, 2, 8, 4, 9, 1, 2, 6, 7, 5, 1, 8, 3, 2, 3, 4, 9, 7, 1, 6]),
                    ]),
                    chart: .init(fontFamily: "inherit", height: 255, type: "bar", zoom: nil, parentHeightOffset: 0, sparkline: nil, toolbar: .init(show: false), animations: .init(enabled: false), stacked: true),
                    dataLabels: .init(enabled: false),
                    fill: .init(opacity: 1, type: "solid"),
                    stroke: nil,
                    title: nil,
                    tooltip: .init(theme: "dark"),
                    grid: .init(row: nil, strokeDashArray: 4, padding: .init(top: -20, right: 0, left: -4, bottom: -4), xaxis: .init(lines: .init(show: true))),
                    xaxis: .init(labels: .init(padding: 0), tooltip: .init(enabled: false), axisBorder: .init(show: false), categories: nil, type: "datetime"),
                    yaxis: .init(labels: .init(padding: 4), max: nil, type: nil),
                    colors: [Colors.primary.tagValue, Colors.azure.tagValue, Colors.teal.tagValue],
                    labels: ["2020-06-20", "2020-06-21", "2020-06-22", "2020-06-23", "2020-06-24", "2020-06-25", "2020-06-26", "2020-06-27", "2020-06-28", "2020-06-29", "2020-06-30", "2020-07-01", "2020-07-02", "2020-07-03", "2020-07-04", "2020-07-05", "2020-07-06", "2020-07-07", "2020-07-08", "2020-07-09", "2020-07-10", "2020-07-11", "2020-07-12", "2020-07-13", "2020-07-14", "2020-07-15", "2020-07-16", "2020-07-17", "2020-07-18", "2020-07-19", "2020-07-20", "2020-07-21", "2020-07-22", "2020-07-23", "2020-07-24", "2020-07-25", "2020-07-26"],
                    legend: .init(show: false),
                    plotOptions: .init(bar: .init(columnWidth: "50%", horizontal: nil)),
                    markers: nil
                ))
                .class("chart-lg")
            }))
        }
    }
    
    struct LocationsCard:Component {
        func body() async -> Plot.Component {
            await Card(body: .init({
                Card.Title("Locations")
                await DivC("ratio ratio-21x9") {
                    Div {
                        SVGMap(projection: .regular, visualizeData: .init(scale: [.custom("bg-surface"), .primary], values: MockData.MapRegionData))
                    }
                }
            }))
        }
    }
    
    struct StorageUseCard:Component {
        func body() async -> Plot.Component {
            await Card(body: .init({
                Paragraph {
                    Text("Using storage ")
                    Strong("6854.45 MB")
                    Text(" of 8 GB")
                }
                await DivC("progress progress-separated mb-3") {
                    //ProgressBar(progress: .init(progress: 44), color: .primary)
                    //ProgressBar(progress: .init(progress: 19), color: .azure)
                    //ProgressBar(progress: .init(progress: 9), color: .teal)
                    ProgressBit(amount: 44, color: .primary)
                    ProgressBit(amount: 19, color: .azure)
                    ProgressBit(amount: 9, color: .teal)
                }
                await Row {
                    StorageItem(label: "Regular", amount: "915MB", color: .primary)
                    StorageItem(label: "System", amount: "201MB", color: .azure)
                    StorageItem(label: "Shared", amount: "68MB", color: .teal)
                    StorageItem(label: "Free", amount: "6.98GB", color: .gray(.g500))
                }
            }))
        }
    }
    
    struct ProgressBit: Component {
        let amount:Int
        let color:Colors
        
        func body() async -> Plot.Component {
            await DivC("progress-bar") { }
                .class(color.backgroundCSS)
                .attribute(named: "role", value: "progressbar")
                .style("width: \(amount)%")
                .attribute(named: "aria-label", value: "\(amount)%")
        }
    }
    
    struct StorageItem: Component {
        let label:String
        let amount:String
        let color:Colors
        
        func body() async -> Plot.Component {
            await DivC("col-auto d-flex align-items-center pe-2") {
                Span { }.class("legend me-2").class(color.backgroundCSS)
                Span { Text(label) }
                Span { Text(amount) }.class("d-none d-md-inline d-lg-none d-xxl-inline ms-2 text-secondary")
            }
        }
    }
    
    struct ActivityCard:Component {
        func body() async -> Plot.Component {
            await Card(
                body: .init({
                    await DivC("divide-y") {
                        for (i, user) in MockData.Users.enumerated() {
                            Div {
                                await LabeledAvatar(
                                    avatar: .init(size: .md, user.avatar),
                                    title: MockData.randomActivity(username: user.name),
                                    subTitle: "\((i + 3) / 3) days ago",
                                    link: "#"
                                )
                            }
                        }
                    }
                }, class: "card-body-scrollable card-body-scrollable-shadow")
            )
            .style("height: 28rem")
        }
    }
    
    struct DevelopmentActivity:Component {
        func body() async -> Plot.Component {
            await Card(
                header: .init({
                    Card.Title("Development activity")
                }, class: "border-0"),
                body: .raw({
                    await DivC("position-absolute top-0 left-0 px-3 mt-1 w-75") {
                        await Row(g: 2) {
                            await DivC("col-auto") {
                                await DivC("chart-sparkline chart-sparkline-square") { }.id("sparkline-activity")
                            }
                            await Column {
                                Div { Text("Today's Earning: $4,262.40") }
                                Div {
                                    SVGIcon(icon: .trending_up, color: .green).class("icon-inline")
                                    Text("+5% more than yesterday")
                                }.textColor(.secondary)
                            }
                        }
                    }
                    DevelopmentActivityChart()
                }, class: "position-relative"),
                table: .init(style: .regular, editable: false, items: MockData.DevActivity.mockData)
            )
        }
    }
    
    struct DevelopmentActivityChart:Component {
        func body() async -> Plot.Component {
            Chart(options: .init(
                series: .labeled([.init(name: "Purchases", data: [3, 5, 4, 6, 7, 5, 6, 8, 24, 7, 12, 5, 6, 3, 8, 4, 14, 30, 17, 19, 15, 14, 25, 32, 40, 55, 60, 48, 52, 70])]),
                chart: .init(fontFamily: "inherit", height: 192, type: "area", zoom: nil, parentHeightOffset: nil, sparkline: .init(enabled: true), toolbar: nil, animations: .init(enabled: false), stacked: nil),
                dataLabels: .init(enabled: false),
                fill: .init(opacity: 0.16, type: "solid"),
                stroke: .init(width: 2, lineCap: "round", curve: "smooth"),
                title: nil,
                tooltip: .init(theme: "dark"),
                grid: .init(row: nil, strokeDashArray: 4, padding: nil, xaxis: nil),
                xaxis: .init(labels: .init(padding: 0), tooltip: .init(enabled: false), axisBorder: .init(show: false), categories: nil, type: "datetime"),
                yaxis: .init(labels: .init(padding: 4), max: nil, type: nil),
                colors: [Colors.primary.tagValue],
                labels: ["2020-06-20", "2020-06-21", "2020-06-22", "2020-06-23", "2020-06-24", "2020-06-25", "2020-06-26", "2020-06-27", "2020-06-28", "2020-06-29", "2020-06-30", "2020-07-01", "2020-07-02", "2020-07-03", "2020-07-04", "2020-07-05", "2020-07-06", "2020-07-07", "2020-07-08", "2020-07-09", "2020-07-10", "2020-07-11", "2020-07-12", "2020-07-13", "2020-07-14", "2020-07-15", "2020-07-16", "2020-07-17", "2020-07-18", "2020-07-19"],
                legend: .init(show: false),
                plotOptions: nil,
                markers: nil
            ))
            .style("margin:-8px -20px -16px -20px")
        }
    }
    
    struct SocialMediaTrafficWidget:Component {
        func body() async -> Plot.Component {
            await Card(
                size: .large(.num(4)),
                header: .init({
                    Card.Title("Social Media Traffic")
                }),
                body: nil,
                table: await .init(editable: false, items: MockData.SocialMediaTraffic.mockData)
            )
        }
    }
    
    struct TasksWidget:Component {
        func body() async -> Plot.Component {
            await Card(
                header: .init({
                    Card.Title("Tasks")
                }),
                body: .raw({
                    await DivC("table-responsive") {
                        Plot.Table {
                            for task in MockData.Tasks.items {
                                TaskCell(item: task)
                            }
                        }
                        .class("table card-table table-vcenter")
                    }
                })
            )
        }
    }
    
    struct TaskCell:Component {
        let item:MockData.Tasks.TaskItem
        
        func body() async -> Plot.Component {
            Plot.TableRow {
                Plot.TableCell {
                    await Plot.Form.Checkbox(style: .check, name: "", checked: item.done, required: false) {
                        EmptyComponent()
                    }.class("m-0 align-middle")
                }
                .class("w-1 pe-0")
                
                Plot.TableCell {
                    Link(url: "#") { Text(item.title) }
                        .class("text-reset")
                }
                .class("w-100")
                
                Plot.TableCell {
                    SVGIcon(icon: .calendar)
                        .margin(.trailing(2))
                    Text(item.dueDate)
                }
                .class("text-nowrap text-secondary")
                
                Plot.TableCell {
                    Link(url: "#") {
                        SVGIcon(icon: .check)
                            .margin(.trailing(2))
                        Text(item.subTasks)
                    }.class("text-secondary")
                }
                .class("text-nowrap")
                
                Plot.TableCell {
                    Link(url: "#") {
                        SVGIcon(icon: .message)
                            .margin(.trailing(2))
                        Text(item.messages)
                    }.class("text-secondary")
                }
                .class("text-nowrap")
                
                Plot.TableCell {
                    Avatar(size: .sm, item.avatar)
                }
            }
        }
    }
    
    struct InvoicesTableWidget:Component {
        func body() async -> Plot.Component {
            await Card(
                header: .init({
                    Card.Title("Invoices")
                }),
                body: .init({
                    await DivC("d-flex") {
                        await DivC("text-secondary") {
                            Text("Show")
                            await DivC("mx-2 d-inline-block") {
                                Plot.Input(type: .text)
                                    .class("form-control form-control-sm")
                                    .attribute(named: "value", value: "8")
                                    .attribute(named: "size", value: "3")
                                    .attribute(named: "aria-label", value: "Invoices count")
                            }
                            Text("entries")
                        }
                        await DivC("ms-auto text-secondary") {
                            Text("Search:")
                            await DivC("ms-2 d-inline-block") {
                                Plot.Input(type: .text)
                                    .class("form-control form-control-sm")
                                    .attribute(named: "aria-label", value: "Search invoices")
                            }
                        }
                    }
                }),
                table: Tables(style: .regular, editable: false, items: MockData.Invoices.mockData),
                footer: .init({
                    // Entries Currently Visible
                    Paragraph{
                        Text("Showing ")
                        await Span("1")
                        Text(" to ")
                        await Span("8")
                        Text(" of ")
                        await Span("16")
                        Text(" entries")
                    }.class("m-0 text-secondary")
                    
                    // Pagination
                    Pagination(textLabels: true, currentPage: 1, totalPages: 2)
                        .class("m-0 ms-auto")
                    
                }, class: "d-flex align-items-center")
            )
        }
    }
    
}



