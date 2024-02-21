//
//  CardGroup.swift
//  PlotTabler
//

import Plot

public struct CardGroup:Component {
    let cards:[Card]
    
    public init(cards: [Card]) {
        self.cards = cards
    }
    
    public func body() async -> Component {
        await DivC("card-group") {
            for card in cards {
                card
            }
        }
    }
}
