//
//  Steps.swift
//  PlotTabler
//

import Plot

public struct Steps: Component {
    
    public enum Style {
        case regular
        case counter
        case breadcrumb(BreadcrumbStyle)
        case vertical
        case verticalCounter
        
        public enum BreadcrumbStyle {
            case regular
            case muted
            case arrow
        }
        
        var ulCSS:String {
            switch self {
            case .regular: "steps my-4"
            case .counter: "steps steps-counter my-4"
            case .breadcrumb(let breadcrumbStyle):
                switch breadcrumbStyle {
                case .regular: "breadcrumb"
                case .muted: "breadcrumb breadcrumb-muted"
                case .arrow: "breadcrumb breadcrumb-arrows"
                }
            case .vertical: "steps steps-vertical"
            case .verticalCounter: "steps steps-vertical steps-counter"
            }
        }
        
        var liCSS:String {
            switch self {
            case .breadcrumb: "breadcrumb-item"
            default: "step-item"
            }
        }
    }
    
    public struct Step {
        let content:Component
        
        public init(@ComponentBuilder _ content:@escaping() async -> Component) async {
            self.content = await content()
        }
    }
    
    let style:Style
    let steps:[Step]
    let activeIndex:Int
    let color:Colors
    
    public init(style: Style = .regular, color:Colors = .primary, steps:Int, activeIndex: Int) async {
        precondition(steps > 1)
        await self.init(style: style, color: color, activeIndex: activeIndex, steps: (1...steps).asyncMap { _ in await Step({ EmptyComponent() }) })
    }
    
    public init(style: Style = .regular, color:Colors = .primary, activeIndex: Int, steps: [Step]) {
        self.style = style
        self.steps = steps
        self.activeIndex = max(0, min(steps.count-1, activeIndex))
        self.color = color
    }
    
    func deactivateIfNecessary(_ idx:Int, _ activeIndex:Int) -> String {
        switch style {
        case .breadcrumb:
            if idx > activeIndex { return "disabled" }
            return ""
        default: return ""
        }
    }
    
    var colorCSS:String {
        switch self.style {
        case .breadcrumb:
            return color.textCSS
        default:
            return "steps-\(color.css)"
        }
    }
    
    var isBreadcrumb:Bool {
        switch self.style {
        case .breadcrumb: return true
        default: return false
        }
    }
    
    /*
     
     */
    public func body() async -> Component {
        await Element(name: isBreadcrumb ? "ol" : "ul") {
            for (i, step) in steps.enumerated() {
                await Element(name: "li") {
                    switch self.style {
                    case .breadcrumb:
                        Plot.Link(url: "#") { step.content }
                    default:
                        step.content
                    }
                }
                .class(style.liCSS)
                .class(i == activeIndex ? "active" : "")
                .class(deactivateIfNecessary(i, activeIndex))
            }
        }
        .class(style.ulCSS)
        .class(colorCSS)
    }
}
