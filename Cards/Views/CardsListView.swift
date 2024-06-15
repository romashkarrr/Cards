//
//  CardsListView.swift
//  Cards
//
//  Created by romashka on 12.06.2024.
//

import SwiftUI

struct CardsListView: View {

    @State private var selectedCard: Card?
    @EnvironmentObject var store: CardStore

    var list: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(store.cards) { card in
                    CardThumbnail(card: card)
                        .onTapGesture {
                             selectedCard = card
                        }
                }
            }
        }
    }

    var body: some View {
        list
            .fullScreenCover(item: $selectedCard) { card in
                if let index = store.index(for: card) {
                    SingleCardView(card: $store.cards[index])
                } else {
                    fatalError("Unable to locate selected card")
                }
        }
    }
}

#Preview {
    CardsListView()
        .environmentObject(CardStore(defaultData: true))
}

