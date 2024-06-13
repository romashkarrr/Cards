//
//  CardToolbar.swift
//  Cards
//
//  Created by romashka on 13.06.2024.
//

import SwiftUI

struct CardToolbar: ViewModifier {

    @Binding var currentModal: ToolbarSelection?
    @Environment(\.dismiss) var dismiss

    func body(content: Content) -> some View {
        content
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


