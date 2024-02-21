import AsyncPlotTabler

/// Photogrid Demo Page
//struct PhotogridPage: Component {
//    
//    @EnvironmentValue(.dependencies) var deps
//    
//    func body() async -> Plot.Component {
//        deps.addJSSource("fslightbox.js")
//        
//        return await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(
//            header: .init(header: "Photogrid"),
//            content: {
//                await Container(size: .xl) {
//                    await Row(g: 2) {
//                        await Column(size: .large(.num(6))) {
//                            await Row(g: 2) {
//                                await Column(size: .full(.num(12))) {
//                                    Link(url: "./static/photos/group-of-people-brainstorming-and-taking-notes-2.jpg") {
//                                        await DivC("img-responsive img-responsive-3x1 rounded-3 border") { }
//                                            .style("background-image: url(./static/photos/group-of-people-brainstorming-and-taking-notes-2.jpg)")
//                                    }.attribute(named: "data-fslightbox", value: "gallery")
//                                }
//                                
//                                
//                                await Column(size: .full(.num(6))) {
//                                    Link(url: "./static/photos/blue-sofa-with-pillows-in-a-designer-living-room-interior.jpg") {
//                                        await DivC("img-responsive img-responsive-1x1 rounded-3 border") { }
//                                            .style("background-image: url(./static/photos/blue-sofa-with-pillows-in-a-designer-living-room-interior.jpg)")
//                                    }.attribute(named: "data-fslightbox", value: "gallery")
//                                }
//                                    
//                                await Column(size: .full(.num(6))) {
//                                    await Row(g: 2) {
//                                        await Column(size: .full(.num(6))) {
//                                            Link(url: "./static/photos/home-office-desk-with-macbook-iphone-calendar-watch-and-organizer.jpg") {
//                                                await DivC("img-responsive img-responsive-1x1 rounded-3 border") { }
//                                                    .style("background-image: url(./static/photos/home-office-desk-with-macbook-iphone-calendar-watch-and-organizer.jpg)")
//                                            }.attribute(named: "data-fslightbox", value: "gallery")
//                                        }
//                                        await Column(size: .full(.num(6))) {
//                                            Link(url: "./static/photos/young-woman-working-in-a-cafe.jpg") {
//                                                await DivC("img-responsive img-responsive-1x1 rounded-3 border") { }
//                                                    .style("background-image: url(./static/photos/young-woman-working-in-a-cafe.jpg)")
//                                            }.attribute(named: "data-fslightbox", value: "gallery")
//                                        }
//                                        await Column(size: .full(.num(6))) {
//                                            Link(url: "./static/photos/everything-you-need-to-work-from-your-bed.jpg") {
//                                                await DivC("img-responsive img-responsive-1x1 rounded-3 border") { }
//                                                    .style("background-image: url(./static/photos/everything-you-need-to-work-from-your-bed.jpg)")
//                                            }.attribute(named: "data-fslightbox", value: "gallery")
//                                        }
//                                        await Column(size: .full(.num(6))) {
//                                            Link(url: "./static/photos/young-entrepreneur-working-from-a-modern-cafe.jpg") {
//                                                await DivC("img-responsive img-responsive-1x1 rounded-3 border") { }
//                                                    .style("background-image: url(./static/photos/young-entrepreneur-working-from-a-modern-cafe.jpg)")
//                                            }.attribute(named: "data-fslightbox", value: "gallery")
//                                        }
//                                    }.class("g-md-3")
//                                }
//                                
//                                await Column(size: .full(.num(12))) {
//                                    Link(url: "./static/photos/finances-us-dollars-and-bitcoins-currency-money-3.jpg") {
//                                        await DivC("img-responsive img-responsive-4x1 rounded-3 border") { }
//                                            .style("background-image: url(./static/photos/finances-us-dollars-and-bitcoins-currency-money-3.jpg)")
//                                    }.attribute(named: "data-fslightbox", value: "gallery")
//                                }
//                            }.class("g-md-3")
//                        }
//                        
//                        await Column(size: .large(.num(6))) {
//                            await Row(g: 2) {
//                                await Column(size: .full(.num(6))) {
//                                    await Row(g: 2) {
//                                        await Column(size: .full(.num(6))) {
//                                            Link(url: "./static/photos/elegant-home-office-with-golden-accessories.jpg") {
//                                                await DivC("img-responsive img-responsive-1x1 rounded-3 border") { }
//                                                    .style("background-image: url(./static/photos/elegant-home-office-with-golden-accessories.jpg)")
//                                            }.attribute(named: "data-fslightbox", value: "gallery")
//                                        }
//                                        await Column(size: .full(.num(6))) {
//                                            Link(url: "./static/photos/stylish-workplace-with-computer-at-home.jpg") {
//                                                await DivC("img-responsive img-responsive-1x1 rounded-3 border") { }
//                                                    .style("background-image: url(./static/photos/stylish-workplace-with-computer-at-home.jpg)")
//                                            }.attribute(named: "data-fslightbox", value: "gallery")
//                                        }
//                                        
//                                        await Column(size: .full(.num(6))) {
//                                            Link(url: "./static/photos/group-of-people-sightseeing-in-the-city.jpg") {
//                                                await DivC("img-responsive img-responsive-1x1 rounded-3 border") { }
//                                                    .style("background-image: url(./static/photos/group-of-people-sightseeing-in-the-city.jpg)")
//                                            }.attribute(named: "data-fslightbox", value: "gallery")
//                                        }
//                                        await Column(size: .full(.num(6))) {
//                                            Link(url: "./static/photos/color-palette-guide-sample-colors-catalog-.jpg") {
//                                                await DivC("img-responsive img-responsive-1x1 rounded-3 border") { }
//                                                    .style("background-image: url(./static/photos/color-palette-guide-sample-colors-catalog-.jpg)")
//                                            }.attribute(named: "data-fslightbox", value: "gallery")
//                                        }
//                                    }.class("g-md-3")
//                                }
//                                
//                                await Column(size: .full(.num(6))) {
//                                    Link(url: "./static/photos/beautiful-blonde-woman-relaxing-with-a-can-of-coke-on-a-tree-stump-by-the-beach.jpg") {
//                                        await DivC("img-responsive img-responsive-1x1 rounded-3 border") { }
//                                            .style("background-image: url(./static/photos/beautiful-blonde-woman-relaxing-with-a-can-of-coke-on-a-tree-stump-by-the-beach.jpg)")
//                                    }.attribute(named: "data-fslightbox", value: "gallery")
//                                }
//                            
//                                await Column(size: .full(.num(12))) {
//                                    Link(url: "./static/photos/contemporary-black-and-white-home-decor.jpg") {
//                                        await DivC("img-responsive img-responsive-4x1 rounded-3 border") { }
//                                            .style("background-image: url(./static/photos/contemporary-black-and-white-home-decor.jpg)")
//                                    }.attribute(named: "data-fslightbox", value: "gallery")
//                                }
//                                
//                                await Column(size: .full(.num(12))) {
//                                    Link(url: "/static/photos/pink-desk-in-the-home-office.jpg") {
//                                        await DivC("img-responsive img-responsive-3x1 rounded-3 border") { }
//                                            .style("background-image: url(/static/photos/pink-desk-in-the-home-office.jpg)")
//                                    }.attribute(named: "data-fslightbox", value: "gallery")
//                                }
//                            }.class("g-md-3")
//                        }
//                    }
//                    .class("g-md-3")
//                }
//            })
//        )
//    }
//}
