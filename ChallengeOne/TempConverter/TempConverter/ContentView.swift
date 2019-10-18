//
//  ContentView.swift
//  TempConverter
//
//  Created by Nicholas Wright on 10/17/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var temperatureStr = ""
    @State private var inputTempIndex = 1
    @State private var outputTempIndex = 0
    
    let tempStrs = ["celsius", "farhenheit", "kelvin"]
    let tempUnits = [UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin]
    
    var baseTemp: Double? {
        return Double(temperatureStr)
    }
        
    var baseTempUnit: UnitTemperature? {
        return tempUnits[inputTempIndex]
    }
    
    var targetTempUnit: UnitTemperature? {
        return tempUnits[outputTempIndex]
    }
    
    var converted: Measurement<UnitTemperature>? {
        if let inputTemp = baseTemp {
            let inputMeasurement = Measurement(value: inputTemp, unit: baseTempUnit!)
            let outputMeasurement = inputMeasurement.converted(to: targetTempUnit!)
            return outputMeasurement
        }
        return nil
    }
    
    var convertedString: String {
        if let tempVal = converted {
            return String(format:"%.2f", tempVal.value)
        }
        return ""
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Temperature", text: $temperatureStr)
                        .keyboardType(.decimalPad)
                    Picker("Units", selection: $inputTempIndex) {
                        ForEach(0 ..< tempStrs.count) {
                            Text("\(self.tempStrs[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Convert To")) {
                    Picker("Units", selection: $outputTempIndex) {
                        ForEach(0 ..< tempStrs.count) {
                            Text("\(self.tempStrs[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Text("\(convertedString)")
                }
            }
            .navigationBarTitle("TempConverter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
