//
//  CardThumbnail.swift
//  Cards
//
//  Created by romashka on 12.06.2024.
//

import SwiftUI

struct CardThumbnail: View {

    let card: Card

    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .foregroundColor(card.backgroundColor)
            .frame(
                width: Settings.thumbailSize.width,
                height: Settings.thumbailSize.height)
    }
}


#Preview {
    CardThumbnail(card: initialCards[0])
}
