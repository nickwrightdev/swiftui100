//
//  DragAndDelayAnimationsView.swift
//  Animations
//
//  Created by Nicholas Wright on 10/31/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct DragAndDelayAnimationsView: View {
    
    let letters = Array("Jesus is my Friend")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count) { num in
                Text(String(self.letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(self.enabled ? Color.blue : Color.red)
                    .offset(self.dragAmount)
                    .animation(Animation.default.delay(Double(num) / 20))
            }
        }
        .gesture(
            DragGesture()
                .onChanged { self.dragAmount = $0.translation }
                .onEnded { _ in
                    self.dragAmount = .zero
                    self.enabled.toggle()
                }
        )
    }
}

struct DragAndDelayAnimationsView_Previews: PreviewProvider {
    static var previews: some View {
        DragAndDelayAnimationsView()
    }
}
