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

    var content: some View {
        ZStack {
            Group {
                Capsule()
                    .foregroundColor(.yellow)
                Text("ResixebleMe!")
                    .fontWeight(.bold)
                    .font(.system(size: 500))
                    .minimumScaleFactor(0.01)
                    .lineLimit(1)
            }
            .resizebleView()
            Circle()
                .resizebleView()
                .offset(CGSize(width: 50, height: 200))
        }
    }

    var body: some View {
        NavigationStack {
            content
                .modifier(CardToolbar(currentModal: $currentModal))
        }
    }
}

#Preview {
    SingleCardView()
}
