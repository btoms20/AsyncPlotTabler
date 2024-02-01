//
//  ActionItemCard.swift
//  PlotTabler
//

import Plot

struct ActionItemCard: Component, ExplicitlySized {
    let size:Column.Size?
    
    init(size:Column.Size? = nil) {
        self.size = size
    }
    
    func body() async -> Component {
        await DivC("card") {
            await DivC("empty") {
                await DivC("empty-img") {
                    SVG(paths: .search)
                        .attribute(.width(.percent(100))) //.attribute(named: "width", value: "100%")
                        .attribute(.height(.percent(100))) //.attribute(named: "height", value: "100%")
                        .attribute(named: "viewBox", value: "-50 -50 124 124")
                        .attribute(named: "stroke-width", value: "2")
                        .attribute(named: "stroke", value: "currentColor")
                        .attribute(named: "fill", value: "none")
                        .attribute(named: "stroke-linecap", value: "round")
                        .attribute(named: "stroke-linejoin", value: "round")
                }
                Paragraph { Text("No results found") }.class("empty-title")
                Paragraph { Text("Try adjusting your search or filter to find what you're looking for.") }.class("empty-subtitle text-secondary")
                await DivC("empty-action") {
                    ButtonLink("Search again", link: "#", icon: .search, style: .standard, theme: .primary)
                }
            }
        }
    }
}
