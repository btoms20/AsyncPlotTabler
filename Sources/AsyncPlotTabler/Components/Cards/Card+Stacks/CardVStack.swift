//
//  CardVStack.swift
//  PlotTabler
//

import Plot

public struct CardVStack: Component {
    let margin: Bool
    let content: ComponentGroup
    
    public init(margin:Bool = true, @ComponentBuilder _ content:@escaping () async -> ComponentGroup) async {
        self.margin = margin
        self.content = await content()
    }
    
    /*
     <div class="container-xl">
        ...
     </div>
     */
    public func body() async -> Component {
        await Container(size: .xl) {
            for comp in content.flattenedMembers {
                if comp is CardHStack {
                    comp
                } else {
                    await CardHStack(margin: margin) {
                        comp
                    }
                }
            }
        }
    }
}

//struct VStack: Component {
//    let margin: Bool
//    let content: ComponentGroup
//    
//    init(margin:Bool = true, @ComponentBuilder _ content:@escaping () -> ComponentGroup) {
//        self.margin = margin
//        self.content = content()
//    }
//    
//    /*
//     <div class="container-xl">
//        ...
//     </div>
//     */
//    var body: Component {
//        Container(size: .xl) {
//            for comp in content.flattenedMembers {
//                if comp is HStack {
//                    comp
//                } else {
//                    HStack(margin: margin) {
//                        comp
//                    }
//                }
//            }
//        }
//    }
//}

