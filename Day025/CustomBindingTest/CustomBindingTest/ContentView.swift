//
//  ContentView.swift
//  CustomBindingTest
//
//  Created by Nicholas Wright on 10/22/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var agreedToTerms = false
    @State var agreedToPrivacyPolicy = false
    @State var agreedToEmails = false
    
    var body: some View {
        let agreedToAll = Binding<Bool>(
            get: {
                self.agreedToTerms && self.agreedToPrivacyPolicy && self.agreedToPrivacyPolicy
            },
            set: {
                self.agreedToTerms = $0
                self.agreedToPrivacyPolicy = $0
                self.agreedToEmails = $0
            }
        )
            
        return VStack {
            Form {
                Toggle(isOn: $agreedToTerms) {
                    Text("Agree to terms")
                }
                Toggle(isOn: $agreedToPrivacyPolicy) {
                    Text("Agree to privacy policy")
                }
                Toggle(isOn: $agreedToEmails) {
                    Text("Agree to emails")
                }
                Toggle(isOn: agreedToAll) {
                    Text("Agree to all")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
