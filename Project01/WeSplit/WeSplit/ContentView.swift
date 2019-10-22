//
//  ContentView.swift
//  WeSplit
//
//  Created by Nicholas Wright on 10/13/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeopleStr = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var numPeopleFromTextField: Double? {
        if let peopleCount = Double(numberOfPeopleStr) {
            // no reason to split if less 1 or less
            if peopleCount > 1 {
                return peopleCount
            }
        }
        return nil
    }
    
    var totalPerPerson: Double {
        if let peopleCount = numPeopleFromTextField {
            return totalBill / peopleCount
        }
        return totalBill        // just return the full amount owed
    }
    
    var totalBill: Double {
        let orderAmount = Double(checkAmount) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentage])
        let tipValue = orderAmount / 100 * tipSelection
        return orderAmount + tipValue
    }
    
    var isZeroTip: Bool {
        Double(tipPercentages[tipPercentage]) == 0
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    TextField("Number of People", text: $numberOfPeopleStr)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Total bill including tip")) {
                    Text("$\(totalBill, specifier: "%.2f")")
                        .foregroundColor(isZeroTip ? .red : .primary)
                }
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
