//
//  Activity.swift
//  HabitTracker
//
//  Created by Nicholas Wright on 12/1/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import Foundation

struct Activity: Identifiable, Codable {
    let id = UUID()
    let title: String
    let description: String
}

class Activities: ObservableObject {
    
    @Published var items = [Activity]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try?
                encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            
            if let decoded = try?
                decoder.decode([Activity].self, from: items) {
                self.items = decoded
                return
            }
        }
    }
}
