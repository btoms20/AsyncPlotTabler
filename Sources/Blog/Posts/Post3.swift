import Foundation
import AsyncPlotTabler

extension Posts {
    
    static var post3 = BlogPost(
        id: "8598EA23-71D6-47C1-BB0A-B34459EBC20E",
        title: "Greenland & Norway!",
        subTitle: "Travel Blog - My journey though Greenland and Norway 🛩️",
        imageURL: "https://images.unsplash.com/photo-1677430435615-cd3733b1bd59?q=80&w=1632&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        imageDescription: "An abstract image by Steve Johnson",
        categories: [
            .init(title: "Travel 🌐", color: .indigo),
        ],
        published: "Feb 25th, 2024",
        readTime: "12 minute read",
        contents: .component( Posts.Post3Body() )
    )

    private struct Post3Body:Component {
        func body() async -> Component {
            await ComponentGroup {
                await CardHStack {
                    await Card(
                        size: .large(.num(6)),
                        body: .init({
                            Card.Title("Travel Plans Overview")
                                .margin(.body(3))
                            
                            Steps(style: .verticalCounter, color: .teal, activeIndex: 3, steps: [
                                await .init({
                                    Card.Title("USA to Greenland", subTitle: .below("Feb 28th, 2024"))
                                }),
                                await .init({
                                    Card.Title("Greenland to Norway", subTitle: .below("March 8th, 2024"))
                                }),
                                await .init({
                                    Card.Title("Norway to USA", subTitle: .below("March 28th, 2024"))
                                })
                            ])
                        })
                    )
                    
                    SVGMap(
                        projection: .regular,
                        markers: .init(
                            markerStyle: .init(initial: .init(fill: .teal), hover: .init(stroke: .teal, fill: .teal)),
                            markers: Post3Body.MapMarkerData
                        ),
                        lines: .init(lines: Post3Body.MapMarkerLines)
                    )
                }
                .margin(.body(3))
                
                Card.Title("Diary Entries", subTitle: .below("An entry for each place I visited!"))
                    .margin(.body(3))
                
                Post3Entries(isMobile: false)
                    .hidden(below: .md)
                
                Post3Entries(isMobile: true)
                    .hidden(above: .sm)
                
            }
        }
        
        static let MapMarkerData:[SVGMap.Marker] = [
            .init(coords: .init(lat: 37.0902, lon: -95.7129), name: "United States"),
            .init(coords: .init(lat: 71.7069, lon: -42.6043), name: "Greenland"),
            .init(coords: .init(lat: 60.472024, lon: 8.468946), name: "Norway"),
        ]
        
        static let MapMarkerLines:[SVGMap.Lines.Line] = [
            .init(from: "United States", to: "Greenland"),
            .init(from: "Greenland", to: "Norway"),
            .init(from: "Norway", to: "United States"),
        ]
    }
    
    private struct Post3Entries:Component {
        let isMobile:Bool
        
        func body() async -> Component {
            await ComponentGroup {
                await Card(
                    image: .init(src: MockData.Photos[2].src, size: .init(width: 0, height: 0), position: isMobile ? .top : .leading, description: "A picture of my journeys"),
                    body: .init({
                        Card.Title("First stop Greenland!")
                            .margin(.body(3))
                        Paragraph {
                            Text("A detailed description of my travels!")
                        }
                        Paragraph {
                            Text(loremIpsum() + loremIpsum() + loremIpsum())
                        }
                    })
                )
                .margin(.body(3))
                
                await Card(
                    image: .init(src: MockData.Photos[4].src, size: .init(width: 0, height: 0), position: isMobile ? .top : .trailing, description: "A picture of my journeys"),
                    body: .init({
                        Card.Title("Second stop Norway!")
                            .margin(.body(3))
                        Paragraph {
                            Text("A detailed description of my travels!")
                        }
                        Paragraph {
                            Text(loremIpsum() + loremIpsum() + loremIpsum())
                        }
                    })
                )
                .margin(.body(3))
                
                await Card(
                    image: .init(src: MockData.Photos[6].src, size: .init(width: 0, height: 0), position: isMobile ? .top : .leading, description: "A picture of my journeys"),
                    body: .init({
                        Card.Title("Some other cool thing!")
                            .margin(.body(3))
                        Paragraph {
                            Text("A detailed description of my travels!")
                        }
                        Paragraph {
                            Text(loremIpsum() + loremIpsum() + loremIpsum())
                        }
                    })
                )
            }
        }
    }
}

