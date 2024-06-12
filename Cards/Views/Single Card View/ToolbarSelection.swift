//
//  ToolbarSelection.swift
//  Cards
//
//  Created by romashka on 12.06.2024.
//

import Foundation

enum ToolbarSelection: CaseIterable, Identifiable {

    var id: Int {
        hashValue
    }
    case photoModal, frameModal, stickerModal, textModal
}
