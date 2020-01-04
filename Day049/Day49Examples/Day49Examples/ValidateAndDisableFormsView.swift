//
//  ValidateAndDisableFormsView.swift
//  Day49Examples
//
//  Created by Nicholas Wright on 1/4/20.
//  Copyright © 2020 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct ValidateAndDisableFormsView: View {
    
    @State var username = ""
    @State var email = ""
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating account...")
                }
            }
            .disabled(disableForm)
        }
    }
}

struct ValidateAndDisableFormsView_Previews: PreviewProvider {
    static var previews: some View {
        ValidateAndDisableFormsView()
    }
}
