//
//  SingleCardView.swift
//  Cards
//
//  Created by romashka on 12.06.2024.
//

import SwiftUI

struct SingleCardView: View {

    @State private var currentModal: ToolbarSelection?
    @Binding var card: Card

    var body: some View {
        NavigationStack {
            CardDetailView(card: $card)
                .modifier(CardToolbar(card: $card, currentModal: $currentModal))
        }
    }
}

#Preview {
    SingleCardView(card: .constant(initialCards[0]))
}
