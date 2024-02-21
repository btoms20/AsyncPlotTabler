import AsyncPlotTabler
import Foundation

/// UptimeMonitor Demo Page
struct UptimeMonitorPage: Component {
    
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(
            header: .init(header: {
                await Row(g: 3, alignItemsCenter: true) {
                    await Column {
                        Span {
                            Span { }.class("status-indicator-circle")
                            Span { }.class("status-indicator-circle")
                            Span { }.class("status-indicator-circle")
                        }.class("status-indicator status-green status-indicator-animated")
                    }.class("col-auto")
                    await Column {
                        H2 { Text("tabler.io") }.class("page-title")
                        await DivC("mt-1") {
                            await Element(name: "ul") {
                                await Element(name: "li") {
                                    Span { Text("Up") }.textColor(.green)
                                }.class("list-inline-item")
                                await Element(name: "li") {
                                    Text("Checked every 3 minutes")
                                }.class("list-inline-item")
                            }
                            .class("list-inline list-inline-dots")
                        }.textColor(.secondary)
                    }
                }
            }, actions: {
                ButtonLink("Configure", link: "#", icon: .settings, theme: .light)
                    .margin(.trailing(3))
                ButtonLink("Pause this monitor", link: "#", icon: .player_pause, theme: .primary)
            }),
            content: {
                await CardVStack {
                    await CardHStack {
                        await Card(body: .init({
                            await DivC("subheader") { Text("Currently up for") }
                                .margin(.body(2))
                            await DivC("h3 m-0") { Text("14 days 2 hours 54 mins 34 seconds") }
                        }))
                        
                        await Card(body: .init({
                            await DivC("subheader") { Text("Last checked at") }
                                .margin(.body(2))
                            await DivC("h3 m-0") { Text("27 seconds ago") }
                        }))
                        
                        await Card(body: .init({
                            await DivC("subheader") { Text("Incidents (last 24 hours)") }
                                .margin(.body(2))
                            Tracking(blocks: [
                                .init(color: .green, title: "Operational"),
                                .init(color: .green, title: "Operational"),
                                .init(color: .green, title: "Operational"),
                                .init(color: .green, title: "Operational"),
                                .init(color: .green, title: "Operational"),
                                .init(color: .green, title: "Operational"),
                                .init(color: .gray(.g300), title: "No data"),
                                .init(color: .gray(.g300), title: "No data"),
                                .init(color: .gray(.g300), title: "No data"),
                                .init(color: .red, title: "Server down"),
                                .init(color: .red, title: "Server down"),
                                .init(color: .red, title: "Server down"),
                                .init(color: .red, title: "Server down"),
                                .init(color: .red, title: "Server down"),
                                .init(color: .orange, title: "High latency"),
                                .init(color: .orange, title: "High latency"),
                                .init(color: .orange, title: "High latency"),
                                .init(color: .orange, title: "High latency"),
                                .init(color: .orange, title: "High latency"),
                                .init(color: .green, title: "Operational"),
                                .init(color: .green, title: "Operational"),
                                .init(color: .green, title: "Operational"),
                                .init(color: .green, title: "Operational"),
                                .init(color: .green, title: "Operational"),
                            ])
                        }))
                    }
                    
                    await CardHStack {
                        await Card(
                            size: .large(.num(8)),
                            body: .init({
                                Card.Title("Response times across regions in the last day")
                                Chart(options: Chart.basicLineChart(
                                    title: "",
                                    series: [.init(name: "Uptime", data: [150, 160, 170, 161, 167, 162, 161, 152, 141, 144, 154, 166, 176, 187, 198, 210, 196, 207, 200, 187, 192, 204, 193, 204, 208, 196, 193, 178, 191, 204, 218, 211, 218, 216, 201, 197, 190, 179, 172, 158, 159, 147, 152, 152, 144, 137, 136, 123, 112, 99, 100, 95, 105, 116, 125, 124, 133, 129, 116, 119, 109, 114, 115, 111, 96, 104, 104, 102, 116, 126, 117, 130, 124, 126, 131, 143, 130, 116, 118, 122, 132, 126, 136, 123, 112, 116, 113, 113, 109, 99, 100, 95, 83, 79, 64, 79, 81, 94, 99, 97, 83, 71, 75, 69, 71, 75, 84, 90, 100, 96, 108, 102, 116, 112, 112, 102, 115, 120, 118, 118
                                    ])
                                    ], 
                                    xAxisLabels: ["2020-06-20", "2020-06-21", "2020-06-22", "2020-06-23", "2020-06-24", "2020-06-25", "2020-06-26", "2020-06-27", "2020-06-28", "2020-06-29", "2020-06-30", "2020-07-01", "2020-07-02", "2020-07-03", "2020-07-04", "2020-07-05", "2020-07-06", "2020-07-07", "2020-07-08", "2020-07-09", "2020-07-10", "2020-07-11", "2020-07-12", "2020-07-13", "2020-07-14", "2020-07-15", "2020-07-16", "2020-07-17", "2020-07-18", "2020-07-19", "2020-07-20", "2020-07-21", "2020-07-22", "2020-07-23", "2020-07-24", "2020-07-25", "2020-07-26", "2020-07-27", "2020-07-28", "2020-07-29", "2020-07-30", "2020-07-31", "2020-08-01", "2020-08-02", "2020-08-03", "2020-08-04", "2020-08-05", "2020-08-06", "2020-08-07", "2020-08-08", "2020-08-09", "2020-08-10", "2020-08-11", "2020-08-12", "2020-08-13", "2020-08-14", "2020-08-15", "2020-08-16", "2020-08-17", "2020-08-18", "2020-08-19", "2020-08-20", "2020-08-21", "2020-08-22", "2020-08-23", "2020-08-24", "2020-08-25", "2020-08-26", "2020-08-27", "2020-08-28", "2020-08-29", "2020-08-30", "2020-08-31", "2020-09-01", "2020-09-02", "2020-09-03", "2020-09-04", "2020-09-05", "2020-09-06", "2020-09-07", "2020-09-08", "2020-09-09", "2020-09-10", "2020-09-11", "2020-09-12", "2020-09-13", "2020-09-14", "2020-09-15", "2020-09-16", "2020-09-17", "2020-09-18", "2020-09-19", "2020-09-20", "2020-09-21", "2020-09-22", "2020-09-23", "2020-09-24", "2020-09-25", "2020-09-26", "2020-09-27", "2020-09-28", "2020-09-29", "2020-09-30", "2020-10-01", "2020-10-02", "2020-10-03", "2020-10-04", "2020-10-05", "2020-10-06", "2020-10-07", "2020-10-08", "2020-10-09", "2020-10-10", "2020-10-11", "2020-10-12", "2020-10-13", "2020-10-14", "2020-10-15", "2020-10-16", "2020-10-17"
                                    ],
                                    color: .primary
                                    )
                                )
                            })
                        )
                        
                        await Card(body: .init({
                            Card.Title("Uptime incidents per day")
                            Chart(options: Chart.basicBarChart(
                                title: "",
                                series: [
                                    .init(name: "Uptime incidents", data: [1, 2, 6, 3, 1, 1, 2, 5, 2, 5, 6, 2, 4, 3, 4, 5, 4, 3, 2, 1, 2, 0, 2, 1, 1])
                                ],
                                xAxisLabels: ["2020-06-20", "2020-06-21", "2020-06-22", "2020-06-23", "2020-06-24", "2020-06-25", "2020-06-26", "2020-06-27", "2020-06-28", "2020-06-29", "2020-06-30", "2020-07-01", "2020-07-02", "2020-07-03", "2020-07-04", "2020-07-05", "2020-07-06", "2020-07-07", "2020-07-08", "2020-07-09", "2020-07-10", "2020-07-11", "2020-07-12", "2020-07-13", "2020-07-14"
                                ],
                                colors: [.primary],
                                maxYValue: 16
                                )
                            )
                        }))
                    }
                    
                    await CardTable(
                        table: Tables(style: .regular, editable: false, items: MockData.UptimeData)
                    )
                }
            })
        )
    }
}

/*
 

 document.addEventListener("DOMContentLoaded", function () {
     window.ApexCharts && (new ApexCharts(document.getElementById('chart-4419DB1D-C510-4659-A291-DF764872BDEF'),{
   "tooltip" : {
     "theme" : "dark"
   },
   "fill" : {
     "opacity" : 1
   },
   "labels" : [
     "2020-06-20",
     "2020-06-21",
     "2020-06-22",
     "2020-06-23",
     "2020-06-24",
     "2020-06-25",
     "2020-06-26",
     "2020-06-27",
     "2020-06-28",
     "2020-06-29",
     "2020-06-30",
     "2020-07-01",
     "2020-07-02",
     "2020-07-03",
     "2020-07-04",
     "2020-07-05",
     "2020-07-06",
     "2020-07-07",
     "2020-07-08",
     "2020-07-09",
     "2020-07-10",
     "2020-07-11",
     "2020-07-12",
     "2020-07-13",
     "2020-07-14",
     "2020-07-15",
     "2020-07-16",
     "2020-07-17",
     "2020-07-18",
     "2020-07-19"
   ],
   "series" : [
     {
       "name" : "Mobile",
       "data" : [
         4164,
         4652,
         4817,
         4841,
         4920,
         5439,
         5486,
         5498,
         5512,
         5538,
         5841,
         5877,
         6086,
         6146,
         6199,
         6431,
         6704,
         7939,
         8127,
         8296,
         8322,
         8389,
         8411,
         8502,
         8868,
         8977,
         9273,
         9325,
         9345,
         9430
       ],
       "color" : {
         "azure" : {

         }
       }
     },
     {
       "data" : [
         2164,
         2292,
         2386,
         2430,
         2528,
         3045,
         3255,
         3295,
         3481,
         3604,
         3688,
         3840,
         3932,
         3949,
         4003,
         4298,
         4424,
         4869,
         4922,
         4973,
         5155,
         5267,
         5566,
         5689,
         5692,
         5758,
         5773,
         5799,
         5960,
         6000
       ],
       "name" : "Desktop",
       "color" : {
         "purple" : {

         }
       }
     },
     {
       "color" : {
         "red" : {

         }
       },
       "name" : "Tablet",
       "data" : [
         1069,
         1089,
         1125,
         1141,
         1162,
         1179,
         1185,
         1216,
         1274,
         1322,
         1346,
         1395,
         1439,
         1564,
         1581,
         1590,
         1656,
         1815,
         1868,
         2010,
         2133,
         2179,
         2264,
         2265,
         2278,
         2343,
         2354,
         2456,
         2472,
         2480
       ]
     }
   ],
   "legend" : {
     "show" : false
   },
   "stroke" : {
     "curve" : "smooth",
     "lineCap" : "round",
     "width" : 2
   },
   "yaxis" : {
     "labels" : {
       "padding" : 4
     }
   },
   "colors" : [
     tabler.getColor("azure"),
     tabler.getColor("purple"),
     tabler.getColor("red")
   ],
   "chart" : {
     "height" : 288,
     "zoom" : {
       "enabled" : false
     },
     "toolbar" : {
       "show" : false
     },
     "animations" : {
       "enabled" : true
     },
     "type" : "line",
     "parentHeightOffset" : 0,
     "fontFamily" : "inherit"
   },
   "dataLabels" : {
     "enabled" : false
   },
   "grid" : {
     "strokeDashArray" : 4,
     "padding" : {
       "right" : 0,
       "left" : -4,
       "bottom" : -4,
       "top" : -20
     }
   },
   "xaxis" : {
     "labels" : {
       "padding" : 0
     },
     "type" : "datetime"
   }
 })).render();
 });


 */
