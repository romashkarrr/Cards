//
//  CardToolbar.swift
//  Cards
//
//  Created by romashka on 13.06.2024.
//

import SwiftUI

struct CardToolbar: ViewModifier {

    @EnvironmentObject var store: CardStore
    @State private var  frameIndex: Int?
    @Binding var card: Card
    @State private var stickerImage: UIImage?
    @Binding var currentModal: ToolbarSelection?
    @Environment(\.dismiss) var dismiss
    @State private var textElement = TextElement()

    var menu: some View {
        Menu {
            Button {
                if UIPasteboard.general.hasImages {
                    if let images = UIPasteboard.general.images {
                        for image in images {
                            card.addElement(uiImage: image)
                        }
                    }
                } else if UIPasteboard.general.hasStrings {
                    if let strings = UIPasteboard.general.strings {
                        for text in strings {
                            card.addElement(text: TextElement(transform: .init(), text: text))
                        }
                    }
                }
            } label: {
                Label("Paste", systemImage: "doc.on.clipboard")
            }
            .disabled(!UIPasteboard.general.hasImages
                      && !UIPasteboard.general.hasStrings)
        } label: {
            Label("Add", systemImage: "ellipsis.circle")
        }
    }

    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    menu
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    BottomToolbar(card: $card, modal: $currentModal)
                }
            }
            .sheet(item: $currentModal) { item in
                switch item {
                case .stickerModal:
                    StikerModal(stickerImage: $stickerImage)
                        .onDisappear {
                            if let stickerImage = stickerImage {
                                card.addElement(uiImage: stickerImage)
                            }
                            stickerImage = nil
                        }
                case .frameModal:
                    FrameModal(frameIndex: $frameIndex)
                        .onDisappear {
                            if let frameIndex {
                                card.update(store.selectedElement, frameIndex: frameIndex)
                            }
                            frameIndex = nil
                        }
                case .textModal:
                    TextModal(textElement: $textElement)
                        .onDisappear {
                            if !textElement.text.isEmpty {
                                card.addElement(text: textElement)
                            }
                            textElement = TextElement()
                        }
                default:
                    Text(String(describing: item))
                }
            }
    }
}



