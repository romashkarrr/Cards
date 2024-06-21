//
//  TextModal.swift
//  Cards
//
//  Created by romashka on 21.06.2024.
//

import SwiftUI

struct TextModal: View {

    @Environment(\.dismiss) var dismiss
    @Binding var textElement: TextElement

    var body: some View {
        let onCommit = {
            dismiss()
        }
        TextField("Enter text", text: $textElement.text, onCommit: onCommit)
        .padding(20)
    }
}

#Preview {
    TextModal(textElement: .constant(TextElement()))
}
