//
//  TextExtensions.swift
//  Cards
//
//  Created by romashka on 13.06.2024.
//

import SwiftUI


extension Text {
    func scalableText(font: Font = Font.system(size: 1000)) -> some View {
        self
            .font(font)
            .minimumScaleFactor(0.01)
            .lineLimit(1)
    }
}
