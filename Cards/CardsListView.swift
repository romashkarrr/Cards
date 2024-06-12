//
//  CardsListView.swift
//  Cards
//
//  Created by romashka on 12.06.2024.
//

import SwiftUI

struct CardsListView: View {

    @State private var isPresented = false

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(0..<10) { _ in
                    CardThumbnail()
                        .onTapGesture {
                            isPresented = true
                        }
                }
            }
        }
        .fullScreenCover(isPresented: $isPresented){
            SingleCardView()
        }
    }
}

#Preview {
    CardsListView()
}

