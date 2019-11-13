//
//  ContentView.swift
//  Day39Lessons
//
//  Created by Nicholas Wright on 11/12/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct ResizingImagesView: View {
    var body: some View {
        VStack {
            GeometryReader { geo in
                Image("skeletor")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: 300)
            }
        }
    }
}

struct ResizingImagesView_Previews: PreviewProvider {
    static var previews: some View {
        ResizingImagesView()
    }
}
