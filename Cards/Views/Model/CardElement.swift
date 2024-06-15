//
//  CardElement.swift
//  Cards
//
//  Created by romashka on 13.06.2024.
//

import SwiftUI

protocol CardElement {

    var id: UUID { get }
    var transform: Transform { get set }
}

extension CardElement {

    func index(in array: [CardElement]) -> Int? {
        array.firstIndex { $0.id == id }
    }
}

struct ImageElement: CardElement {

    var uiImage: UIImage?
    var id = UUID()
    var transform = Transform()

    var image: Image {
        Image(
            uiImage: uiImage ?? UIImage(named: "error-image") ?? UIImage())
    }
}

struct TextElement: CardElement {

    var id = UUID()
    var transform: Transform
    var text = ""
    var textColor = Color.black
    var textFont = "Gill Sans"
}


