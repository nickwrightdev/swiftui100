//
//  AnimationBindingsView.swift
//  Animations
//
//  Created by Nicholas Wright on 10/30/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct AnimationBindingsView: View {
    
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        print(animationAmount)
        
        return VStack {
            Stepper("Scale amount", value: $animationAmount.animation(
                Animation.easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer()
            
            Button("Tap me") {
                self.animationAmount += 1
            }
            .padding(40)
            .background(Color.purple)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}

struct AnimationBindingsView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationBindingsView()
    }
}
