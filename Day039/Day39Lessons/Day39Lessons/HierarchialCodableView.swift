//
//  HierarchialCodableView.swift
//  Day39Lessons
//
//  Created by Nicholas Wright on 11/12/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

// This just demos hierarchy of Codables.   Can go as
// deep as we need.  

import SwiftUI

struct User: Codable {
    var name: String
    var address: Address
}

struct Address: Codable {
    var street: String
    var city: String
}

struct HierarchialCodableView: View {
    var body: some View {
        Button("Decode JSON") {
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor Swift Avenue",
                    "city": "Nashville"
                }
            }
            """
            
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            
            if let user = try? decoder.decode(User.self, from: data) {
                print(user.address.street)
            }
        }
    }
}

struct HierarchialCodableView_Previews: PreviewProvider {
    static var previews: some View {
        HierarchialCodableView()
    }
}
