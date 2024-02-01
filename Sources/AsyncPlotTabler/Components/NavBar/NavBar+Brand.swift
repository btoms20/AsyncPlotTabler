//
//  NavBarBrand.swift
//  PlotTabler
//

import Plot

extension NavBar {
    public struct Brand:Component {
        let contents:Component
        let subTitle:String?
        
        public init(title:String, subTitle:String? = nil) {
            self.contents = Text(title)
            self.subTitle = subTitle
        }
        
        public init(imageURL:String, subTitle:String? = nil) {
            self.subTitle = subTitle
            self.contents = Image(url: imageURL, description: "Brand Logo")
                .class("navbar-brand-image")
                //.style("width:110px; height:32px")
                .style("height:32px")
        }
        
        /*
         <h1 class="navbar-brand navbar-brand-autodark d-none-navbar-horizontal pe-0 pe-md-3">
           <a href=".">
             <img src="./static/logo.svg" width="110" height="32" alt="Tabler" class="navbar-brand-image">
           </a>
         </h1>
         */
        public func body() async -> Component {
            await ComponentGroup {
                H1 {
                    Link(url: "#") {
                        contents
                    }
                    if let subTitle {
                        Span {
                            Link(url: "#") {
                                Text(subTitle)
                            }
                            .textColor(.secondary)
                            .margin(.leading(4))
                        }
                    }
                }
                .class("navbar-brand navbar-brand-autodark d-none-navbar-horizontal pe-0 pe-md-3")
            }
        }
    }
}
