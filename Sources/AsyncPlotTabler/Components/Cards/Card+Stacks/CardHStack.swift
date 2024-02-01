//
//  CardHStack.swift
//  PlotTabler
//

import Plot


public struct Row:Component {
    let g:Int?
    let alignItemsCenter:Bool
    let content:Component
    
    public init(g:Int? = nil, alignItemsCenter: Bool = false, @ComponentBuilder content: ContentProvider) async {
        self.g = g
        self.alignItemsCenter = alignItemsCenter
        self.content = await content()
    }
    
    var gCSS:String {
        if let g {
            return "g-\(g)"
        } else {
            return ""
        }
    }
    
    public func body() async -> Component {
        Div {
            content
        }
        .class("row")
        .class(gCSS)
        .class(alignItemsCenter ? "align-items-center" : "")
    }
}

public struct CardRow:Component {
    let content:Component
    
    public init(@ComponentBuilder _ content: ContentProvider) async {
        self.content = await content()
    }
    
    public func body() async -> Component {
        await Row {
            content
        }.class("row-cards")
    }
}

public struct Column: Component, ExplicitlySized {
    public enum Size {
        case full(Width)
        case small(Width)
        case medium(Width)
        case large(Width)
        case xlarge(Width)
        
        var css:String {
            switch self {
            case .full(let size):
                return "col\(size.css)"
            case .small(let size):
                return "col-sm\(size.css)"
            case .medium(let size):
                return "col-md\(size.css)"
            case .large(let size):
                return "col-lg\(size.css)"
            case .xlarge(let size):
                return "col-xl\(size.css)"
            }
        }
    }
    public enum Width {
        case full
        case num(Int)
        
        var css:String {
            switch self {
            case .full: return ""
            case .num(let n):
                return "-\(max(1, min(12, n)))"
            }
        }
    }
    
    // Hacky conformance to ExplicitlySized protocol
    var size:Size? {
        self.sizes.first(where: { if case .large = $0 { return true } else { return false } } )
    }
    
    let auto:Bool
    let sizes:[Size]
    let content:Component
    
    public init(auto:Bool = false, @ComponentBuilder _ content:@escaping () async -> Component) async {
        self.auto = auto
        self.sizes = [.full(.full)]
        self.content = await content()
    }
    
    public init(size:Size?..., @ComponentBuilder content:@escaping () async -> Component) async {
        self.auto = false
        self.sizes = size.compactMap({$0}).isEmpty ? [.full(.full)] : size.compactMap({$0})
        self.content = await content()
    }
    
    public func body() async -> Component {
        Div {
            content
        }
        .class(auto == true ? "col-auto" : "")
        .class(sizes.map { $0.css }.joined(separator: " "))
    }
}


public struct CardHStack: Component {
    let columns:Int = 12
    let margin:Bool
    
    let content: ComponentGroup
    
    let defaultSizeLg: Column.Size
    let defaultSizeMd: Column.Size?
    
    public init(margin:Bool = true, @ComponentBuilder _ content:@escaping () async -> ComponentGroup) async {
        // Store the default params
        //self.columns = columns
        self.margin = margin
        
        // Build the inner components
        self.content = await content()
        
        let members = self.content.flattenedMembers
        //print("Members: \(self.content.members.count)")
        //print("Flattened: \(members.count)")
        
        // Allocate the available Columns to the components within the HStack
        if members.isEmpty {
            self.defaultSizeLg = .full(.full)
            self.defaultSizeMd = nil
        } else {
            // Attempt to layout members in weighted columns respecting desired size if set...
            var unitsAvailable = columns
            var explicitlySized = 0
            members.forEach { comp in
                if let card = comp as? ExplicitlySized {
                    if let size = card.size {
                        // If the card has a size set, then subtract it from the unitsAvailable
                        switch size {
                        case .large(.num(let val)):
                            unitsAvailable -= val
                            explicitlySized += 1
                        default:
                            return
                        }
                    }
                }
            }
            
            let undefinedCards = members.count - explicitlySized
            if undefinedCards > 0 {
                let equalDist = max(1, (unitsAvailable / undefinedCards))
                self.defaultSizeLg = .large(.num(equalDist))
                self.defaultSizeMd = .medium(.num(min(columns, equalDist * 2)))
            } else {
                self.defaultSizeLg = .full(.full)
                self.defaultSizeMd = nil
            }
        }
    }
    
    func sizeMd(_ item:Component) -> Column.Size? {
        if let card = item as? ExplicitlySized {
            if let size = card.size {
                switch size {
                case .medium:
                    return size
                case .large(.num(let val)):
                    return .medium(.num(min(self.columns, val * 2)))
                default:
                    break
                }
            }
        }
        return defaultSizeMd
    }
    
    func sizeLg(_ item:Component) -> Column.Size? {
        if let card = item as? ExplicitlySized {
            if let size = card.size {
                switch size {
                case .large:
                    return size
                default:
                    break
                }
            }
        }
        return defaultSizeLg
    }
    
    /*
     <div class="container-xl">
       <div class="row row-cards">
         ...
       </div>
     </div>
     */
    public func body() async -> Component {
        //Container(size: .xl) {
            await CardRow {
                for item in content.flattenedMembers {
                    if item is Column {
                        item
                    } else {
                        await Column(size: sizeMd(item), sizeLg(item)) {
                            item
                        }
                        .class(margin ? "mb-3" : "")
                    }
                    //.style(margin ? "margin:16px 0px 16px 0px;" : "")
                }
            }
        //}
    }
}

extension ComponentGroup {
    var flattenedMembers:[Component] {
        var mems:[Component] = []
        for m in self.members {
            if let cg = m as? ComponentGroup {
                mems.append(contentsOf: cg.members)
            } else {
                mems.append(m)
            }
        }
        return mems
    }
}


//struct HStack: Component {
//    let columns:Int = 12
//    let margin:Bool
//    
//    let content: ComponentGroup
//    
//    let defaultSizeLg: Column.Size
//    let defaultSizeMd: Column.Size?
//    
//    init(margin:Bool = true, @ComponentBuilder _ content:@escaping () -> ComponentGroup) {
//        // Store the default params
//        //self.columns = columns
//        self.margin = margin
//        
//        // Build the inner components
//        self.content = content()
//        
//        let members = self.content.flattenedMembers
//        //print("Members: \(self.content.members.count)")
//        //print("Flattened: \(members.count)")
//        
//        // Allocate the available Columns to the components within the HStack
//        if members.isEmpty {
//            self.defaultSizeLg = .full(.full)
//            self.defaultSizeMd = nil
//        } else {
//            // Attempt to layout members in weighted columns respecting desired size if set...
//            var unitsAvailable = columns
//            var explicitlySized = 0
//            members.forEach { comp in
//                if let card = comp as? ExplicitlySized {
//                    if let size = card.size {
//                        // If the card has a size set, then subtract it from the unitsAvailable
//                        switch size {
//                        case .large(.num(let val)):
//                            unitsAvailable -= val
//                            explicitlySized += 1
//                        default:
//                            return
//                        }
//                    }
//                }
//            }
//            
//            let undefinedCards = members.count - explicitlySized
//            if undefinedCards > 0 {
//                let equalDist = max(1, (unitsAvailable / undefinedCards))
//                self.defaultSizeLg = .large(.num(equalDist))
//                self.defaultSizeMd = .medium(.num(min(columns, equalDist * 2)))
//            } else {
//                self.defaultSizeLg = .full(.full)
//                self.defaultSizeMd = nil
//            }
//        }
//    }
//    
//    func sizeMd(_ item:Component) -> Column.Size? {
//        if let card = item as? ExplicitlySized {
//            if let size = card.size {
//                switch size {
//                case .medium:
//                    return size
//                case .large(.num(let val)):
//                    return .medium(.num(min(self.columns, val * 2)))
//                default:
//                    break
//                }
//            }
//        }
//        return defaultSizeMd
//    }
//    
//    func sizeLg(_ item:Component) -> Column.Size? {
//        if let card = item as? ExplicitlySized {
//            if let size = card.size {
//                switch size {
//                case .large:
//                    return size
//                default:
//                    break
//                }
//            }
//        }
//        return defaultSizeLg
//    }
//    
//    /*
//     <div class="container-xl">
//       <div class="row row-cards">
//         ...
//       </div>
//     </div>
//     */
//    var body: Component {
//        Row {
//            for item in content.flattenedMembers {
//                if item is Column {
//                    item
//                } else {
//                    Column(size: sizeMd(item), sizeLg(item)) {
//                        item
//                    }
//                    //.class(margin ? "mb-3" : "")
//                }
//                //.style(margin ? "margin:16px 0px 16px 0px;" : "")
//            }
//        }
//    }
//}
