//
//  BordersAndFillsView.swift
//  Drawing
//
//  Created by Nicholas Wright on 11/22/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct BordersAndFillsView: View {
    var body: some View {
        Capsule()
            .strokeBorder(ImagePaint(image: Image("skeletor"), scale: 0.1), lineWidth: 20)
            .frame(width: 300, height: 200)
        
    }
}

struct BordersAndFillsView_Previews: PreviewProvider {
    static var previews: some View {
        BordersAndFillsView()
    }
}
