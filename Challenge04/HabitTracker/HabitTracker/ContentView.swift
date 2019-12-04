//
//  ContentView.swift
//  HabitTracker
//
//  Created by Nicholas Wright on 12/1/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var activities = Activities()
    
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationView {
            List(activities.items) { activity in
                NavigationLink(destination: ActivityDetailView(activity: activity)) {
                    HStack {
                        Text(activity.title)
                    }
                }
            }
            .navigationBarTitle("Habit Tracker")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingAddActivity = true
                }) {
                    Image(systemName: "plus")
                }
            )
        }
        .sheet(isPresented: $showingAddActivity) {
            AddActivityView(activities: self.activities)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
