//
//  ColorCyclingRectView.swift
//  Drawing
//
//  Created by Nicholas Wright on 11/29/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100
    var gradientStartX = 0.5
    var gradientStartY = 0.0
    var gradientEndX = 0.5
    var gradientEndY = 1.0
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(self.gradient(for: value), lineWidth: 2)
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
    
    func gradient(for value: Int) -> LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [
                    color(for: value, brightness: 1),
                    color(for: value, brightness: 0.5)
                ]
            ),
            startPoint: UnitPoint(x: CGFloat(gradientStartX), y: CGFloat(gradientStartY)),
            endPoint: UnitPoint(x: CGFloat(gradientEndX), y: CGFloat(gradientEndY))
        )
    }
}

struct ColorCyclingRectView: View {
    
    @State private var colorCycle = 0.0
    @State private var startX = 0.5
    @State private var startY = 0.0
    @State private var endX = 0.5
    @State private var endY = 1.0
    
    var body: some View {
        VStack {
            ColorCyclingRectangle(
                amount: colorCycle,
                gradientStartX: startX,
                gradientStartY: startY,
                gradientEndX: endX,
                gradientEndY: endY
            )
                .frame(width: 300, height: 300)
        
            Group {
                Text("Hue")
                Slider(value: $colorCycle)
                    .padding([.horizontal, .bottom])
                
                Text("Start X")
                Slider(value: $startX)
                    .padding([.horizontal, .bottom])
                
                Text("Start Y")
                Slider(value: $startY)
                    .padding([.horizontal, .bottom])
                
                Text("End X")
                Slider(value: $endX)
                    .padding([.horizontal, .bottom])
                
                Text("End Y")
                Slider(value: $endY)
                    .padding([.horizontal])
            }
        }
    }
}

struct ColorCyclingRectView_Previews: PreviewProvider {
    static var previews: some View {
        ColorCyclingRectView()
    }
}
