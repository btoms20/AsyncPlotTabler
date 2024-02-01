//
//  Pagination.swift
//  PlotTabler
//

import Plot

public struct Pagination: Component {
    public struct Item {
        let url:URLRepresentable
        let title:String
        let subtitle:String
        let disabled:Bool
    }
    
    public enum Style {
        case regular
        case bounded(count:Int = 2)
        case previousNext(prev:Item, next:Item)
    }
    
    let style:Style
    let textLabels:Bool
    let currentPage:Int
    let totalPages:Int
    
    public init(style:Style = .regular, textLabels:Bool = true, currentPage: Int = 1, totalPages:Int = 1) {
        self.style = style
        self.textLabels = textLabels
        // First ensure that total pages is at least 1
        self.totalPages = max(1, totalPages)
        // Clamp current page between 1 and total pages.
        self.currentPage = max(1, min(currentPage, totalPages))
    }
    
    public enum SegmentItem {
        case dot
        case pageLink(Int)
        
        func buildComponent(currentPage:Int) async -> Component {
            switch self {
            case .dot:
                await Element(name: "li") {
                    Plot.Link(url: "") {
                        await Span(".")
                            .style("font-weight:900")
                    }
                    .class("page-link")
                    .style("margin-left:-8px; margin-right:-8px")
                }
                .class("page-item")
                .class("disabled")
            case .pageLink(let pageNum):
                await Element(name: "li") {
                    Plot.Link(url: "#") {
                        Text("\(pageNum)")
                    }
                    .class("page-link")
                }
                .class("page-item")
                .class(pageNum == currentPage ? "active" : "")
            }
        }
    }
    
    var getSegments:[SegmentItem] {
        switch self.style {
        case .regular:
            return (1...totalPages).map { SegmentItem.pageLink($0) }
        case .bounded(let boundedCount):
            if totalPages < (boundedCount + 2) * 2 { return (1...totalPages).map { SegmentItem.pageLink($0) } }
            
            // Otherwise lets drop some pages...
            if currentPage <= boundedCount || currentPage > totalPages - boundedCount {
                // << < 1 2 3 . . 7 8 9 > >>
                var items = (1...(boundedCount + 1)).map { SegmentItem.pageLink($0) }
                items.append(.dot)
                items.append(.dot)
                items.append(contentsOf: ((totalPages - boundedCount)...totalPages).map { SegmentItem.pageLink($0) } )
                return items
            } else {
                // << < . . 3 4 [ 5 ] 6 7 . . > >>
                var items:[SegmentItem] = []
                if currentPage - (boundedCount + 1) <= 1 {
                    if currentPage - (boundedCount + 1) == 1 {
                        items.append(.pageLink(1))
                    }
                } else {
                    items.append(contentsOf: [.dot, .dot])
                }
                items.append(contentsOf:
                    ((currentPage - boundedCount)...(currentPage + boundedCount)).map { SegmentItem.pageLink($0) }
                )
                
                if currentPage + boundedCount + 1 >= totalPages {
                    if currentPage + boundedCount + 1 == totalPages {
                        items.append(.pageLink(totalPages))
                    }
                } else {
                    items.append(contentsOf: [.dot, .dot])
                }
                
                //items.append(contentsOf: currentPage + boundedCount + 1 == totalPages ? [.pageLink(totalPages)] : [.dot, .dot])
                return items
            }
        case .previousNext:
            return []
        }
    }
    
    var needsFirstLastComponents:Bool {
        switch self.style {
        case .regular:
            return false
        case .bounded(let boundedCount):
            if totalPages < (boundedCount + 1) * 2 { return false }
            
            if currentPage <= boundedCount || currentPage > totalPages - boundedCount {
                return false
            } else {
                return true
            }
        case .previousNext:
            return false
        }
    }
    
    public func body() async -> Component {
        await Element(name: "ul") {
            
            if case .previousNext(let prev, let next) = style {
                
                await pageLinkLabel(item: prev, isPrevious: true)
                
                await pageLinkLabel(item: next, isPrevious: false)
                
            } else {
                
                if needsFirstLastComponents {
                    // Jump to first page
                    await navLinkLabel(url: "#", leadingText: false, text: textLabels ? "first" : nil, icon: .chevrons_left, isDisabled: currentPage == 1)
                }
                
                // Previous Page Icon / Link
                await navLinkLabel(url: "#", leadingText: false, text: textLabels ? "prev" : nil, icon: .chevron_left, isDisabled: currentPage == 1)
                
                for segment in getSegments {
                    await segment.buildComponent(currentPage: currentPage)
                }
                
                // Next Page Icons / Link
                await navLinkLabel(url: "#", leadingText: true, text: textLabels ? "next" : nil, icon: .chevron_right, isDisabled: currentPage == totalPages)
                
                if needsFirstLastComponents {
                    // Jump to last page
                    await navLinkLabel(url: "#", leadingText: true, text: textLabels ? "last" : nil, icon: .chevrons_right, isDisabled: currentPage == totalPages)
                }
            }
            
        }.class("pagination")
    }

    
    func navLinkLabel(url:URLRepresentable, leadingText:Bool, text:String?, icon:Icons, isDisabled:Bool) async -> Component {
        await Element(name: "li") {
            disableComponentIfNecessary(
                Plot.Link(url: url) {
                    if leadingText, let text { Text(text) }
                    SVGIcon(icon: icon)
                    if !leadingText, let text { Text(text) }
                }
                .class("page-link")
            , isDisabled: isDisabled)
        }
        .class("page-item")
        .class(isDisabled ? "disabled" : "")
    }
    
    func pageLinkLabel(item:Item, isPrevious:Bool) async -> Component {
        await Element(name: "li") {
            disableComponentIfNecessary(
                Plot.Link(url: item.url) {
                    await DivC("page-item-subtitle") { Text(item.subtitle) }
                    await DivC("page-item-title") { Text(item.title) }
                }
                .class("page-link")
            , isDisabled: item.disabled)
        }
        .class("page-item")
        .class(isPrevious ? "page-prev" : "page-next")
        .class(item.disabled ? "disabled" : "")
    }
    
    func disableComponentIfNecessary(_ comp:Component, isDisabled:Bool) -> Component {
        if !isDisabled { return comp }
        return comp
            .attribute(named: "tabindex", value: "-1")
            .attribute(named: "aria-disabled", value: "true")
    }
}
