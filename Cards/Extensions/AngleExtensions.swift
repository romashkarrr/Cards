//
//  AngleExtensions.swift
//  Cards
//
//  Created by romashka on 21.06.2024.
//

import SwiftUI

extension Angle: Codable {

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKays.self)
        let degrees = try container.decode(Double.self, forKey: .degrees)
        self.init(degrees: degrees)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKays.self)
        try container.encode(degrees, forKey: .degrees)
    }
}

enum CodingKays: CodingKey {

    case degrees
}
