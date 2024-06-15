//
//  CardStore.swift
//  Cards
//
//  Created by romashka on 13.06.2024.
//

import SwiftUI

class CardStore: ObservableObject {

    @Published var cards: [Card] = []

    func index(for card: Card) -> Int? {
        cards.firstIndex{ $0.id == card.id }
    }

    init(defaultData: Bool = false) {
        if defaultData {
            cards = initialCards
        }
    }
}

