//
//  MetalWithDrawingGroupView.swift
//  Drawing
//
//  Created by Nicholas Wright on 11/22/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct ColorCyclingCircle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [self.color(for: value, brightness: 1), self.color(for: value, brightness: 0.5)]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
//                    .strokeBorder(self.color(for: value, brightness: 1), lineWidth: 2)
            }
        }
        .drawingGroup()
        
        // drawingGroup() modifier is helpful to know about to solve performance problems
        // do not rely on it to often.  Wait until you have performance problems!
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}
struct MetalWithDrawingGroupView: View {
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack {
            ColorCyclingCircle(amount: self.colorCycle)
                .frame(width: 300, height: 300)
        
            Slider(value: $colorCycle)
        }
    }
}

struct MetalWithDrawingGroupView_Previews: PreviewProvider {
    static var previews: some View {
        MetalWithDrawingGroupView()
    }
}
