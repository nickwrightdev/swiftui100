//
//  ContentView.swift
//  iExpense
//
//  Created by Nicholas Wright on 11/8/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var name: String
    
    var body: some View {
        VStack {
            Text("Hello \(name)!")
            Button("Dismiss") {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct ShowingSheetsView: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            self.showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "Nick")
        }
    }
}

struct ShowingSheetsView_Previews: PreviewProvider {
    static var previews: some View {
        ShowingSheetsView()
    }
}
