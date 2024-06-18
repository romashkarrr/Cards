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
                    .elementContextMenu(card: $card, element: $element)
                    .resizebleView(transform: $element.transform)
                    .frame(
                        width: element.transform.size.width,
                        height: element.transform.size.height)
            }
        }
        .dropDestination(for: CustomTransfer.self) { items, location in
            print(location)
            Task {
                card.addElements(from: items)
            }
            return !items.isEmpty
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
