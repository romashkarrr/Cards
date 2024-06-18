//
//  UIImageExtensions.swift
//  Cards
//
//  Created by romashka on 18.06.2024.
//

import SwiftUI

extension UIImage: Transferable {

    public static var transferRepresentation: some
    TransferRepresentation {
        DataRepresentation(importedContentType: .image) { image in
            UIImage(data: image) ?? errorImage
        }
    }

    public static var errorImage: UIImage {
        UIImage(named: "error-image") ?? UIImage()
    }
}
