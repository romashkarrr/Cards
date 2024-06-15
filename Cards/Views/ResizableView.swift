//
//  ResizableView.swift
//  Cards
//
//  Created by romashka on 12.06.2024.
//

import SwiftUI

struct ResizableView: ViewModifier {

    @State private var scale: CGFloat = 1.0
    @State private var previousRotation: Angle = .zero
    @State private var preciousOffset: CGSize = .zero
    @Binding var transform: Transform

    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                transform.offset = value.translation + preciousOffset
            }
            .onEnded { _ in
                preciousOffset = transform.offset
            }
    }

    var rotationGesture: some Gesture {
        RotationGesture()
            .onChanged { rotation in
                transform.rotation += rotation - previousRotation
                previousRotation = rotation
            }
            .onEnded { _ in
                previousRotation = .zero
            }
    }

    var scaleGesture: some Gesture {
        MagnificationGesture()
            .onChanged { scale in
                self.scale = scale
            }
            .onEnded { scale in
                transform.size.width *= scale
                transform.size.height *= scale
                self.scale = 1.0
            }
    }

    func body(content: Content) -> some View {
        content
            .frame(width: transform.size.width, height: transform.size.height)
            .rotationEffect(transform.rotation)
            .scaleEffect(scale)
            .offset(transform.offset)
            .gesture(dragGesture)
            .gesture(SimultaneousGesture(rotationGesture, scaleGesture))
            .onAppear {
                preciousOffset = transform.offset
            }
    }
}

#Preview {
    RoundedRectangle(cornerRadius: 30.0)
        .foregroundColor(Color.blue)
        .resizebleView(transform: .constant(Transform()))
}

extension View {
    func resizebleView(transform: Binding<Transform> ) -> some View {
        modifier(ResizableView(transform: transform))
    }
}
