//
//  IntroToScrollView.swift
//  Day39Lessons
//
//  Created by Nicholas Wright on 11/12/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

// NOTE: ScrollView loads everything at once.  while List loads lazily

import SwiftUI

struct CustomText: View {
    var text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a CustomText")
        self.text = text
    }
}

struct IntroToScrollView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct IntroToScrollView_Previews: PreviewProvider {
    static var previews: some View {
        IntroToScrollView()
    }
}
