//
//  Operators.swift
//  Cards
//
//  Created by romashka on 13.06.2024.
//

import Foundation


func + (left: CGSize, right: CGSize) -> CGSize {
    CGSize(
        width: left.width + right.width,
        height: left.height + right.height)
}

func * (left: CGSize, right: CGFloat) -> CGSize {
    CGSize(
        width: left.width * right,
        height: left.height * right)
}

func *= (left: inout CGSize, right: Double) {
    left = CGSize(
        width: left.width * right,
        height: left.height * right)
}

func / (left: CGSize, right: CGFloat) -> CGSize {
    CGSize(
        width: left.width / right,
        height: left.height / right)
}

