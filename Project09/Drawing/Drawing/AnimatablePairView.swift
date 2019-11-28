//
//  AnimatablePairView.swift
//  Drawing
//
//  Created by Nicholas Wright on 11/23/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct Checkerboard: Shape {
    var rows: Int
    var cols: Int
    
    public var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(Double(rows), Double(cols))
        }
        set {
            self.rows = Int(newValue.first)
            self.cols = Int(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let rowSize = rect.height / CGFloat(rows)
        let colSize = rect.width / CGFloat(cols)
        
        for row in 0..<rows {
            for col in 0..<cols {
                if (row + col).isMultiple(of: 2) {
                    let startX = colSize * CGFloat(col)
                    let startY = rowSize * CGFloat(row)
                    
                    let rect = CGRect(x: startX, y: startY, width: colSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }
        return path
    }
}
struct AnimatablePairView: View {
    @State private var rows = 4
    @State private var cols = 4
    
    var body: some View {
        Checkerboard(rows: rows, cols: cols)
            .onTapGesture {
                withAnimation(.linear(duration: 3)) {
                    self.rows = 8
                    self.cols = 16
                }
            }
    }
}

struct AnimatablePairView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatablePairView()
    }
}
