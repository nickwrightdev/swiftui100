//
//  BlendingMultiplyView.swift
//  Drawing
//
//  Created by Nicholas Wright on 11/23/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct BlendingMultiplyView: View {
    var body: some View {
//        ZStack {
//            Image("skeletor")
//
//            Rectangle()
//                .fill(Color.red)
//                .blendMode(.multiply)
//        }
//        .frame(width: 400, height: 600)
//        .clipped()
        Image("skeletor")
            .colorMultiply(.red)
    }
}

struct BlendingMultiplyView_Previews: PreviewProvider {
    static var previews: some View {
        BlendingMultiplyView()
    }
}
