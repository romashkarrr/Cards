//
//  Card.swift
//  Cards
//
//  Created by romashka on 13.06.2024.
//

import SwiftUI

struct Card: Identifiable {

    let id = UUID()
    var backgroundColor: Color = .yellow
    var elements: [CardElement] = []

    mutating func addElement(uiImage: UIImage) {
        let element = ImageElement(uiImage: uiImage)
        elements.append(element)
    }
}
