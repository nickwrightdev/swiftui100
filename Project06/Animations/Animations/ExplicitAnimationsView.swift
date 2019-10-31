//
//  ExplicitAnimationsView.swift
//  Animations
//
//  Created by Nicholas Wright on 10/30/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct ExplicitAnimationsView: View {
    
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap Me") {
            withAnimation(.easeInOut(duration: 2)) {
                self.animationAmount += 360
            }
        }
        .padding(50)
        .background(Color.purple)
        .foregroundColor(.yellow)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

struct ExplicitAnimationsView_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitAnimationsView()
    }
}
