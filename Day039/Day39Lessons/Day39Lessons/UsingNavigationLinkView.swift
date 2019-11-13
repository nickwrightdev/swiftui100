//
//  UsingNavigationLinkView.swift
//  Day39Lessons
//
//  Created by Nicholas Wright on 11/12/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct UsingNavigationLinkView: View {
    var body: some View {
        NavigationView {
            List(0..<10) { row in
                NavigationLink(destination: Text("Detail\(row)")) {
                    Text("Hello \(row)")
                }
            }
            .navigationBarTitle("SwiftUI")
        }
    }
}

struct UsingNavigationLinkView_Previews: PreviewProvider {
    static var previews: some View {
        UsingNavigationLinkView()
    }
}
