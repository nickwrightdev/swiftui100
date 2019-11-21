//
//  ContentView.swift
//  Drawing
//
//  Created by Nicholas Wright on 11/20/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct DrawingPathsView: View {
    var body: some View {
        // draws a triangle
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
        }
        .stroke(Color.blue.opacity(0.25), style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
    }
}

struct DrawingPathsView_Preview: PreviewProvider {
    static var previews: some View {
        DrawingPathsView()
    }
}
