//
//  ColorExtensions.swift
//  Cards
//
//  Created by romashka on 13.06.2024.
//

import SwiftUI

extension Color {

    static let colors: [Color] = [
        .green, .red, .blue, .gray, .yellow, .pink, .orange, .purple
    ]

    static func random() -> Color {
        colors.randomElement() ?? .black
    }
}
