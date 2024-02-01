//
//  Card+Footer.swift
//  PlotTabler
//

import Foundation
import Plot

extension Card {
    public struct Footer:Component {
        let content:Component
        let css:String?
        
        public init(@ComponentBuilder _ content:@escaping () async -> Component, class:String? = nil) async {
            self.css = `class`
            self.content = await content()
        }
        
        public func body() async -> Component {
            Div {
                content
            }.class("card-footer\(css.spacePrefixedUnwrap())")
        }
    }
}
