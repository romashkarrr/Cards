//
//  Shapes.swift
//  Cards
//
//  Created by romashka on 18.06.2024.
//

import SwiftUI

struct Shapes: View {

    static let shapes: [AnyShape] = [
        AnyShape(Circle()), AnyShape(Rectangle()), AnyShape(Cone()),
        AnyShape(Lens())
    ]

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let currentShape = Lens()

    return currentShape
        .stroke(Color.primary,
                style: StrokeStyle(lineWidth: 10, lineJoin: .round))
        .padding()
        .aspectRatio(1, contentMode: .fit)
        .background(Color.yellow)
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        var path = Path()
        path.addLines([
            CGPoint(x: width * 0.13, y: height * 0.2),
            CGPoint(x: width * 0.87, y: height * 0.47),
            CGPoint(x: width * 0.4, y: height * 0.93)
        ])
        path.closeSubpath()
        return path
    }
}

struct Cone: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let radius = min(rect.midX, rect.midY)
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                    radius: radius,
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: 180),
                    clockwise: true)
        path.addLine(to: CGPoint(x: rect.midX, y: rect.height))
        path.addLine(to: CGPoint(x: rect.midX + radius, y: rect.midY))
        path.closeSubpath()
        return path
    }
}

struct Lens: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.midY))
        path.addQuadCurve(
            to: CGPoint(x: rect.width, y: rect.midY),
            control: CGPoint(x: rect.midX, y: 0))
        path.addQuadCurve(
            to: CGPoint(x: 0, y: rect.midY),
            control: CGPoint(x: rect.midX, y: rect.height))
        path.closeSubpath()
        return path
    }
}

