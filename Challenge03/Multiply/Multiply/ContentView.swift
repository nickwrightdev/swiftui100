//
//  ContentView.swift
//  Multiply
//
//  Created by Nicholas Wright on 11/4/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct Question {
    var question: String;
    var answer: String;
}

struct ContentView: View {
    
    @State private var isGameActive = false
    @State private var maxMultiplier = 6
    @State private var numQuestionsSelection = 1
    
    @State private var currentQuestion = 0
    @State private var questionsThisGame = 0
    @State private var isGameOver = false
    
    let numQuestionsOptionsStr = ["5", "10", "20", "all"]
    let numQuestionsOptions = [5, 10, 20, 0]
    
    var body: some View {
        Group {
            if isGameActive {
                if isGameOver {
                    Button("Game Over") {
                        self.isGameActive = false
                    }
                } else {
                    VStack {
                        Text("Multiplying up to \(maxMultiplier)x")
                        Text("\(currentQuestion + 1) of \(questionsThisGame)")
                        Button("Answer") {
                            self.currentQuestion += 1
                            if self.currentQuestion == self.questionsThisGame {
                                self.isGameOver = true
                            }
                        }
                    }
                }
            } else {
                VStack {
                    Stepper(value: $maxMultiplier, in: 6...12) {
                        Text("Multiply up to \(maxMultiplier)")
                    }
                    
                    Picker("How many questions in the next game?", selection: $numQuestionsSelection) {
                        ForEach(0 ..< numQuestionsOptions.count) {
                            Text("\(self.numQuestionsOptions[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Button("Let's Play") {
                        self.questionsThisGame = self.numQuestionsOptions[self.numQuestionsSelection]
                        self.isGameActive = true
                        self.isGameOver = false
                        self.currentQuestion = 0
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
