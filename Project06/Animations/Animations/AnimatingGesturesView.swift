//
//  AnimatingGesturesView.swift
//  Animations
//
//  Created by Nicholas Wright on 10/31/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct AnimatingGesturesView: View {
    
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { self.dragAmount = $0.translation }
                    .onEnded { _ in
                        withAnimation(.spring()) {
                            self.dragAmount = .zero
                        }
                    }
            )
//            .animation(.spring())             // the implicit way
        }
}

struct AnimatingGesturesView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingGesturesView()
    }
}
