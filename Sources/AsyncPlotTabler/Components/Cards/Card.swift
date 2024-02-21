//
//  Card.swift
//  PlotTabler
//

import Foundation
import Plot

internal extension Optional<String> {
    func spacePrefixedUnwrap() -> String {
        if let self {
            return " \(self)"
        } else {
            return ""
        }
    }
    
}

extension Card {
    
    public struct Body:Component {
        let content:Component
        let css:String?
        private let raw:Bool
        
        public init(@ComponentBuilder _ content:@escaping () async -> Component, class:String? = nil) async {
            self.css = `class`
            self.content = await content()
            self.raw = false
        }
        
        private init(content: Component, class:String?, raw:Bool) {
            self.content = content
            self.css = `class`
            self.raw = raw
        }
        
        public func body() async -> Component {
            Div {
                content
            }
            .class(raw ? "" : "card-body")
            .class(css ?? "")
        }
        
        public static func raw(@ComponentBuilder _ raw:@escaping () async -> Component, class:String? = nil) async -> Body {
            return Body.init(content: await raw(), class: `class`, raw: true)
        }
    }
    
    public struct Flex:Component {
        let content:Component
        let css:String?
        
        public init(@ComponentBuilder _ content:@escaping () -> Component, class:String? = nil) {
            self.css = `class`
            self.content = content()
        }
        
        public func body() async -> Component {
            Div {
                content
            }.class("d-flex\(css.spacePrefixedUnwrap())")
        }
    }
    
    public struct Title:Component {
        public enum SubTitle {
            case inline(String)
            case below(String)
        }
        
        let title:Component
        let subTitle:SubTitle?
        
        public init(_ title: String, subTitle:String? = nil) {
            self.title = Text(title)
            if let subTitle {
                self.subTitle = .inline(subTitle)
            } else {
                self.subTitle = nil
            }
        }
        
        public init(_ title: String, subTitle:SubTitle) {
            self.title = Text(title)
            self.subTitle = subTitle
        }
        
        public init(_ title: Component, subTitle:SubTitle) {
            self.title = title
            self.subTitle = subTitle
        }
        
        public func body() async -> Component {
            await ComponentGroup {
                H3 {
                    title
                    if let subTitle, case .inline(let sbt) = subTitle {
                        Span { Text(sbt) }.class("card-subtitle")
                    }
                }.class("card-title")
                if let subTitle, case .below(let sbt) = subTitle {
                    Paragraph { Text(sbt) }
                        .class("card-subtitle")
                }
            }
        }
    }
}

public struct Card: Component, ExplicitlySized {
    public enum Size {
        case sm
        case md
        case lg
        
        var css:String {
            switch self {
            case .sm: "card-sm"
            case .md: "card-md"
            case .lg: "card-lg"
            }
        }
    }
    
    public struct Cover:Component {
        public enum Style {
            case image(URLRepresentable)
            case color(Colors)
            
            var style:String {
                switch self {
                case .image(let url): "background-image: url(\(url.description))"
                case .color: ""
                }
            }
            
            var css:String {
                switch self {
                case .image: ""
                case .color(let color): color.backgroundCSS
                }
            }
        }
        
        let style:Style
        let blurred:Bool
        let textCentered:Bool
        let content:Component
        
        public init(style: Style, blurred: Bool = true, textCentered: Bool = true, @ComponentBuilder _ content: ContentProvider) async {
            self.style = style
            self.blurred = blurred
            self.textCentered = textCentered
            self.content = await content()
        }
        
        public func body() async -> Component {
            await DivC("card-cover") {
                content
            }
            .style(style.style)
            .class(style.css)
            .class(blurred ? "card-cover-blurred" : "")
            .class(textCentered ? "text-center" : "")
        }
    }
    
    public enum Wrapper {
        case div
        case link(URLRepresentable)
        case form(url: URLRepresentable, method: HTMLFormMethod?, contentType: HTMLFormContentType?, enableValidation: Bool)
    }
    
    // Unique ID
    let uuid:UUID
    
    // Params
    let wrapper:Wrapper
    let size:Column.Size?
    let cardSize:Size?
    let border:BorderStyle
    let hover:HoverStyle
    let state:StateStyle
    let background:BackgroundStyle
    
    // Optional Attributes
    let stamp:Stamp?
    let status:Status?
    let ribbon:Ribbon?
    let progress:CardProgress?
    let image:Image?
    
    // Content
    let cover:Cover?
    let header:Header?
    let content:Component
    let table:Component?
    let footer:Footer?
    let flex:Flex?
    let other:Component?
    
    public init(type:Wrapper = .div, size:Column.Size? = nil, cardSize:Card.Size? = nil, border:BorderStyle = .regular, hover:HoverStyle = .none, state:StateStyle = .none, background:BackgroundStyle = .none, stamp:Stamp? = nil, status:Status? = nil, ribbon:Ribbon? = nil, progress:CardProgress? = nil, image:Card.Image? = nil, cover:Cover? = nil, header:Header? = nil, body:Card.Body?, table:Tables? = nil, footer:Footer? = nil, flex:Flex? = nil, other:Component? = nil) async {
        // ID
        self.uuid = UUID()
        
        // Params
        self.wrapper = type
        self.size = size
        self.cardSize = cardSize
        self.border = border
        self.hover = hover
        self.state = state
        self.background = background
        
        // Attributes
        self.stamp = stamp
        self.status = status
        self.ribbon = ribbon
        self.progress = progress
        self.image = image
        
        // Content
        self.cover = cover
        self.header = header
        if table != nil {
            if let body {
                self.content = await Card.Body({ body.content }, class: "border-bottom py-3" + body.css.spacePrefixedUnwrap())
            } else {
                self.content = EmptyComponent()
            }
        } else {
            self.content = body ?? EmptyComponent()
        }
        self.table = table
        self.footer = footer
        self.flex = flex
        self.other = other
    }
    
    public init(size:Column.Size? = nil, cardSize:Card.Size? = nil, border:BorderStyle = .regular, hover:HoverStyle = .none, state:StateStyle = .none, background:BackgroundStyle = .none, stamp:Stamp? = nil, status:Status? = nil, ribbon:Ribbon? = nil, progress:CardProgress? = nil, image:Card.Image? = nil, tabsFillHeader:Bool = false, reverseTabs:Bool = false, tabbedSections:[TabbedCard.TabComponent], footer:Footer? = nil, flex:Flex? = nil, other:Component? = nil) async {
        // ID
        self.uuid = UUID()
        
        // Params
        self.wrapper = .div
        self.size = size
        self.cardSize = cardSize
        self.border = border
        self.hover = hover
        self.state = state
        self.background = background
        
        // Attributes
        self.stamp = stamp
        self.status = status
        self.ribbon = ribbon
        self.progress = progress
        self.image = image
        
        // Content
        self.cover = nil
        self.header = await tabbedSections.buildHeader(uuid: self.uuid, fullWidth: tabsFillHeader, reverseTabs: reverseTabs)
        self.content = await tabbedSections.buildBody(uuid: self.uuid)
        self.table = nil
        self.other = other
        self.footer = footer
        self.flex = flex
    }
    
    public func body() async -> Component {
        CardWrapper(wrapper: self.wrapper) {
            // Decorators
            if let stamp { StampComponent(stamp: stamp, textPrimary: background == .dark) }
            if let status { StatusComponent(status: status) }
            if let ribbon { RibbonComponent(ribbon: ribbon) }
            
            if let progress, progress.progressBar.location == .top { progress }
            
            // Content
            if let cover { cover }
            if let header { header }
            if let image {
                ImageComponent(image: image) {
                    content
                }
            } else if let table {
                content
                table
            } else {
                content
            }
            
            if let flex { flex }
            if let other { other }
            if let footer { footer }
            
            if let progress, progress.progressBar.location == .bottom { progress }
        }
        .class("card")
        .class(cardSize?.css ?? "")
        .class(border.css)
        .class(hover.css)
        .class(state.css)
        .class(background.css)
    }
}

fileprivate struct CardWrapper:Component {
    let wrapper:Card.Wrapper
    @ComponentBuilder let content:Component
    
    func body() async -> Component {
        switch wrapper {
        case .div:
            return Div { content }
        case .link(let url):
            return Link(url: url) { content }.class("card-link")
        case .form(let url, let method, let contentType, let validation):
            return Form(url: url, method: method, contentType: contentType, enableValidation: validation) { content }.class("card")
        }
    }
}

extension Array where Element == TabbedCard.TabComponent {
    private func isItemDisabled(_ item:TabbedCard.TabComponent) -> Bool {
        if item.isDropdown { return false }
        if item.content is EmptyComponent {
            return true
        } else if let cg = item.content as? ComponentGroup {
            if cg.members.count == 1, cg.members.first! is EmptyComponent {
                return true
            }
        }
        return false
    }
    
    private func isActive(_ idx:Int) -> Bool {
        if let firstNonDisabledSection = self.firstIndex(where: { !$0.isDropdown && !isItemDisabled($0) }) {
            return idx == firstNonDisabledSection
        } else {
            return false
        }
    }
    
    func buildHeader(uuid:UUID, fullWidth:Bool, reverseTabs:Bool, style:Card.HeaderTabs.Style = .tabs) async -> Card.Header {
        await Card.Header(style: .regular, {
            await Plot.Element(name: "ul") {
                for (i, item) in self.enumerated() {
                    await Plot.Element(name: "li") {
                        if item.isDropdown {
                            await Plot.Element(name: "a") {
                                item.tab
                            }
                            .class("nav-link dropdown-toggle")
                            .attribute(named: "data-bs-toggle", value: "dropdown")
                            .attribute(named: "role", value: "button")
                            .attribute(named: "aria-haspopup", value: "true")
                            .attribute(named: "aria-expanded", value: "false")
                            DropDownMenu(columns: [item.dropdown])
                        } else {
                            Plot.Link(url: "#tabs-\(uuid.uuidString)-tab\(i)") {
                                item.tab
                            }
                            .class("nav-link")
                            .class(isActive(i) ? "active" : "")
                            .class(isItemDisabled(item) ? "disabled" : "")
                            .attribute(named: "data-bs-toggle", value: "tab")
                        }
                    }
                    .class("nav-item")
                    .class(item.isDropdown ? "dropdown" : "")
                    .class(item.pullRight ? (reverseTabs ? "me-auto" : "ms-auto") : "")
                }
            }
            .class("nav \(style.css) card-header-tabs")
            .class(reverseTabs ? "flex-row-reverse" : "")
            .class(fullWidth ? "nav-fill" : "")
            .attribute(named: "data-bs-toggle", value: "tabs")
        }, class: nil)
    }
    
    func buildBody(uuid:UUID) async -> Card.Body {
        return await Card.Body {
            await DivC("tab-content") {
                for (i, item) in self.enumerated() {
                    if isItemDisabled(item) {
                        EmptyComponent()
                    } else {
                        await DivC("tab-pane") {
                            item.content
                        }
                        .class(i == 0 ? "active show" : "")
                        .id("tabs-\(uuid.uuidString)-tab\(i)")
                    }
                }
            }
        }
    }
}



public extension Card {
    enum BorderStyle {
        case regular
        case none
        case stacked
        
        var css:String {
            switch self {
            case .regular: ""
            case .none: "card-borderless"
            case .stacked: "card-stacked"
            }
        }
    }
    
    enum HoverStyle {
        case none
        case hover
        case rotate
        case pop
        
        var css:String {
            switch self {
            case .none: ""
            case .hover: "card-link"
            case .rotate: "card-link card-link-rotate"
            case .pop: "card-link card-link-pop"
            }
        }
    }
    
    enum StateStyle {
        case none
        case rotateRight
        case rotateLeft
        case active
        case inactive
        
        var css:String {
            switch self {
            case .none: ""
            case .rotateRight: "card-rotate-right"
            case .rotateLeft: "card-rotate-left"
            case .active: "card-active"
            case .inactive: "card-inactive"
            }
        }
    }
    
    enum BackgroundStyle {
        case none
        case light
        case dark
        
        var css:String {
            switch self {
            case .none: ""
            case .light: "bg-primary-lt"
            case .dark: "bg-primary text-primary-fg"
            }
        }
    }
}
