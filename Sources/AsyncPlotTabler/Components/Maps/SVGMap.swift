//
//  SVGMap.swift
//  PlotTabler
//

import Plot
import Foundation

struct SVGMap:Component {
    @EnvironmentValue(.dependencies) var deps
    
    enum Projection {
        case regular
        case mercator
        
        var mapURL:String {
            switch self {
            case .regular: "/libs/jsvectormap/dist/maps/world.js"
            case .mercator: "/libs/jsvectormap/dist/maps/world-merc.js"
            }
        }
        
        var map:String {
            switch self {
            case .regular: "world"
            case .mercator: "world_merc"
            }
        }
    }
    
    struct RegionStyle:Codable {
        static let `default`:RegionStyle = .init(initial: .init(fill: .custom("body-bg"), stroke: .custom("border-color"), strokeWidth: 2), hover: nil)
        
        struct RegionStyleOptions:Codable {
            let fill:String
            let stroke:String
            let strokeWidth:Double
            
            init(fill: Colors, stroke: Colors, strokeWidth: Double) {
                self.fill = fill.tagValue
                self.stroke = stroke.tagValue
                self.strokeWidth = strokeWidth
            }
        }
        
        let initial:RegionStyleOptions
        let hover:RegionStyleOptions?
    }
    
    struct Marker:Codable {
        struct Coordinate:Codable {
            let lat:Double
            let lon:Double
        }
        
        init(coords: Coordinate, name: String) {
            self.coords = [coords.lat, coords.lon]
            self.name = name
        }
        
        let coords:[Double]
        let name:String
    }
    
    struct MarkerStyle:Codable {
        static let `default`:MarkerStyle = .init(
            initial: .init(r: 4, stroke: .white, opacity: 1, strokeWidth: 3, strokeOpacity: 0.5, fill: .red),
            hover: .init(r: 4, stroke: .red, opacity: 1, strokeWidth: 3, strokeOpacity: 0.5, fill: .red)
        )
        
        struct MarkerStyleOptions:Codable {
            let r:Int
            let stroke: String
            let opacity: Double
            let strokeWidth: Double
            let strokeOpacity: Double
            let fill: String
            
            init(r: Int = 4, stroke: Colors = .white, opacity: Double = 1, strokeWidth: Double = 3, strokeOpacity: Double = 0.5, fill: Colors = .red) {
                self.r = r
                self.stroke = stroke.tagValue
                self.opacity = opacity
                self.strokeWidth = strokeWidth
                self.strokeOpacity = strokeOpacity
                self.fill = fill.tagValue
            }
        }
        
        let initial:MarkerStyleOptions
        let hover:MarkerStyleOptions
    }
    
    struct MarkerLabelStyle:Codable {
        static let `default`:MarkerLabelStyle = .init(initial: .init(fontSize: 10))
        
        struct MarkerLabel:Codable {
            let fontSize:Int
        }
        
        let initial:MarkerLabel
    }
    
    struct Markers:Codable {
        let markerStyle:MarkerStyle
        let markerLabelStyle:MarkerLabelStyle
        let markers:[Marker]
        
        init(markerStyle: MarkerStyle = .default, markerLabelStyle: MarkerLabelStyle = .default, markers: [Marker]) {
            self.markerStyle = markerStyle
            self.markerLabelStyle = markerLabelStyle
            self.markers = markers
        }
    }
    
    struct VisualizeData:Codable {
        let scale:[String]
        let values: [String:Int]
        
        init(scale: [Colors], values: [String : Int]) {
            self.scale = scale.map { $0.tagValue }
            self.values = values
        }
    }
    
    struct Lines:Codable {
        struct Line:Codable {
            let from:String
            let to:String
        }
        
        struct LineStyle:Codable {
            static let `default` = LineStyle(strokeDasharray: "4 4", animation: true, stroke: "rgba(98, 105, 118, .75)", strokeWidth: 0.5)
            
            let strokeDasharray:String
            let animation:Bool
            let stroke:String
            let strokeWidth:Double
        }
        
        init(lineStyle: LineStyle = .default, lines: [Line]) {
            self.lineStyle = lineStyle
            self.lines = lines
        }
        
        let lineStyle:LineStyle
        let lines:[Line]
    }
    
    private struct MapOptions:Codable {
        let selector:String
        let map:String
        let backgroundColor:String
        let regionStyle: RegionStyle?
        let zoomOnScroll:Bool
        let zoomButtons:Bool
        let visualizeData:VisualizeData?
        let markers:[Marker]?
        let markerStyle:MarkerStyle?
        let markerLabelStyle:MarkerLabelStyle?
        let labels:String?
        let lines:[Lines.Line]?
        let lineStyle:Lines.LineStyle?
    }
    
    let uuid:UUID
    let projection:Projection
    let regionStyle:RegionStyle
    let markers:Markers?
    let visualizeData:VisualizeData?
    let lines:Lines?
    
    init(uuid: UUID = UUID(), projection:Projection = .regular, regionStyle:RegionStyle = .default, markers:Markers? = nil, visualizeData:VisualizeData? = nil, lines:Lines? = nil) {
        self.uuid = uuid
        self.projection = projection
        self.regionStyle = regionStyle
        self.markers = markers
        self.visualizeData = visualizeData
        self.lines = lines
    }
    
    func body() async -> Component {
        // Add the js lib
        deps.addJSSource("/libs/jsvectormap/dist/js/jsvectormap.min.js")
        // Add the maps URL
        deps.addJSSource(projection.mapURL)
        // Add the maps' config script
        deps.addRawScript(self.buildScript())
        
        return Div { }
            .id("map-\(uuid.uuidString)")
            .class("w-100 h-100")
    }
    
    func buildScript() -> String {
        let opts = SVGMap.MapOptions(
            selector: "#map-\(uuid.uuidString)",
            map: projection.map,
            backgroundColor: "transparent",
            regionStyle: self.regionStyle,
            zoomOnScroll: false,
            zoomButtons: false,
            visualizeData: self.visualizeData,
            markers: self.markers?.markers,
            markerStyle: self.markers?.markerStyle,
            markerLabelStyle: self.markers?.markerLabelStyle,
            labels: (self.markers == nil) ? nil : "{{{LABELS_TAG}}}",
            lines: self.lines?.lines,
            lineStyle: self.lines?.lineStyle
        )
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted]
        guard let mapOpts = try? encoder.encode(opts) else { return "" }
        guard let mapOptsString = String(data: mapOpts, encoding: .utf8) else { return "" }
        
        let script = """
          
        document.addEventListener("DOMContentLoaded", function() {
            const map = new jsVectorMap(\(mapOptsString));
            window.addEventListener("resize", () => {
                map.updateSize();
            });
        });

        """
        
        return replaceColorComponents( injectLabelDataIfNecessary(script) )
    }
    
    func injectLabelDataIfNecessary(_ str:String) -> String {
        let labelStr = """
        {
            markers: {
                render: function(marker) {
                    return marker.name
                },
            },
        }
        """
        
        let regex = #/"{{{LABELS_TAG}}}"/#
        
        let new = str.replacing(regex, with: { i in
            return labelStr
        })
        
        return new
    }
    
    func replaceColorComponents(_ str:String) -> String {
        let regex = #/"{{{([^\s]+)}}}"/#
        
        let new = str.replacing(regex, with: { i in
            //print(i)
            let match = i.output.1
            return "tabler.getColor(\"\(match)\")"
        })
        
        return new
    }
}
