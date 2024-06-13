//
//  CardThumbnail.swift
//  Cards
//
//  Created by romashka on 12.06.2024.
//

import SwiftUI

struct CardThumbnail: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .foregroundColor(.random())
            .frame(
                width: Settings.thumbailSize.width,
                height: Settings.thumbailSize.height)
    }
}


#Preview {
    CardThumbnail()
}
