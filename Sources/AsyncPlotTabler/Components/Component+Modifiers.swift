//
//  Component+Modifiers.swift
//  PlotTabler
//

import Plot
import Foundation

extension URLRepresentable where Self == String {
    static var coloris_js:URLRepresentable { "/libs/melloware/coloris/dist/umd/coloris.min.js" }
    static var coloris_css:URLRepresentable { "/libs/melloware/coloris/dist/coloris.min.css" }
    
    static var litepicker_js:URLRepresentable { "/libs/litepicker/dist/litepicker.js" }
    
    static var tinymce_js:URLRepresentable { "/libs/tinymce/tinymce.min.js" }
    
    static var jsvectormap_js:URLRepresentable { "/libs/jsvectormap/dist/js/jsvectormap.min.js" }
    
    static var star_rating_js:URLRepresentable { "/libs/star-rating.js/dist/star-rating.min.js" }
    static var star_rating_css:URLRepresentable { "/libs/star-rating.js/dist/star-rating.min.css" }
}

class DependencyAccumulator {
    private(set) var rawScripts:[String]
    private(set) var jsSources:[URLRepresentable]
    private(set) var cssSources:[URLRepresentable]
    
    init() {
        self.rawScripts = []
        self.jsSources = []
        self.cssSources = []
    }
    
    func addRawScript(_ str:String) {
        self.rawScripts.append(str)
    }
    
    func addJSSource(_ url:URLRepresentable) {
        if self.jsSources.contains(where: { $0.description == url.description }) { return }
        self.jsSources.append(url)
    }
    
    func addCSSSource(_ url:URLRepresentable) {
        if self.cssSources.contains(where: { $0.description == url.description }) { return }
        self.cssSources.append(url)
    }
}

extension Plot.EnvironmentKey where Value == DependencyAccumulator {
    static var dependencies: Self {
        Self(defaultValue: .init())
    }
}

//extension Plot.EnvironmentKey where Value == Vapor.Request? {
//    static var request: Self {
//        Self(defaultValue: nil)
//    }
//}

public enum Margin {
    case body(Int)
    case leading(Int)
    case trailing(Int)
    case top(Int)
//    case bottom(Int)
    
    var css:String {
        switch self {
        case .body(let int):
            return "mb-\(int)"
        case .leading(let int):
            return "ms-\(int)"
        case .trailing(let int):
            return "me-\(int)"
        case .top(let int):
            return "mt-\(int)"
//        case .bottom(let int):
//            return "mu-\(int)"
        }
    }
}

public enum FontWeight:String {
    case light
    case normal
    case medium
    case bold
}

public enum Theme:String {
    case light
    case dark
}

public enum LineHeight {
    case smallest
    case small
    case base
    case large
    
    var css:String {
        switch self {
        case .smallest: "lh-1"
        case .small: "lh-sm"
        case .base: "lh-base"
        case .large: "lh-lg"
        }
    }
}

public enum LetterTracking:String {
    case tight
    case normal
    case wide
}

public extension Component {
    func margin(_ margin:Margin) -> Component {
        self.class(margin.css)
    }
    
    func textColor(_ color:Colors, lighter:Bool = false) -> Component {
        self.class(lighter ? color.textLiteCSS : color.textCSS)
    }
    
    func fontWeight(_ weight:FontWeight) -> Component {
        self.class("font-weight-\(weight.rawValue)")
    }
    
    func lineHeight(_ height:LineHeight) -> Component {
        self.class(height.css)
    }
    
    func tracking(_ track:LetterTracking) -> Component {
        self.class("tracking-\(track.rawValue)")
    }
    
    func backgroundColor(_ color:Colors) -> Component {
        self.class(color.backgroundCSS)
    }
    
    func theme(_ theme:Theme) -> Component {
        self.attribute(named: "data-bs-theme", value: theme.rawValue)
    }
    
    func optionalAttribute(_ shouldApply:Bool?, name:String, value:String? = nil, replaceExisting:Bool = true, ignoreValueIfEmpty:Bool = true) -> Component {
        if let sa = shouldApply, sa {
            return self.attribute(named: name, value: value, replaceExisting: replaceExisting, ignoreValueIfEmpty: ignoreValueIfEmpty)
        } else {
            return self
        }
    }
    
    func optionalAttribute(name:String, value:String? = nil, replaceExisting:Bool = true, ignoreValueIfEmpty:Bool = true) -> Component {
        if let value = value {
            return self.attribute(named: name, value: value, replaceExisting: replaceExisting, ignoreValueIfEmpty: ignoreValueIfEmpty)
        } else {
            return self
        }
    }
}

public enum DisplayType {
    case none
    case block
    case inline
    case inlineBlock
    case grid
    case inlineGrid
    case table
    case tableCell
    case tableRow
    case flex
    case inlineFlex
    
    var css:String {
        switch self {
        case .none: "none"
        case .block: "block"
        case .inline: "inline"
        case .inlineBlock: "inline-block"
        case .grid: "grid"
        case .inlineGrid: "inline-grid"
        case .table: "table"
        case .tableCell: "table-cell"
        case .tableRow: "table-row"
        case .flex: "flex"
        case .inlineFlex: "inline-flex"
        }
    }
}

public enum DeviceSize:Int, Comparable, CaseIterable {
    case xs
    case sm
    case md
    case lg
    case xl
    case xxl
    
    func visibleCSS(_ dt:DisplayType) -> String {
        switch self {
        case .xs:  "d-xs-\(dt.css)"
        case .sm:  "d-sm-\(dt.css)"
        case .md:  "d-md-\(dt.css)"
        case .lg:  "d-lg-\(dt.css)"
        case .xl:  "d-xl-\(dt.css)"
        case .xxl: "d-xxl-\(dt.css)"
        }
    }
    
    var hiddenCSS:String {
        switch self {
        case .xs:  "d-xs-none"
        case .sm:  "d-sm-none"
        case .md:  "d-md-none"
        case .lg:  "d-lg-none"
        case .xl:  "d-xl-none"
        case .xxl: "d-xxl-none"
        }
    }
    
    func next() -> DeviceSize? {
        DeviceSize(rawValue: self.rawValue + 1)
    }
    
    func previous() -> DeviceSize? {
        DeviceSize(rawValue: self.rawValue - 1)
    }
    
    public static func < (lhs: DeviceSize, rhs: DeviceSize) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

extension Array where Element == DeviceSize {
    func visibleCSS(_ dt:DisplayType) -> String {
        var css:[String] = []
        if self.first == .xs { css.append("d-\(dt.css)") }
        else { css.append("d-none") }
    
        let breaks = self.breaks()
        //print("Breaks: \(breaks)")
        
        var displayFlag = !(self.first == .xs)
        for b in breaks {
            css.append( displayFlag ? b.visibleCSS(dt) : b.hiddenCSS )
            displayFlag.toggle()
        }
        if !displayFlag, self.last != .xxl, let next = breaks.last?.next() {
            css.append(next.hiddenCSS)
        }
        
        return css.joined(separator: " ")
    }
    
    func hiddenCSS(_ dt:DisplayType) -> String {
        var css:[String] = []
        if self.first == .xs { css.append("d-none") }
    
        let breaks = self.breaks()
        
        var displayFlag = (self.first == .xs)
        for b in breaks {
            css.append( displayFlag ? b.visibleCSS(dt) : b.hiddenCSS )
            displayFlag.toggle()
        }
        if displayFlag, self.last != .xxl, let next = breaks.last?.next() {
            css.append(next.visibleCSS(dt))
        }
        
        return css.joined(separator: " ")
    }
    
    private func breaks() -> [DeviceSize] {
        var breaks:[DeviceSize] = []
        for (idx, ds) in self.enumerated() {
            if idx == 0 { if ds != .xs { breaks.append(ds) }; continue }
            if self[idx-1].rawValue == ds.rawValue - 1 {
                if self.count == idx + 1, let next = ds.next() { breaks.append(next) }
                continue
            }
            else if let next = self[idx-1].next() {
                breaks.append(contentsOf: [next, ds])
            }
        }
        if breaks.isEmpty { breaks.append(.sm) }
        return breaks
    }
}

extension Component {
    
    /// visible(onlyOn: .xs, .lg, .sm, .lg)
    /// ss = [ .xs, .sm, .lg ]
    /// breaks = [.md, .lg, .xl]
    /// css = .d-block .d-md-none .d-lg-block .d-xl-none
    
    public func visible(onlyOn screenSizes: [DeviceSize], display dt:DisplayType = .block) -> Component {
        let ss = Set(screenSizes).sorted()
        if ss.isEmpty { return self }
        if ss.count == 6 { return self.class(dt.css) }
        return self.class(screenSizes.visibleCSS(dt))
    }
    
    public func visible(onlyOn screenSizes: DeviceSize..., display dt:DisplayType = .block) -> Component {
        self.visible(onlyOn: screenSizes, display: dt)
    }
    
    public func visible(onlyOn screenSizes: Range<DeviceSize>, display dt:DisplayType = .block) -> Component {
        let ss = DeviceSize.allCases.compactMap { screenSizes.contains($0) ? $0 : nil }
        return self.visible(onlyOn: ss, display: dt)
    }
    
    public func visible(onlyOn screenSizes: ClosedRange<DeviceSize>, display dt:DisplayType = .block) -> Component {
        let ss = DeviceSize.allCases.compactMap { screenSizes.contains($0) ? $0 : nil }
        return self.visible(onlyOn: ss, display: dt)
    }
    
    public func visible(onlyOn screenSizes: PartialRangeFrom<DeviceSize>, display dt:DisplayType = .block) -> Component {
        let ss = DeviceSize.allCases.compactMap { screenSizes.contains($0) ? $0 : nil }
        return self.visible(onlyOn: ss, display: dt)
    }
    
    public func visible(onlyOn screenSizes: PartialRangeUpTo<DeviceSize>, display dt:DisplayType = .block) -> Component {
        let ss = DeviceSize.allCases.compactMap { screenSizes.contains($0) ? $0 : nil }
        return self.visible(onlyOn: ss, display: dt)
    }
    
    public func visible(above screenSize: DeviceSize, display dt:DisplayType = .block) -> Component {
        let ss = DeviceSize.allCases.filter { $0.rawValue > screenSize.rawValue }
        return self.visible(onlyOn: ss, display: dt)
    }
    
    public func visible(below screenSize: DeviceSize, display dt:DisplayType = .block) -> Component {
        let ss = DeviceSize.allCases.filter { $0.rawValue < screenSize.rawValue }
        return self.visible(onlyOn: ss, display: dt)
    }
    
    public func hidden(on screenSizes: [DeviceSize], display dt:DisplayType = .block) -> Component {
        let ss = Set(screenSizes).sorted()
        if ss.isEmpty { return self }
        if ss.count == 6 { return self.class("d-none") }
        return self.class(screenSizes.hiddenCSS(dt))
    }
    
    public func hidden(on screenSizes: DeviceSize..., display dt:DisplayType = .block) -> Component {
        self.hidden(on: screenSizes, display: dt)
    }
    
    public func hidden(on screenSizes: Range<DeviceSize>, display dt:DisplayType = .block) -> Component {
        let ss = DeviceSize.allCases.compactMap { screenSizes.contains($0) ? $0 : nil }
        return self.hidden(on: ss, display: dt)
    }
    
    public func hidden(on screenSizes: ClosedRange<DeviceSize>, display dt:DisplayType = .block) -> Component {
        let ss = DeviceSize.allCases.compactMap { screenSizes.contains($0) ? $0 : nil }
        return self.hidden(on: ss, display: dt)
    }
    
    public func hidden(on screenSizes: PartialRangeFrom<DeviceSize>, display dt:DisplayType = .block) -> Component {
        let ss = DeviceSize.allCases.compactMap { screenSizes.contains($0) ? $0 : nil }
        return self.hidden(on: ss, display: dt)
    }
    
    public func hidden(on screenSizes: PartialRangeUpTo<DeviceSize>, display dt:DisplayType = .block) -> Component {
        let ss = DeviceSize.allCases.compactMap { screenSizes.contains($0) ? $0 : nil }
        return self.hidden(on: ss, display: dt)
    }
    
    public func hidden(above screenSize: DeviceSize, display dt:DisplayType = .block) -> Component {
        let ss = DeviceSize.allCases.filter { $0.rawValue > screenSize.rawValue }
        return self.hidden(on: ss, display: dt)
    }
    
    public func hidden(below screenSize: DeviceSize, display dt:DisplayType = .block) -> Component {
        let ss = DeviceSize.allCases.filter { $0.rawValue < screenSize.rawValue }
        return self.hidden(on: ss, display: dt)
    }
}



extension Component {
    public func renderInWrappedHTMLBody(theme:Theme = .light) async -> String {
        let da = DependencyAccumulator()
        let renderedComponent = await self.environmentValue(da, key: .dependencies).render()
        switch theme {
        case .light:
            return await self.htmlBodyWrapped(usingDependencyAccumulator: da, renderedComponent: renderedComponent).render()
        case .dark:
            return await self.htmlBodyWrapped(usingDependencyAccumulator: da, renderedComponent: renderedComponent)
                .render()
                .replacingOccurrences(of: "<body>", with: "<body data-bs-theme=\"dark\"")
        }
        
    }

    func htmlBodyWrapped(usingDependencyAccumulator da: DependencyAccumulator, renderedComponent:String) async -> HTML {
        await HTML(
            .head(
                .meta(.attribute(named: "charset", value: "utf-8")),
                .meta(.attribute(named: "name", value: "viewport"), .attribute(named: "content", value: "width=device-width, initial-scale=1, viewport-fit=cover")),
//                .meta(.attribute(named: "http-equiv", value: "X-UA-Compatible"), .attribute(named: "content", value: "ie=edge")),
                .title("Tabler + Plot"),
                .asyncForEach(da.cssSources, { cssSrc in
                    await .stylesheet(cssSrc)
                }),
                .stylesheet("/css/tabler.min.css"),
                .stylesheet("/css/tabler-flags.min.css"),
                .stylesheet("/css/tabler-vendors.min.css"),
                .stylesheet("/css/demo.min.css"),
                .style("""
                 @import url('https://rsms.me/inter/inter.css');
                 :root {
                     --tblr-font-sans-serif: 'Inter Var', -apple-system, BlinkMacSystemFont, San Francisco, Segoe UI, Roboto, Helvetica Neue, sans-serif;
                 }
                 body {
                     font-feature-settings: "cv03", "cv04", "cv11";
                 }
                 """)
            ),
            .body(
                .script(.src("/js/demo-theme.min.js")),
                //.class("border-top-wide border-primary d-flex flex-column"),
                .raw(renderedComponent),
                
                // Libs
                .forEach(da.jsSources, { jsSrc in
                    .script(.defer(), .src(jsSrc))
                }),
                
                // Tabler Core
                .script(.defer(), .src("/js/tabler.min.js")),
                .script(.defer(), .src("/js/demo.min.js")),
                
                .asyncForEach(da.rawScripts, { script in
                    await .script(.raw(script))
                })
            )
        )
    }
}

public enum CommonAttributes {
    public enum Amount {
        case px(Int)
        case percent(Float)
        case em(Float)
        
        var toString:String {
            switch self {
            case .px(let int):
                return "\(int)px"
            case .percent(let float):
                return "\(float)%"
            case .em(let float):
                return "\(float)em"
            }
        }
    }
    
    case width(Amount)
    case height(Amount)
    
    var name:String {
        switch self {
        case .width: "width"
        case .height: "height"
        }
    }
    
    var value:String {
        switch self {
        case .width(let amount):
            return amount.toString
        case .height(let amount):
            return amount.toString
        }
    }
}

public extension Component {
    /// Add an attribute to the HTML element used to render this component.
    /// - parameter name: The name of the attribute to add.
    /// - parameter value: The value that the attribute should have.
    /// - parameter replaceExisting: Whether any existing attribute with the
    ///   same name should be replaced by the new attribute. Defaults to `true`,
    ///   and if set to `false`, this attribute's value will instead be appended
    ///   to any existing one, separated by a space.
    /// - parameter ignoreValueIfEmpty: Whether the attribute should be ignored if
    ///   its value is `nil` or empty. Defaults to `true`, and if set to `false`,
    ///   only the attribute's name will be rendered if its value is empty.
    func attribute(_ att:CommonAttributes,
                   replaceExisting: Bool = true,
                   ignoreValueIfEmpty: Bool = true) -> Component {
        attribute(Attribute<Any>(
            name: att.name,
            value: att.value,
            replaceExisting: replaceExisting,
            ignoreIfValueIsEmpty: ignoreValueIfEmpty
        ))
    }
}
