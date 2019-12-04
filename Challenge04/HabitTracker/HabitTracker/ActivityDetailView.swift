//
//  ActivityDetailView.swift
//  HabitTracker
//
//  Created by Nicholas Wright on 12/3/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct ActivityDetailView: View {
    
    let activity: Activity
    
    var body: some View {
        NavigationView {
            VStack {
                Text(activity.description)
            }
            .navigationBarTitle(activity.title)
        }
    }
}

struct ActivityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let title = "My Hobby"
        let desc = "A simple description"
        let activity = Activity(title: title, description: desc)
        return ActivityDetailView(activity: activity)
    }
}
