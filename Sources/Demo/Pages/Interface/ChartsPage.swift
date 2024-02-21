import AsyncPlotTabler

struct ChartsPage: Component {
    
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(header: .init(header: "Charts"), content: {
            await CardVStack {
                await CardHStack {
                    await Card(
                        size: .large(.num(8)),
                        body: .init({
                            await DivC("d-flex") {
                                Card.Title("Active Users")
                                await DivC("ms-auto") {
                                    await Dropdown(label: "Last 7 days", items: [
                                        DropDownMenu_SingleItem(url: "#", content: { Text("Last 7 days") }),
                                        DropDownMenu_SingleItem(url: "#", content: { Text("Last 30 days") }),
                                        DropDownMenu_SingleItem(url: "#", content: { Text("Last 3 months") }),
                                    ])
                                }
                            }
                            
                            await Row {
                                await Column {
                                    Chart(options: Chart.multiLineChart(title: "", series: [
                                        .init(name: "Mobile", data: [
                                            4164, 4652, 4817, 4841, 4920, 5439, 5486, 5498, 5512, 5538, 5841, 5877, 6086, 6146, 6199, 6431, 6704, 7939, 8127, 8296, 8322, 8389, 8411, 8502, 8868, 8977, 9273, 9325, 9345, 9430
                                        ]),
                                        .init(name: "Desktop", data: [
                                            2164, 2292, 2386, 2430, 2528, 3045, 3255, 3295, 3481, 3604, 3688, 3840, 3932, 3949, 4003, 4298, 4424, 4869, 4922, 4973, 5155, 5267, 5566, 5689, 5692, 5758, 5773, 5799, 5960, 6000
                                        ]),
                                        .init(name: "Tablet", data: [
                                            1069, 1089, 1125, 1141, 1162, 1179, 1185, 1216, 1274, 1322, 1346, 1395, 1439, 1564, 1581, 1590, 1656, 1815, 1868, 2010, 2133, 2179, 2264, 2265, 2278, 2343, 2354, 2456, 2472, 2480
                                        ])
                                    ], xAxisLabels: [
                                        "2020-06-20", "2020-06-21", "2020-06-22", "2020-06-23", "2020-06-24", "2020-06-25", "2020-06-26", "2020-06-27", "2020-06-28", "2020-06-29", "2020-06-30", "2020-07-01", "2020-07-02", "2020-07-03", "2020-07-04", "2020-07-05", "2020-07-06", "2020-07-07", "2020-07-08", "2020-07-09", "2020-07-10", "2020-07-11", "2020-07-12", "2020-07-13", "2020-07-14", "2020-07-15", "2020-07-16", "2020-07-17", "2020-07-18", "2020-07-19"
                                    ], colors: [.azure, .purple, .red], height: 288))
                                }
                                await DivC("col-md-auto") {
                                    await DivC("divide-y divide-y-fill") {
                                        for item in [("Mobile", "11,425", Colors.azure), ("Desktop", "6,485", Colors.purple), ("Tablet", "3,985", Colors.red)] {
                                            await DivC("px-3") {
                                                Div {
                                                    Span { }.class("status-dot").class(item.2.backgroundCSS)
                                                        .margin(.trailing(2))
                                                    Text(item.0)
                                                }.textColor(.secondary)
                                                H2 { Text(item.1) }
                                            }
                                        }
                                    }
                                }
                            }
                        })
                    )
                }
                
                await Card(
                    body: .init({
                        await DivC("d-flex") {
                            Card.Title("Sprint Results")
                            await DivC("ms-auto") {
                                await Dropdown(label: "Last 7 days", items: [
                                    DropDownMenu_SingleItem(url: "#", content: { Text("Last 7 days") }),
                                    DropDownMenu_SingleItem(url: "#", content: { Text("Last 30 days") }),
                                    DropDownMenu_SingleItem(url: "#", content: { Text("Last 3 months") }),
                                ])
                            }
                        }
                        Chart(options: Chart.multiLineChart(title: "", series: [
                            .init(name: "Facebook", data: [
                                13281, 8521, 15038, 9983, 15417, 8888, 7052, 14270, 5214, 9587, 5950, 16852, 17836, 12217, 17406, 12262, 9147, 14961, 18292, 15230, 13435, 10649, 5140, 13680, 4508, 13271, 13413, 5543, 18727, 18238, 18175, 6246, 5864, 17847, 9170, 6445, 12945, 8142, 8980, 10422, 15535, 11569, 10114, 17621, 16138, 13046, 6652, 9906, 14100, 16495, 6749
                            ]),
                            .init(name: "Twitter", data: [
                                3680, 1862, 3070, 2252, 5348, 3091, 3000, 3984, 5176, 5325, 2420, 5474, 3098, 1893, 3748, 2879, 4197, 5186, 4213, 4334, 2807, 1594, 4863, 2030, 3752, 4856, 5341, 3954, 3461, 3097, 3404, 4949, 2283, 3227, 3630, 2360, 3477, 4675, 1901, 2252, 3347, 2954, 5029, 2079, 2830, 3292, 4578, 3401, 4104, 3749, 4457, 3734
                            ]),
                            .init(name: "Dribbble", data: [
                                722, 1866, 961, 1108, 1110, 561, 1753, 1815, 1985, 776, 859, 547, 1488, 766, 702, 621, 1599, 1372, 1620, 963, 759, 764, 739, 789, 1696, 1454, 1842, 734, 551, 1689, 1924, 1875, 908, 1675, 1541, 1953, 534, 502, 1524, 1867, 719, 1472, 1608, 1025, 889, 1150, 654, 1695, 1662, 1285, 1787
                            ])
                        ], xAxisLabels: [
                            "2020-06-20", "2020-06-21", "2020-06-22", "2020-06-23", "2020-06-24", "2020-06-25", "2020-06-26", "2020-06-27", "2020-06-28", "2020-06-29", "2020-06-30", "2020-07-01", "2020-07-02", "2020-07-03", "2020-07-04", "2020-07-05", "2020-07-06", "2020-07-07", "2020-07-08", "2020-07-09", "2020-07-10", "2020-07-11", "2020-07-12", "2020-07-13", "2020-07-14", "2020-07-15", "2020-07-16", "2020-07-17", "2020-07-18", "2020-07-19", "2020-07-20", "2020-07-21", "2020-07-22", "2020-07-23", "2020-07-24", "2020-07-25", "2020-07-26", "2020-07-27", "2020-07-28", "2020-07-29", "2020-07-30", "2020-07-31", "2020-08-01", "2020-08-02", "2020-08-03", "2020-08-04", "2020-08-05", "2020-08-06", "2020-08-07", "2020-08-08", "2020-08-09"
                        ], colors: [.blue, .azure, .pink], height: 288, legend: .init(show: true)))
                    })
                )
                
                await Card(
                    body: .init({
                        await DivC("d-flex") {
                            Card.Title("Social Referrals")
                            await DivC("ms-auto") {
                                await Dropdown(label: "Last 7 days", items: [
                                    DropDownMenu_SingleItem(url: "#", content: { Text("Last 7 days") }),
                                    DropDownMenu_SingleItem(url: "#", content: { Text("Last 30 days") }),
                                    DropDownMenu_SingleItem(url: "#", content: { Text("Last 3 months") }),
                                ])
                            }
                        }
                        Chart(options: Chart.basicBarChart(title: "", series: [
                            .init(name: "Spints", data: [
                                44, 32, 48, 72, 60, 16, 44, 32, 78, 50, 68, 34, 26, 48, 72, 60, 84, 64, 74, 52, 62, 50, 32, 22
                            ])
                        ], xAxisLabels: (1...24).map { "Sprint \($0)" }, colors: [.primary], height: 288))
                    })
                )
                
                await CardHStack {

                    await Card(body: .init({
                        Chart(options: Chart.basicPieChart(title: "", series: [44, 55, 12, 2], labels: ["Direct", "Affilliate", "E-mail", "Other"], colors: [.purple, .primary, .blue, .azure], height: 278))
                    }))
                    
                    await Card(body: .init({
                        Chart(options: Chart.basicBarChart(title: "", series: [
                            .init(name: "Tasks Completed", data: [
                                155, 65, 465, 265, 225, 325, 80
                            ])
                        ], xAxisLabels: ["2020-06-20", "2020-06-21", "2020-06-22", "2020-06-23", "2020-06-24", "2020-06-25", "2020-06-26"], colors: [.primary], height: 240))
                    }))
                    
                    await Card(body: .init({
                        Chart(options: Chart.basicLineChart(lineStyle: .smooth, fillStyle: .noFill, title: "", series: [
                            .init(name: "Tasks Completed", data: [
                                155, 65, 465, 265, 225, 325, 80
                            ])
                        ], xAxisLabels: ["2020-06-20", "2020-06-21", "2020-06-22", "2020-06-23", "2020-06-24", "2020-06-25", "2020-06-26"], color: .primary, height: 240))
                    }))
                    
                }
                
                await CardHStack {

                    await Card(body: .init({
                        Chart(options: Chart.basicLineChart(lineStyle: .smooth, fillStyle: .fill(0.16), title: "", series: [
                            .init(name: "Tasks Completed", data: [
                                155, 65, 465, 265, 225, 325, 80
                            ])
                        ], xAxisLabels: ["2020-06-20", "2020-06-21", "2020-06-22", "2020-06-23", "2020-06-24", "2020-06-25", "2020-06-26"], color: .primary, height: 240))
                    }))
                    
                    await Card(body: .init({
                        Chart(options: Chart.basicLineChart(lineStyle: .straight, fillStyle: .noFill, title: "", series: [
                            .init(name: "Tasks Completed", data: [
                                155, 65, 465, 265, 225, 325, 80
                            ])
                        ], xAxisLabels: ["2020-06-20", "2020-06-21", "2020-06-22", "2020-06-23", "2020-06-24", "2020-06-25", "2020-06-26"], color: .primary, height: 240))
                    }))
                    
                    await Card(body: .init({
                        Chart(options: Chart.basicLineChart(lineStyle: .stepline, fillStyle: .noFill, title: "", series: [
                            .init(name: "Tasks Completed", data: [
                                155, 65, 465, 265, 225, 325, 80
                            ])
                        ], xAxisLabels: ["2020-06-20", "2020-06-21", "2020-06-22", "2020-06-23", "2020-06-24", "2020-06-25", "2020-06-26"], color: .primary, height: 240))
                    }))
                    
                }
                
                await CardHStack {

                    await Card(body: .init({
                        Chart(options: Chart.basicBarChart(horizontal: true, title: "", series: [
                            .init(name: "Tasks Completed", data: [
                                155, 65, 465, 265, 225, 325, 80
                            ])
                        ], xAxisLabels: ["2020-06-20", "2020-06-21", "2020-06-22", "2020-06-23", "2020-06-24", "2020-06-25", "2020-06-26"], colors: [.primary], height: 240))
                    }))
                    
                    await Card(body: .init({
                        Chart(options: Chart.basicLineChart(lineStyle: .straight, fillStyle: .fill(0.16), title: "", series: [
                            .init(name: "Tasks Completed", data: [
                                155, 65, 465, 265, 225, 325, 80
                            ])
                        ], xAxisLabels: ["2020-06-20", "2020-06-21", "2020-06-22", "2020-06-23", "2020-06-24", "2020-06-25", "2020-06-26"], color: .primary, height: 240))
                    }))
                    
                    await Card(body: .init({
                        Chart(options: Chart.basicBarChart(title: "", series: [
                            .init(name: "Tasks Completed - A", data: [
                                155, 65, 465, 265, 225, 325, 80
                            ]),
                            .init(name: "Tasks Completed - B", data: [
                                113, 42, 65, 54, 76, 65, 35
                            ])
                        ], xAxisLabels: ["2020-06-20", "2020-06-21", "2020-06-22", "2020-06-23", "2020-06-24", "2020-06-25", "2020-06-26"], colors: [.primary, .red], height: 240))
                    }))
                    
                }
                
                await CardHStack {

                    await Card(body: .init({
                        Chart(options: Chart.basicBarChart(stacked: true, title: "", series: [
                            .init(name: "Tasks Completed - A", data: [
                                155, 65, 465, 265, 225, 325, 80
                            ]),
                            .init(name: "Tasks Completed - B", data: [
                                113, 42, 65, 54, 76, 65, 35
                            ])
                        ], xAxisLabels: ["2020-06-20", "2020-06-21", "2020-06-22", "2020-06-23", "2020-06-24", "2020-06-25", "2020-06-26"], colors: [.primary, .red], height: 240))
                    }))
                    
                    await Card(body: .init({
                        Chart(options: Chart.multiLineChart(fillStyle: .fill(0.16), title: "", series: [
                            .init(name: "Tasks Completed - A", data: [
                                155, 65, 465, 265, 225, 325, 80
                            ]),
                            .init(name: "Tasks Completed - B", data: [
                                113, 42, 65, 54, 76, 65, 35
                            ])
                        ], xAxisLabels: ["2020-06-20", "2020-06-21", "2020-06-22", "2020-06-23", "2020-06-24", "2020-06-25", "2020-06-26"], colors: [.primary, .red], height: 240))
                    }))
                    
                    await Card(body: .init({
                        Chart(options: Chart.multiLineChart(fillStyle: .fill(0.16), stacked: true, title: "", series: [
                            .init(name: "Tasks Completed - A", data: [
                                155, 65, 465, 265, 225, 325, 80
                            ]),
                            .init(name: "Tasks Completed - B", data: [
                                113, 42, 65, 54, 76, 65, 35
                            ])
                        ], xAxisLabels: ["2020-06-20", "2020-06-21", "2020-06-22", "2020-06-23", "2020-06-24", "2020-06-25", "2020-06-26"], colors: [.primary, .red], height: 240))
                    }))
                    
                }
                
                await CardHStack {

                    await Card(body: .init({
                        Chart(options: Chart.multiLineChart(lineStyle: .smooth, title: "", series: [
                            .init(name: "New", data: [
                                0, 0, 1, 2, 21, 9, 12, 10, 31, 13, 65, 10, 12, 6, 4, 3, 0
                            ]),
                            .init(name: "Completed", data: [
                                0, 0, 1, 2, 7, 5, 6, 8, 24, 7, 12, 5, 6, 3, 2, 2, 0
                            ]),
                            .init(name: "Closed", data: [
                                0, 0, 1, 0, 2, 0, 1, 0, 2, 3, 0, 2, 3, 2, 1, 0, 0
                            ])
                        ], xAxisLabels: ["M", "T", "W", "T", "F", "S", "S", "M", "T", "W", "T", "F", "S", "S", "M", "T", "W"], datetimeLabels: false, colors: [.primary, .lime, .orange], height: 240))
                    }))
                    
                    await Card(body: .init({
                        Chart(options: Chart.multiLineChart(lineStyle: .straight, fillStyle: .noFill, title: "", series: [
                            .init(name: "Development", data: [
                                8, 10, 11, 12, 20, 27, 30
                            ]),
                            .init(name: "Marketing", data: [
                                3, 16, 17, 19, 20, 30, 30
                            ]),
                            .init(name: "Sales", data: [
                                7, 10, 11, 18, 18, 18, 24
                            ])
                        ], xAxisLabels: (2013...2019).map { "\($0)" }, colors: [.orange, .primary, .green], height: 240))
                    }))
                    
                    await Card(body: .init({
                        Chart(options: Chart.basicLineChart(lineStyle: .stepline, fillStyle: .noFill, title: "", series: [
                            .init(name: "Development", data: [
                                34, 44, 54, 21, 12, 43, 33, 23, 66, 66, 58
                            ])
                        ], datetimeLabels: false, color: .orange, height: 240))
                    }))
                    
                }
                
                await CardHStack {

                    await Card(body: .init({
                        Chart(options: Chart.multiLineChart(lineStyle: .smooth, title: "", series: [
                            .init(name: "Tokyo", data: [
                                7.0, 6.9, 9.5, 14.5, 18.4, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6
                            ]),
                            .init(name: "London", data: [
                                3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8
                            ])
                        ], xAxisLabels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"], datetimeLabels: false, colors: [.primary, .lime], height: 240, markers: .init(size: 2), dataLabelsEnabled: true))
                    }))
                    
                    await Card(body: .init({
                        Chart(options: Chart.multiLineChart(lineStyle: .smooth, fillStyle: .fill(0.16), title: "", series: [
                            .init(name: "Maximum", data: [
                                11, 8, 15, 18, 19, 17
                            ]),
                            .init(name: "Minimum", data: [
                                7, 7, 5, 7, 9, 12
                            ])
                        ], xAxisLabels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun"], datetimeLabels: false, colors: [.primary, .pink], height: 240))
                    }))
                    
                    await Card(body: .init({
                        Chart(options: Chart.multiLineChart(lineStyle: .smooth, fillStyle: .fill(0.16), stacked: true, title: "", series: [
                            .init(name: "Maximum", data: [
                                11, 8, 15, 18, 19, 17
                            ]),
                            .init(name: "Minimum", data: [
                                7, 7, 5, 7, 9, 12
                            ])
                        ], xAxisLabels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun"], datetimeLabels: false, colors: [.primary, .pink], height: 240))
                    }))
                    
                }
                
                await CardHStack {

                    await Card(body: .init({
                        Chart(options: Chart.multiLineChart(lineStyle: .scatter, title: "", series: [
                            .init(name: "Tokyo", data: [
                                7.0, 6.9, 9.5, 14.5, 18.4, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6
                            ]),
                            .init(name: "London", data: [
                                3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8
                            ])
                        ], xAxisLabels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"], datetimeLabels: false, colors: [.primary, .lime], height: 240))
                    }))
                    
                    await Card(body: .init({
                        Chart(options: Chart.basicBarChart(title: "", series: [
                            .init(name: "Development", data: [
                                30, 20, 50, 40, 60, 50
                            ]),
                            .init(name: "Marketing", data: [
                                200, 130, 90, 240, 130, 220
                            ]),
                            .init(name: "Sales", data: [
                                300, 200, 160, 400, 250, 250
                            ]),
                            .init(name: "Ideas", data: [
                                180, 140, 40, 140, 230, 200
                            ])
                        ], xAxisLabels: (2013...2018).map { "\($0)" }, colors: [.green, .pink, .yellow, .orange], height: 240))
                    }))
                    
                }
            }
        }))
    }
}
