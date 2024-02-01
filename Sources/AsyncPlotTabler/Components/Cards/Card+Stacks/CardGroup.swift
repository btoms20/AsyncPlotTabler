//
//  CardGroup.swift
//  PlotTabler
//

import Plot

struct CardGroup:Component {
    let cards:[Card]
    
    func body() async -> Component {
        await DivC("card-group") {
            for card in cards {
                card
            }
        }
    }
}
