//
//  UsingOnDeleteView.swift
//  iExpense
//
//  Created by Nicholas Wright on 11/8/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct UsingOnDeleteView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("\($0)")
                    }
                .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    self.numbers.append(self.currentNumber)
                    self.currentNumber += 1
                }
            }
            .navigationBarItems(leading: EditButton())
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct UsingOnDeleteView_Previews: PreviewProvider {
    static var previews: some View {
        UsingOnDeleteView()
    }
}
