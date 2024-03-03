//
//  SVGMap.swift
//  PlotTabler
//

import Plot
import Foundation

public struct SVGMap:Component {
    @EnvironmentValue(.dependencies) var deps
    
    public enum Projection {
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
    
    public struct RegionStyle:Codable {
        public static let `default`:RegionStyle = .init(initial: .init(fill: .custom("body-bg"), stroke: .secondary, strokeWidth: 1.0), hover: nil)
        
        public struct RegionStyleOptions:Codable {
            let fill:String
            let stroke:String
            let strokeWidth:Double
            
            public init(fill: Colors, stroke: Colors, strokeWidth: Double) {
                self.fill = fill.tagValue
                self.stroke = stroke.tagValue
                self.strokeWidth = strokeWidth
            }
        }
        
        let initial:RegionStyleOptions
        let hover:RegionStyleOptions?
        
        public init(initial: RegionStyleOptions, hover: RegionStyleOptions?) {
            self.initial = initial
            self.hover = hover
        }
    }
    
    public struct Marker:Codable {
        public struct Coordinate:Codable {
            let lat:Double
            let lon:Double
            
            public init(lat: Double, lon: Double) {
                self.lat = lat
                self.lon = lon
            }
        }
       
        let coords:[Double]
        let name:String
        
        public init(coords: Coordinate, name: String) {
            self.coords = [coords.lat, coords.lon]
            self.name = name
        }
        
        public init(coords:[Double], name:String) {
            self.coords = coords
            self.name = name
        }
    }
    
    public struct MarkerStyle:Codable {
        public static let `default`:MarkerStyle = .init(
            initial: .init(r: 4, stroke: .white, opacity: 1, strokeWidth: 3, strokeOpacity: 0.5, fill: .red),
            hover: .init(r: 4, stroke: .red, opacity: 1, strokeWidth: 3, strokeOpacity: 0.5, fill: .red)
        )
        
        public struct MarkerStyleOptions:Codable {
            let r:Int
            let stroke: String
            let opacity: Double
            let strokeWidth: Double
            let strokeOpacity: Double
            let fill: String
            
            public init(r: Int = 4, stroke: Colors = .white, opacity: Double = 1, strokeWidth: Double = 3, strokeOpacity: Double = 0.5, fill: Colors = .red) {
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
        
        public init(initial: MarkerStyleOptions, hover: MarkerStyleOptions) {
            self.initial = initial
            self.hover = hover
        }
    }
    
    public struct MarkerLabelStyle:Codable {
        public static let `default`:MarkerLabelStyle = .init(initial: .init(fontSize: 12, fontWeight: .bold, fill: Colors.body))
        
        public struct MarkerLabel:Codable {
            /// Int fontSize (default: 12)
            let fontSize:Int
            /// Int fontWeight (default: 500)
            let fontWeight:Int
            /// Text Color
            let fill:String
            
            public init(fontSize: Int = 12, fontWeight:FontWeight = .bold, fill:Colors = .body) {
                self.fontSize = fontSize
                self.fontWeight = fontWeight.intValue
                self.fill = fill.tagValue
            }
        }
        
        let initial:MarkerLabel
        
        public init(initial: MarkerLabel) {
            self.initial = initial
        }
    }
    
    public struct Markers:Codable {
        let markerStyle:MarkerStyle
        let markerLabelStyle:MarkerLabelStyle
        let markers:[Marker]
        
        public init(markerStyle: MarkerStyle = .default, markerLabelStyle: MarkerLabelStyle = .default, markers: [Marker]) {
            self.markerStyle = markerStyle
            self.markerLabelStyle = markerLabelStyle
            self.markers = markers
        }
    }
    
    public struct VisualizeData:Codable {
        let scale:[String]
        let values: [String:Int]
        
        public init(scale: [Colors], values: [String : Int]) {
            self.scale = scale.map { $0.tagValue }
            self.values = values
        }
    }
    
    public struct Lines:Codable {
        public struct Line:Codable {
            let from:String
            let to:String
            
            public init(from: String, to: String) {
                self.from = from
                self.to = to
            }
        }
        
        public struct LineStyle:Codable {
            public static let `default` = LineStyle(strokeDasharray: "4 4", animation: true, stroke: .body, strokeWidth: 0.35)
            
            let strokeDasharray:String
            let animation:Bool
            let stroke:String
            let strokeWidth:Double
            
            public init(strokeDasharray: String, animation: Bool, stroke: Colors, strokeWidth: Double) {
                self.strokeDasharray = strokeDasharray
                self.animation = animation
                self.stroke = stroke.tagValue
                self.strokeWidth = strokeWidth
            }
        }
        
        let lineStyle:LineStyle
        let lines:[Line]
        
        public init(lineStyle: LineStyle = .default, lines: [Line]) {
            self.lineStyle = lineStyle
            self.lines = lines
        }
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
    
    public init(uuid: UUID = UUID(), projection:Projection = .regular, regionStyle:RegionStyle = .default, markers:Markers? = nil, visualizeData:VisualizeData? = nil, lines:Lines? = nil) {
        self.uuid = uuid
        self.projection = projection
        self.regionStyle = regionStyle
        self.markers = markers
        self.visualizeData = visualizeData
        self.lines = lines
    }
    
    public func body() async -> Component {
        // Add the js lib
        deps.addJSSource(.jsvectormap_js)
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
