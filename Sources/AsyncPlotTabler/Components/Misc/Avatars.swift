//
//  AvatarStack.swift
//  PlotTabler
//

import Plot


public struct Avatar:Component {
    public enum AvatarType {
        case picture(URLRepresentable)
        case text(String)
        case icon(Icons, iconColor:Colors, bgColor: Colors)
        case svg(SVGIcon, bgColor: Colors)
    }
    
    public enum Size:String, CaseIterable {
        case xxs
        case xs
        case sm
        case md
        case lg
        case xl
    }
    
    public enum Shape {
        case regular
        case rounded
        case cirlce
        case square
        case custom(Int)
        
        var css:String {
            switch self {
            case .regular: ""
            case .rounded: "rounded"
            case .cirlce: "rounded-circle"
            case .square: "rounded-0"
            case .custom(let radius): "rounded-\(abs(radius))"
            }
        }
    }
    
    var size:Size
    var shape:Shape
    var avatar:AvatarType
    var badge:Colors?
    
    public init(size:Size = .xs, _ avatar:AvatarType, shape:Shape = .regular, badge:Colors? = nil) {
        self.size = size
        self.shape = shape
        self.avatar = avatar
        self.badge = badge
    }
    
    public func body() async -> Component {
        switch avatar {
        case .picture(let src):
            Span { badgeComp }
                .class("avatar avatar-\(self.size.rawValue)")
                .class(shape.css)
                .style("background-image: url(\(src))")
        case .text(let str):
            Span { 
                badgeComp
                Text(str)
            }
            .class("avatar avatar-\(self.size.rawValue)")
            .class(shape.css)
        case .icon(let icon, let iconColor, let bgColor):
            Span {
                badgeComp
                SVGIcon(icon: icon, color: iconColor)
            }
            .class("avatar avatar-\(self.size.rawValue)")
            .class(shape.css)
            .class(iconColor.textCSS)
            .class(bgColor == iconColor ? bgColor.backgroundLiteCSS : bgColor.backgroundCSS)
        case .svg(let icon, let bgColor):
            Span {
                badgeComp
                icon
            }
            .class("avatar avatar-\(self.size.rawValue)")
            .class(shape.css)
            .class(bgColor.backgroundCSS)
        }
    }
    
    var badgeComp:Component {
        if let badge {
            return Span { }
                .class("badge \(badge.backgroundCSS)")
        } else {
            return EmptyComponent()
        }
    }
}

public typealias AvatarList = Avatar.List
extension Avatar {
    public struct List:Component {
        
        public enum Style:CaseIterable {
            case list
            case stacked
            case stackedReversed
            
            var css:String {
                switch self {
                case .list: ""
                case .stacked, .stackedReversed: "avatar-list-stacked"
                }
            }
        }
        
        var style:Style
        var size:Avatar.Size
        var avatars:[Avatar.AvatarType]
        
        public init(style:Style = .stacked, size:Avatar.Size = .xs, avatars:[Avatar.AvatarType]) {
            self.style = style
            self.size = size
            self.avatars = avatars
        }
        
        public func body() async -> Component {
            await ComponentGroup {
                await DivC("avatar-list") {
                    for avatar in avatars {
                        Avatar(size: size, avatar)
                    }
                }
                .class(self.style.css)
                .optionalAttribute(style == .stackedReversed, name: "dir", value: "rtl")
            }
        }
    }
}

public struct LabeledAvatar:Component {
    public enum Style {
        case leadingAvatar
        case trailingAvatar
    }
    
    let style:Style
    let avatar:Avatar
    let content:Component
    let link:URLRepresentable
    let leadingContent:Component?
    let trailingContent:ComponentGroup?
    
    // Simple Text Based Title and Subtitles
    public init(style:Style = .leadingAvatar, avatar: Avatar, title: String, subTitle: String, link: URLRepresentable) async {
        self.style = style
        self.avatar = avatar
        self.link = link
        self.leadingContent = nil
        self.trailingContent = nil
        self.content = await LabeledAvatar.defaultContent(link: link, title: title, subTitle: subTitle)
    }
    
    public init(style:Style = .leadingAvatar, avatar: Avatar, title: String, subTitle: String, link: URLRepresentable, @ComponentBuilder leadingContent: ContentProvider) async {
        self.style = style
        self.avatar = avatar
        self.link = link
        self.leadingContent = await leadingContent()
        self.trailingContent = nil
        self.content = await LabeledAvatar.defaultContent(link: link, title: title, subTitle: subTitle)
    }
    
    public init(style:Style = .leadingAvatar, avatar: Avatar, title: String, subTitle: String, link: URLRepresentable, @ComponentBuilder trailingContent: @escaping () async -> ComponentGroup) async {
        self.style = style
        self.avatar = avatar
        self.link = link
        self.leadingContent = nil
        self.trailingContent = await trailingContent()
        self.content = await LabeledAvatar.defaultContent(link: link, title: title, subTitle: subTitle)
    }
    
    public init(style:Style = .leadingAvatar, avatar: Avatar, title: String, subTitle: String, link: URLRepresentable, @ComponentBuilder leadingContent: ContentProvider, @ComponentBuilder trailingContent:@escaping () async -> ComponentGroup) async {
        self.style = style
        self.avatar = avatar
        self.link = link
        self.leadingContent = await leadingContent()
        self.trailingContent = await trailingContent()
        self.content = await LabeledAvatar.defaultContent(link: link, title: title, subTitle: subTitle)
    }
    
    // Custom title and subtitle components
    public init(style:Style = .leadingAvatar, avatar: Avatar, link: URLRepresentable, @ComponentBuilder content: ContentProvider) async {
        self.style = style
        self.avatar = avatar
        self.content = await content()
        self.link = link
        self.leadingContent = nil
        self.trailingContent = nil
    }
    
    public init(style:Style = .leadingAvatar, avatar: Avatar, link: URLRepresentable, @ComponentBuilder content: ContentProvider, @ComponentBuilder leadingContent: ContentProvider) async {
        self.style = style
        self.avatar = avatar
        self.content = await content()
        self.link = link
        self.leadingContent = await leadingContent()
        self.trailingContent = nil
    }
    
    public init(style:Style = .leadingAvatar, avatar: Avatar, link: URLRepresentable, @ComponentBuilder content: ContentProvider, @ComponentBuilder trailingContent: @escaping () async -> ComponentGroup) async  {
        self.style = style
        self.avatar = avatar
        self.content = await content()
        self.link = link
        self.leadingContent = nil
        self.trailingContent = await trailingContent()
    }
    
    public init(style:Style = .leadingAvatar, avatar: Avatar, link: URLRepresentable, @ComponentBuilder content: ContentProvider, @ComponentBuilder leadingContent: ContentProvider, @ComponentBuilder trailingContent:@escaping () async -> ComponentGroup) async {
        self.style = style
        self.avatar = avatar
        self.content = await content()
        self.link = link
        self.leadingContent = await leadingContent()
        self.trailingContent = await trailingContent()
    }
    
    /*
     <div class="row g-3 align-items-center">
       <a href="#" class="col-auto">
         <span class="avatar" style="background-image: url(./static/avatars/000m.jpg)">
           <span class="badge bg-red"></span></span>
       </a>
       <div class="col text-truncate">
         <a href="#" class="text-reset d-block text-truncate">Paweł Kuna</a>
         <div class="text-secondary text-truncate mt-n1">2 days ago</div>
       </div>
     </div>
     */
    public func body() async -> Component {
        await Row(g: 3, alignItemsCenter: true) {
            if let leadingContent {
                await DivC("col-auto") { leadingContent }
            }
            if style == .leadingAvatar {
                Link(url: link) { avatar }
                .class("col-auto")
            }
            await Column {
                content
            }
            .class("text-truncate")
            if style == .trailingAvatar {
                Link(url: link) { avatar }
                .class("col-auto")
            }
            if let trailingContent {
                for comp in trailingContent.members {
                    await DivC("col-auto") { comp }
                }
            }
        }
    }
    
    static func defaultContent(link: URLRepresentable, title:String, subTitle:String) async -> Component {
        await ComponentGroup {
            Link(url: link) {
                Text(title)
            }
            .class("text-reset d-block text-truncate")
            await DivC("text-secondary text-truncate mt-n1") {
                Text(subTitle)
            }
        }
    }
}
