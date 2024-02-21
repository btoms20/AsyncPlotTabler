//
//  Carousel.swift
//  PlotTabler
//

import Plot
import Foundation

public struct Carousel: Component {
    public enum Location {
        case bottom
        case side
        
        var css:String {
            switch self {
            case .bottom: ""
            case .side: " carousel-indicators-vertical"
            }
        }
    }
    
    public enum IndicatorStyle {
        case line
        case dot(Location)
        case thumbnail(Location)
        
        var css:String {
            switch self {
            case .line: return ""
            case .dot(let loc):
                return "carousel-indicators-dot\(loc.css)"
            case .thumbnail(let loc):
                return "carousel-indicators-thumb\(loc.css)"
            }
        }
    }
    
    public enum Style {
        case regular
        case indicators(IndicatorStyle)
        case controls
    }
    
    public struct Item {
        let src:URLRepresentable
        let label:String?
        let description:String?
        
        public init(src: URLRepresentable, label: String? = nil, description: String? = nil) {
            self.src = src
            self.label = label
            self.description = description
        }
    }
    
    let uuid:UUID
    let items:[Item]
    let style:Style
    let showCaptions:Bool
    
    public init(uuid:UUID = UUID(), style:Style = .regular, showCaptions:Bool = false, items: [Item]) {
        self.uuid = uuid
        self.items = items
        self.style = style
        self.showCaptions = showCaptions
    }
    
    /*
     <div id="carousel-default" class="carousel slide" data-bs-ride="carousel">
       <div class="carousel-inner">
         <div class="carousel-item active">
           <img class="d-block w-100" alt="" src="./static/photos/beautiful-blonde-woman-relaxing-with-a-can-of-coke-on-a-tree-stump-by-the-beach.jpg">
         </div>
         <div class="carousel-item">
           <img class="d-block w-100" alt="" src="./static/photos/brainstorming-session-with-creative-designers.jpg">
         </div>
         <div class="carousel-item">
           <img class="d-block w-100" alt="" src="./static/photos/finances-us-dollars-and-bitcoins-currency-money.jpg">
         </div>
         <div class="carousel-item">
           <img class="d-block w-100" alt="" src="./static/photos/group-of-people-brainstorming-and-taking-notes-2.jpg">
         </div>
         <div class="carousel-item">
           <img class="d-block w-100" alt="" src="./static/photos/blue-sofa-with-pillows-in-a-designer-living-room-interior.jpg">
         </div>
       </div>
     </div>
     */
    public func body() async -> Component {
        await DivC("carousel slide") {
            // Indicators
            await indicators()
            
            // Inner
            await DivC("carousel-inner") {
                for (i, item) in items.enumerated() {
                    await DivC("carousel-item") {
                        Plot.Image(item.src)
                        //Element(name: "img") {  }
                            .class("d-block w-100")
                            .attribute(named: "alt", value: item.description ?? "")
                            //.attribute(named: "src", value: "\(item.src)")
                        await caption(item: item)
                    }
                    .class(i == 0 ? "active" : "")
                }
            }
            
            // Control
            await controls()
        }
        .id("carousel-\(uuid.uuidString)")
        .attribute(named: "data-bs-ride", value: "carousel")
    }
    
    func indicators() async -> Component {
        switch style {
        case .regular, .controls:
            return EmptyComponent()
        case .indicators(let indicatorStyle):
            switch indicatorStyle {
            case .line, .dot:
                return await DivC("carousel-indicators") {
                    for (i, _) in items.enumerated() {
                        Plot.Button { }
                            .attribute(named: "type", value: "button")
                            .attribute(named: "data-bs-target", value: "#carousel-\(uuid.uuidString)")
                            .attribute(named: "data-bs-slide-to", value: "\(i)")
                            .class(i == 0 ? "active" : "")
                    }
                }
                .class(indicatorStyle.css)
            case .thumbnail:
                return await DivC("carousel-indicators carousel-indicators-thumb") {
                    for (i, item) in items.enumerated() {
                        Plot.Button { }
                            .attribute(named: "type", value: "button")
                            .attribute(named: "data-bs-target", value: "#carousel-\(uuid.uuidString)")
                            .attribute(named: "data-bs-slide-to", value: "\(i)")
                            .class("ratio ratio-4x3")
                            .class(i == 0 ? "active" : "")
                            .style("background-image: url(\(item.src)")
                    }
                }
                .class(indicatorStyle.css)
            }
        }
    }
    
    func controls() async -> Component {
        switch style {
        case .regular, .indicators:
            return EmptyComponent()
        case .controls:
            return await ComponentGroup {
                Link(url: "#carousel-\(uuid.uuidString)") {
                    Span { }
                        .class("carousel-control-prev-icon")
                        .attribute(named: "aria-hidden", value: "true")
                    Span { Text("Previous") }
                        .class("visually-hidden")
                }
                .attribute(named: "type", value: "button")
                .attribute(named: "data-bs-slide", value: "prev")
                .class("carousel-control-prev")
                
                Link(url: "#carousel-\(uuid.uuidString)") {
                    Span { }
                        .class("carousel-control-next-icon")
                        .attribute(named: "aria-hidden", value: "true")
                    Span { Text("Next") }
                        .class("visually-hidden")
                }
                .attribute(named: "type", value: "button")
                .attribute(named: "data-bs-slide", value: "next")
                .class("carousel-control-next")
            }
        }
    }
    
    /*
     <div class="carousel-caption-background d-none d-md-block"></div>
     <div class="carousel-caption d-none d-md-block">
       <h3>Slide label</h3>
       <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
     </div>
     */
    func caption(item:Item) async -> Component {
        guard showCaptions else { return EmptyComponent() }
        switch style {
        case .regular, .controls:
            return await ComponentGroup {
                await DivC("carousel-caption-background d-none d-md-block") { }
                await DivC("carousel-caption d-none d-md-block") {
                    H3 { Text(item.label ?? "No Label") }
                    Paragraph { Text(item.description ?? "No Description") }
                }
            }
        case .indicators:
            return EmptyComponent()
        }
    }
}
