//
//  AddExpenseView.swift
//  iExpense
//
//  Created by Nicholas Wright on 11/9/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var expenses: Expenses
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    @State private var inputError = false
    
    static let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) { item in
                        Text(item)
                    }
                }
                
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
                
            }
            .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing:
                Button("Save") {
                    if let actualAmount = Int(self.amount) {
                        let item = ExpenseItem(name: self.name,
                                               type: self.type,
                                               amount: actualAmount)
                        self.expenses.items.append(item)
                        self.presentationMode.wrappedValue.dismiss()
                    } else {
                        self.inputError = true
                    }
                }
            )
            .alert(isPresented: $inputError) {
                Alert(title: Text("Can't Add That"),
                      message: Text("\(self.amount) is not a valid expense amount."),
                      dismissButton: .default(Text("Try Again")) {
                        self.amount = ""
                        self.inputError = false;
                })
            }
        }
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView(expenses: Expenses())
    }
}
