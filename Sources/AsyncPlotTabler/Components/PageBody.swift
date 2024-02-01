//
//  PageBody.swift
//  PlotTabler
//

//import SwiftUI
import Plot

public struct PageHeader: Component {
    let header: Component
    let actions: Component?
    
    public init(header: String) {
        self.header = H2 { Text(header) }.class("page-title")
        self.actions = nil
    }
    
    public init(@ComponentBuilder header:ContentProvider) async {
        self.header = await header()
        self.actions = nil
    }
    
    public init(@ComponentBuilder header:ContentProvider, @ComponentBuilder actions: ContentProvider) async {
        self.header = await header()
        self.actions = await actions()
    }
    
    /*
     <div class="page-header d-print-none">
       <div class="container-xl">
         <div class="row g-2 align-items-center">
           <div class="col">
             <h2 class="page-title">
               ...
             </h2>
           </div>
         </div>
       </div>
     </div>
     */
    public func body() async -> Component {
        await DivC("page-header d-print-none") {
            await Container(size: .xl) {
                await DivC("row g-2 align-items-center") {
                    await DivC("col") {
                        header
                    }
                    
                    if let actions {
                        await DivC("col-auto ms-auto d-print-none") {
                            await DivC("d-flex") {
                                actions
                            }
                        }
                    }
                }
            }
        }
    }
}


public struct PageBody: Component {
    let content: Component
    
    public init(@ComponentBuilder _ content: ContentProvider) async {
        self.content = await content()
    }
    
    /*
     <div class="page">
         <div class="page-wrapper">
             <div class="page-body" style="padding:0px">
             ...
             </div>
         </div>
     </div>
     <div class="page-body">
        ...
     </div>
     */
    public func body() async -> Component {
        Div {
            content
        }
        .class("page-body")
    }
}


public struct Page: Component {
    let header:PageHeader
    let content: Component
    
    public init(header: PageHeader, @ComponentBuilder content: ContentProvider) async {
        self.header = header
        self.content = await content()
    }
    
    public init(header: PageHeader, content: Component) {
        self.header = header
        self.content = content
    }
    
    /*
    <div class="page-wrapper">
        page-header
        <div class="page-body">
        ...
        </div>
     </div>
     */
    public func body() async -> Component {
        Div {
            header
            await PageBody {
                content
            }
            
        }.class("page-wrapper")
    }
}

public struct Site: Component {
    let header:Component
    let page: Page
    
    public init(header: Component, page: Page) {
        self.header = header
        self.page = page
    }
    
    /*
    <div class="page-wrapper">
        page-header
        <div class="page-body">
        ...
        </div>
     </div>
     */
    public func body() async -> Component {
        Div {
            header
            page
        }.class("page")
    }
}


