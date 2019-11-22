//
//  ContentView.swift
//  Moonshot
//
//  Created by Nicholas Wright on 11/13/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAstronautNames = false
    
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts, allMissions: self.missions)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text((self.showingAstronautNames) ? self.getAstronautNames(from: mission) : mission.formattedLaunchDate)
                    }
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing:
                Button((self.showingAstronautNames) ? "Dates" : "Astronauts") {
                    self.showingAstronautNames.toggle()
                }
            )
        }
    }
    
    func getAstronautNames(from mission: Mission) -> String {
        var astronautNames = [String]()
        
        for astro in mission.crew {
            if let match = astronauts.first(where: { $0.id == astro.name }) {
                astronautNames.append(match.name)
            }
        }
        
        return astronautNames.joined(separator: ", ")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
