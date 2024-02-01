//
//  Alert.swift
//  PlotTabler
//

import Plot

struct Alert:Component {
    enum Style {
        case success
        case warning
        case danger
        case info
        
        var css:String {
            switch self {
            case .success:
                return "alert-success"
            case .warning:
                return "alert-warning"
            case .danger:
                return "alert-danger"
            case .info:
                return "alert-info"
            }
        }
    }
    
    let style:Style
    let content:Component
    let icon:Icons?
    let dismissable:Bool
    let important:Bool
    
    init(style: Style, icon:Icons? = nil, dismissable:Bool = false, important:Bool = false, message: String, description: String? = nil) {
        self.style = style
        self.icon = icon
        self.dismissable = dismissable
        self.important = important
        if let description {
            self.content = Div {
                H4 { Text(message) }.class("alert-title")
                Div { Text(description) }.textColor(.secondary)
            }
        } else {
            self.content = Text(message)
        }
    }
    
    init(style: Style, icon:Icons? = nil, dismissable:Bool = false, important:Bool = false, content: Component) {
        self.style = style
        self.icon = icon
        self.dismissable = dismissable
        self.important = important
        self.content = content
    }
    
    init(style: Style, icon:Icons? = nil, dismissable:Bool = false, important:Bool = false, @ComponentBuilder _ content: ContentProvider) async {
        self.style = style
        self.icon = icon
        self.dismissable = dismissable
        self.important = important
        self.content = await content()
    }
    
    
    func body() async -> Component {
        await DivC("alert") {
            
            await buildAlertBody()
            // Add the dismiss button if dismissable
            if dismissable {
                Link(url: "") { }
                    .class("btn-close")
                    .attribute(named: "data-bs-dismiss", value: "alert")
                    .attribute(named: "aria-label", value: "close")
            }
        }
        .class(style.css)
        .class(dismissable ? "alert-dismissible" : "")
        .class(important ? "alert-important" : "")
        .attribute(named: "role", value: "alert")
    }
    
    func buildAlertBody() async -> Component {
        if let icon {
            return await DivC("d-flex") {
                // Add the Icon if we have one
                Div { SVGIcon(icon: icon, size: .regular).class("alert-icon") }
                
                    // Append the main content
                    content
                }
        } else {
            return content
        }
    }
    
}
