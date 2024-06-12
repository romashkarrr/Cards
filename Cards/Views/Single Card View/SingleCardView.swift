//
//  SingleCardView.swift
//  Cards
//
//  Created by romashka on 12.06.2024.
//

import SwiftUI

struct SingleCardView: View {

    @State private var currentModal: ToolbarSelection?
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            Color.yellow
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Done") {
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .bottomBar) {
                       BottomToolbar(modal: $currentModal)
                    }
                }
                .sheet(item: $currentModal) { item in
                    switch item {
                    default:
                        Text(String(describing: item))
                    }
                }
        }
    }
}

#Preview {
    SingleCardView()
}
