//
//  Card+Image.swift
//  PlotTabler
//

import Foundation
import Plot

extension Card {
    public struct Image {
        public enum Position {
            case top
            case bottom
            case leading
            case trailing
            
            var imageCSS:String {
                switch self {
                case .top: ""
                case .bottom: ""
                case .leading: "card-img-start"
                case .trailing: "card-img-end"
                }
            }
            var layoutCSS:String {
                switch self {
                case .top: ""
                case .bottom: ""
                case .leading: ""
                case .trailing: " order-md-last"
                }
            }
        }
        
        let src:URLRepresentable
        let size:CGSize
        let description:String?
        let position:Position
        
        public init(src:URLRepresentable, size:CGSize, position: Position, description:String? = nil) {
            self.src = src
            self.size = size
            self.position = position
            self.description = description
        }
    }
    
    struct ImageComponent:Component {
        let image:Card.Image
        @ComponentBuilder let content:Component
        
        func body() async -> Component {
            switch image.position {
            case .leading, .trailing:
                return await ComponentGroup {
                    await DivC("row row-0") {
                        await DivC("col-3\(image.position.layoutCSS)") {
                            await Element(name: "img") { }
                                .attribute(named: "src", value: image.src.description)
                                .attribute(named: "alt", value: image.description ?? "")
                                .class("w-100 h-100 object-cover")
                                .class(image.position.imageCSS)
                        }
                        await DivC("col") {
                            content
                        }
                    }
                }
            case .top:
                return await ComponentGroup {
                    /*
                     <div class="img-responsive img-responsive-21x9 card-img-top" style="background-image: url(./static/photos/home-office-desk-with-macbook-iphone-calendar-watch-and-organizer.jpg)"></div>
                     */
                    await DivC("img-responsive img-responsive-21x9 card-img-top") { }
                        .attribute(named: "style", value: "background-image:url(\(image.src))")
                    content
                }
            case .bottom:
                return await ComponentGroup {
                    content
                    await DivC("img-responsive img-responsive-21x9 card-img-bottom") { }
                        .attribute(named: "style", value: "background-image:url(\(image.src))")
                }
            }
        }
    }
}
