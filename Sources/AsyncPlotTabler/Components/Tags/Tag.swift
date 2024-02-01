//
//  Tag.swift
//  PlotTabler
//

import Plot

public struct Tag: Component {
    
    public enum Style {
        case text(String)
        //case flag(String, Flag)
        case icon(Icons, String)
        case avatar(Avatar.AvatarType, String)
        case status(Colors, String)
        case legend(Colors, String)
        case checkbox(String)
        case badge(String, Badge)
        
        func buildComponent() async -> Component {
            switch self {
            case .text(let string):
                return Text(string)
            case .icon(let icon, let string):
                return await ComponentGroup {
                    SVGIcon(icon: icon)
                        .class("tag-icon icon-xxs")
                    Text(string)
                }
            case .avatar(let avatar, let string):
                return await ComponentGroup {
                    Avatar(size: .xxs, avatar)
                        .class("tag-avatar")
                    Text(string)
                }
            case .status(let color, let string):
                return await ComponentGroup {
                    Span { }
                        .class("badge tag-status badge-empty")
                        .class(color.backgroundCSS)
                        .class(color.textLiteCSS)
                    Text(string)
                }
            case .legend(let color, let string):
                return await ComponentGroup {
                    Span { }
                        .class("legend")
                        .class(color.backgroundCSS)
                    Text(string)
                }
            case .checkbox(let string):
                return await ComponentGroup {
                    Input(type: .checkbox)
                        .class("form-check-input tag-check")
                    Text(string)
                }
            case .badge(let string, let badge):
                return await ComponentGroup {
                    Text(string)
                    badge
                        .class("tag-badge")
                    
                }
            }
        }
    }
    
    let content:Component
    let removable:Bool
    
    public init(removable:Bool = true, @ComponentBuilder _ content:ContentProvider) async {
        self.removable = removable
        self.content = await content()
    }
    
    public init(removable:Bool = true, style:Style) async {
        self.removable = removable
        self.content = await style.buildComponent()
    }
    
    /*
     <span class="tag">
       Label 1
       <a href="#" class="btn-close"></a>
     </span>
     */
    public func body() async -> Component {
        Span {
            content
            Plot.Link("", url: "#")
                .class("btn-close")
        }.class("tag")
    }
}
