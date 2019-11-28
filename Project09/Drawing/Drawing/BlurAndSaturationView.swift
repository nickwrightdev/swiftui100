//
//  BlurAndSaturationView.swift
//  Drawing
//
//  Created by Nicholas Wright on 11/23/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct BlurAndSaturationView: View {
    
    @State private var amount: CGFloat = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                Image("skeletor")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .saturation(Double(amount))
                    .blur(radius: (1 - amount) * 20)
            }
            .frame(width: 300, height: 300)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct BlurAndSaturationView_Previews: PreviewProvider {
    static var previews: some View {
        BlurAndSaturationView()
    }
}
