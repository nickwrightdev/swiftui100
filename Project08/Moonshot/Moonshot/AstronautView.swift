//
//  AstronautView.swift
//  Moonshot
//
//  Created by Nicholas Wright on 11/14/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let flownMissions: [Mission]
    
    var flownMissionsDisplay: String {
        var str = [String]()
        for mission in flownMissions {
            str.append(mission.displayName)
        }
        
        return str.joined(separator: ", ")
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text("Flown In: \(self.flownMissionsDisplay)")
                    
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                }
            }
        }
        .navigationBarTitle(Text(self.astronaut.name), displayMode: .inline)
    }
    
    init(astronaut: Astronaut, allMissions: [Mission]) {
        self.astronaut = astronaut
        
        var matches = [Mission]()
        
        for mission in allMissions {
            for crew in mission.crew {
                if crew.name == astronaut.id {
                    matches.append(mission)
                }
            }
        }
        
        flownMissions = matches
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[0], allMissions: missions)
    }
}
