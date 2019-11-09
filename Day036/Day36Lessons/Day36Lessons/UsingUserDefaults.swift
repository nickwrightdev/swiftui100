//
//  UsingUserDefaults.swift
//  iExpense
//
//  Created by Nicholas Wright on 11/8/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct UsingUserDefaults: View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            self.tapCount += 1
            UserDefaults.standard.set(self.tapCount, forKey: "Tap")
        }
    }
}

struct UsingUserDefaults_Previews: PreviewProvider {
    static var previews: some View {
        UsingUserDefaults()
    }
}
