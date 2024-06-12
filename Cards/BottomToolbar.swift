//
//  BottomToolbar.swift
//  Cards
//
//  Created by romashka on 12.06.2024.
//

import SwiftUI

struct BottomToolbar: View {

    @Binding var modal: ToolbarSelection?

    var body: some View {
        HStack {
            ForEach(ToolbarSelection.allCases) { selection in
                Button {
                    modal = selection
                } label: {
                    ToolbarButton(modal: selection)
                }
            }
        }
    }
}

struct ToolbarButton: View {

    private let modalButton: [ToolbarSelection: (text: String, imageName: String)] = [
        .photoModal: ("Photos", "photo"), .frameModal: ("Frames", "square.on.circle"), .stickerModal: ("Stickers", "heart.circle"), .textModal: ("Text", "textformat")
    ]

    let modal: ToolbarSelection

    var body: some View {
        if let text = modalButton[modal]?.text,
           let imageName = modalButton[modal]?.imageName {
            VStack {
                Image(systemName: imageName)
                    .font(.largeTitle)
                Text(text)
            }
            .padding(.top)
        }
    }
}

#Preview {
    BottomToolbar(modal: .constant(.stickerModal))
        .padding()
}
