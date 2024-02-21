//
//  ButtonLink.swift
//  PlotTabler
//

import Plot

public struct ButtonLink: Component {
    let buttonType:ButtonType
    let text:String
    let css:String
    let pullRight:Bool
    let icon:Icons?
    let state:State
    
    public enum ButtonType {
        case regular(link:URLRepresentable)
        case submit
        case link(link:URLRepresentable)
    }
    
    public enum Style {
        case standard
        case outline
        case ghost
        case square
        case pill
        case card
        
        var css:String {
            switch self {
            case .standard: "btn"
            case .outline: "btn-outline"
            case .ghost: "btn-ghost"
            case .square:"btn-square"
            case .pill: "btn-pill"
            case .card: "card-btn"
            }
        }
    }
    
    public enum Theme {
        case raw
        case primary
        case secondary
        case success
        case warning
        case danger
        case info
        case dark
        case light
        case color(Colors)
        
        var css:String {
            switch self {
            case .raw:       "link"
            case .primary:   "primary"
            case .secondary: "secondary"
            case .success:   "success"
            case .warning:   "warning"
            case .danger:    "danger"
            case .info:      "info"
            case .dark:      "dark"
            case .light:     "light"
            case .color(let c): "\(c)"
            }
        }
        
        public static let allCases:[Theme] = [
            .raw,
            .primary,
            .secondary,
            .success,
            .warning,
            .danger,
            .info,
            .dark,
            .light
        ]
    }
    
    public enum State {
        case normal
        case active
        case disabled
        
        var css:String {
            switch self {
            case .normal: return ""
            case .active: return "active"
            case .disabled: return "disabled"
            }
        }
        
        public static let allCases:[State] = [
            .normal,
            .active,
            .disabled
        ]
    }
    
    public init(_ text:String, link:URLRepresentable, icon:Icons? = nil, style:Style = .standard, theme:Theme = .primary, state:State = .normal, pullRight:Bool = false) {
        self.buttonType = .regular(link: link)
        self.text = text
        self.icon = icon
        switch style {
        case .standard:
            self.css = "btn " + style.css + "-" + theme.css
        case .outline:
            self.css = "btn " + style.css + "-" + theme.css
        case .ghost:
            self.css = "btn " + style.css + "-" + theme.css
        case .pill:
            self.css = "btn " + Style.standard.css + "-" + theme.css + " " + style.css
        case .square:
            self.css = "btn " + Style.standard.css + "-" + theme.css + " " + style.css
        case .card:
            self.css = style.css
        }
        self.state = state
        self.pullRight = pullRight
    }
    
    public init(type:ButtonType, text:String?, icon:Icons? = nil, style:Style = .standard, theme:Theme = .primary, state:State = .normal, pullRight:Bool = false) {
        self.buttonType = type
        self.text = text ?? ""
        self.icon = icon
        switch style {
        case .standard:
            self.css = "btn " + style.css + "-" + theme.css
        case .outline:
            self.css = "btn " + style.css + "-" + theme.css
        case .ghost:
            self.css = "btn " + style.css + "-" + theme.css
        case .pill:
            self.css = "btn " + Style.standard.css + "-" + theme.css + " " + style.css
        case .square:
            self.css = "btn " + Style.standard.css + "-" + theme.css + " " + style.css
        case .card:
            self.css = style.css
        }
        self.state = state
        self.pullRight = pullRight
    }
    
   
    var emptyTextIconCSS:String {
        if text.isEmpty {
            return "btn-icon"
        } else {
            return ""
        }
    }
    
    /*
     <a href="..." class="btn ...">
     ...
     </a>
     */
    public func body() async -> Component {
        switch buttonType {
        case .regular(let link), .link(let link):
            Link(url: link) {
                if let icon {
                    SVGIcon(icon: icon)
                        .class("\(self.css == "card-btn" ? "me-2 text-muted" : "")")
                }
                if !text.isEmpty {
                    Text(text)
                } else {
                    EmptyComponent()
                }
            }
            .class(self.css)
            .class(state.css)
            .class(emptyTextIconCSS)
            .class("\(self.pullRight ? "ms-auto" : "")")
        case .submit:
            await Element(name: "button") {
                if let icon {
                    SVGIcon(icon: icon)
                        .class("\(self.css == "card-btn" ? "me-2 text-muted" : "")")
                }
                if !text.isEmpty {
                    Text(text)
                } else {
                    EmptyComponent()
                }
            }
            .class(self.css)
            .class(state.css)
            .class(emptyTextIconCSS)
            .class("\(self.pullRight ? "ms-auto" : "")")
        }
        
    }
}
