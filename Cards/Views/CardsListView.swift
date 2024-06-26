//
//  CardsListView.swift
//  Cards
//
//  Created by romashka on 12.06.2024.
//

import SwiftUI

struct CardsListView: View {

    @Environment(\.scenePhase) private var scenePhase
    @State private var selectedCard: Card?
    @EnvironmentObject var store: CardStore

    var list: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(store.cards) { card in
                    CardThumbnail(card: card)
                        .contextMenu {
                            Button(role: .destructive) {
                                store.remove(card)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                        .onTapGesture {
                             selectedCard = card
                        }
                }
            }
        }
    }

    var body: some View {
        VStack {
            list
                .fullScreenCover(item: $selectedCard) { card in
                    if let index = store.index(for: card) {
                        SingleCardView(card: $store.cards[index])
                            .onChange(of: scenePhase) { oldScenePhace, newScenePhase in
                                if newScenePhase == .inactive {
                                    store.cards[index].save()
                                }
                            }
                    } else {
                        fatalError("Unable to locate selected card")
                    }
            }
            Button("Add") {
                selectedCard = store.addCard()
            }
        }
    }
}

#Preview {
    CardsListView()
        .environmentObject(CardStore(defaultData: true))
}

