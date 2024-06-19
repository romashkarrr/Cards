//
//  FrameModal.swift
//  Cards
//
//  Created by romashka on 19.06.2024.
//

import SwiftUI

struct FrameModal: View {

    @Environment(\.dismiss) var dismiss
    @Binding var frameIndex: Int?

    private let columns = [
        GridItem(.adaptive(minimum: 120), spacing: 10)
    ]

    private let style = StrokeStyle(lineWidth: 5, lineJoin: .round)

    var body: some View {
        ScrollView {
            LazyVGrid( columns: columns) {
                ForEach(0..<Shapes.shapes.count, id: \.self) { index in
                    Shapes.shapes[index]
                        .stroke(Color.primary, style: style)
                        .background(Shapes.shapes[index].fill(Color.secondary))
                        .frame(width: 100, height: 120)
                        .padding()
                        .onTapGesture {
                            frameIndex = index
                            dismiss()
                        }
                }
            }
        }
        .padding(5)
    }
}

#Preview {
    FrameModal(frameIndex: .constant(nil))
}
