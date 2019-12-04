//
//  AddActivityView.swift
//  HabitTracker
//
//  Created by Nicholas Wright on 12/3/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct AddActivityView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var activities: Activities
    
    @State private var title: String = ""
    @State private var description: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                
                TextField("Description", text: $description)
            }
            .navigationBarTitle("Add New Activity")
            .navigationBarItems(trailing:
                Button("Save") {
                    self.addNewActivity()
                }
            )
        }
    }
    
    func addNewActivity() {
        let activity = Activity(title: title, description: description)
        activities.items.append(activity)
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        let dummy = Activities()
        return AddActivityView(activities: dummy)
    }
}
