//
//  CardsListView.swift
//  Cards
//
//  Created by romashka on 12.06.2024.
//

import SwiftUI

struct CardsListView: View {

    @State private var isPresented = false

    var list: some View {
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
    }

    var body: some View {
        list
        .fullScreenCover(isPresented: $isPresented){
            SingleCardView()
        }
    }
}

#Preview {
    CardsListView()
}

