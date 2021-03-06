//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Nicholas Wright on 10/18/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct FlagImage: View {
    var image: String
    
    var body: some View {
        Image(image)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var score = 0
    @State private var scoreTitle = ""
    @State private var alertMessage = ""
    @State private var countries = ["Estonia",
                                    "France",
                                    "Germany",
                                    "Ireland",
                                    "Italy",
                                    "Nigeria",
                                    "Poland",
                                    "Russia",
                                    "Spain",
                                    "UK",
                                    "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var flagAnimationAmounts = [0.0, 0.0, 0.0]
    @State private var flagOpacityAmounts = [1.0, 1.0, 1.0]
    @State private var flagScaleAmounts: [CGFloat] = [1.0, 1.0, 1.0]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]),
                           startPoint: .top,
                           endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 40) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0..<3) { number in
                    Button(action: {
                        withAnimation {
                            if number == self.correctAnswer {
                                self.flagAnimationAmounts[number] += 360
                            } else {
                                self.flagScaleAmounts[self.correctAnswer] = 1.5
                            }
                            for index in 0..<self.flagOpacityAmounts.count {
                                self.flagOpacityAmounts[index] = (index == self.correctAnswer) ? 1.0 : 0.25
                            }
                        }
                        self.flagTapped(number)
                    }) {
                        FlagImage(image: self.countries[number])
                    }
                    .rotation3DEffect(.degrees(self.flagAnimationAmounts[number]), axis: (x: 0, y: 1, z: 0))
                    .opacity(self.flagOpacityAmounts[number])
                    .scaleEffect(self.flagScaleAmounts[number])
                }
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle),
                  message: Text("\(self.alertMessage) Your score is \(self.score)."),
                  dismissButton: .default(Text("Countinue")) {
                self.askQuestion()
            })
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            alertMessage = "Well done!"
            score += 100
        } else {
            scoreTitle = "Wrong"
            alertMessage = "That is the flag of \(countries[number])."
            score -= 100
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        resetInterface()
    }
    
    func resetInterface() {
        for index in 0..<self.flagOpacityAmounts.count {
            flagOpacityAmounts[index] = 1.0
            flagScaleAmounts[index] = 1.0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
