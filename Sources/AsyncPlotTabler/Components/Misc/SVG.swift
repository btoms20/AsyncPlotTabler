//
//  SVG.swift
//  PlotTabler
//

import Plot

public struct SVG:Component {
    let paths:[Path]
    /*
     <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/>
        <path d="M12 12m-4 0a4 4 0 1 0 8 0a4 4 0 1 0 -8 0" />
        <path d="M3 12h1m8 -9v1m8 8h1m-9 8v1m-6.4 -15.4l.7 .7m12.1 -.7l-.7 .7m0 11.4l.7 .7m-12.1 -.7l-.7 .7" />
     </svg>
     */
    
    public func body() async -> Component {
        await Element(name: "svg") {
            for path in paths {
                path
            }
        }
        .attribute(named: "xmlns", value: "http://www.w3.org/2000/svg")
    }
}

public struct SVGIcon:Component {
    public enum Size {
        case xs
        case sm
        case regular
        case md
        case lg
        case xl
        
        var css:String {
            switch self {
            case .xs: "icon-xs"
            case .sm: "icon-sm"
            case .regular: ""
            case .md: "icon-md"
            case .lg: "icon-lg"
            case .xl: "icon-xl"
            }
        }
    }
    
    public enum Animation {
        case pulse
        case tada
        case rotate
        
        var css:String {
            switch self {
            case .pulse: "icon-pulse"
            case .tada: "icon-tada"
            case .rotate: "icon-rotate"
            }
        }
    }
    
    var paths:[Path]
    var color:Colors?
    var size:Size
    var animation:Animation?
    
    public init(paths: [Path], color: Colors? = nil, size:Size = .regular, animation:Animation? = nil) {
        self.paths = paths
        self.color = color
        self.size = size
        self.animation = animation
    }
    
    public init(icon: Icons, color: Colors? = nil, size:Size = .regular, animation:Animation? = nil) {
        self.paths = icon
        self.color = color
        self.size = size
        self.animation = animation
    }
    
    public func body() async -> Component {
        SVG(paths: paths)
            .class("icon")
            .class(animation?.css ?? "")
            .class(color?.textCSS ?? "")
            .class(size.css)
            .attribute(named: "width", value: "24")
            .attribute(named: "height", value: "24")
            .attribute(named: "viewBox", value: "0 0 24 24")
            .attribute(named: "stroke-width", value: "2")
            .attribute(named: "stroke", value: "currentColor")
            .attribute(named: "fill", value: "none")
            .attribute(named: "stroke-linecap", value: "round")
            .attribute(named: "stroke-linejoin", value: "round")
    }
}

public struct Path:Component {
    let path:String
    let stroke:String?
    let strokeWidth:String?
    let fill:String?
    
    public init(path: String, stroke: String? = nil, strokeWidth:String? = nil, fill: String? = nil) {
        self.path = path
        self.stroke = stroke
        self.strokeWidth = strokeWidth
        self.fill = fill
    }
    
    /*
     <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
        <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
        <path d="M12 12m-4 0a4 4 0 1 0 8 0a4 4 0 1 0 -8 0" />
        <path d="M3 12h1m8 -9v1m8 8h1m-9 8v1m-6.4 -15.4l.7 .7m12.1 -.7l-.7 .7m0 11.4l.7 .7m-12.1 -.7l-.7 .7" />
     </svg>
     */
    private func buildElement() async -> Component {
        var e = await Element(name: "path") { }
            .attribute(named: "d", value: path)
        
        if let stroke { e = e.attribute(named: "stroke", value: stroke) }
        
        if let strokeWidth { e = e.attribute(named: "stroke-width", value: strokeWidth) }
        
        if let fill { e = e.attribute(named: "fill", value: fill) }
        
        return e
    }
    
    public func body() async -> Component {
        await buildElement()
    }
}


