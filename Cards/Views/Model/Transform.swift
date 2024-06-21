//
//  Transform.swift
//  Cards
//
//  Created by romashka on 12.06.2024.
//

import SwiftUI


struct Transform {

    var size = CGSize(width: Settings.thumbailSize.width, height: Settings.thumbailSize.height)
    var rotation: Angle = .zero
    var offset: CGSize = .zero
}

extension Transform: Codable {}
