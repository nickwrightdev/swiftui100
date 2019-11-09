//
//  IntroToObservableObjectsView.swift
//  iExpense
//
//  Created by Nicholas Wright on 11/8/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Nick"
    @Published var lastName = "Wright"
}

struct ObservableObjectsView: View {
    @ObservedObject var user = User()
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")

            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}

struct ObservableObjectsView_Previews: PreviewProvider {
    static var previews: some View {
        ObservableObjectsView()
    }
}
