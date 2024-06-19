//
//  CardStore.swift
//  Cards
//
//  Created by romashka on 13.06.2024.
//

import SwiftUI

class CardStore: ObservableObject {

    @Published var selectedElement: CardElement?
    @Published var cards: [Card] = []

    func index(for card: Card) -> Int? {
        cards.firstIndex{ $0.id == card.id }
    }

    init(defaultData: Bool = false) {
        if defaultData {
            cards = initialCards
        }
    }

    func remove(_ card: Card) {
        if let index = index(for: card) {
            cards.remove(at: index)
        }
    }
}

