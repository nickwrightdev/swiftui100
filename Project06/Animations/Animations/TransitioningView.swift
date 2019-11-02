//
//  TransitioningViews.swift
//  Animations
//
//  Created by Nicholas Wright on 11/1/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

struct TransitioningView: View {
    
    @State private var isShowingBox = false
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    self.isShowingBox.toggle()
                }
            }
            
            if isShowingBox {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width:200, height: 200)
//                    .transition(.scale)
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
                    .transition(.pivot)
            }
        }
    }
}

struct TransitioningView_Previews: PreviewProvider {
    static var previews: some View {
        TransitioningView()
    }
}
