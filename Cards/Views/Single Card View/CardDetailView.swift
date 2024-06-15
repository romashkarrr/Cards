//
//  CardDetailView.swift
//  Cards
//
//  Created by romashka on 15.06.2024.
//

import SwiftUI

struct CardDetailView: View {

    @EnvironmentObject var store: CardStore
    @Binding var card: Card

    var body: some View {
        ZStack {
            card.backgroundColor
            ForEach($card.elements, id: \.id) { $element in
                CardElementView(element: element)
                    .resizebleView(transform: $element.transform)
                    .frame(
                        width: element.transform.size.width,
                        height: element.transform.size.height)
            }
        }
    }
}

struct CardDetailPreview: View {
    @EnvironmentObject var store: CardStore
    var body: some View {
        CardDetailView(card: $store.cards[0])
    }
}

#Preview {
    CardDetailPreview()
        .environmentObject(CardStore(defaultData: true))
}
