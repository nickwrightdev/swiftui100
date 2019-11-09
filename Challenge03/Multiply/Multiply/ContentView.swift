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
    var answer: Int;
}

struct ContentView: View {
    
    @State private var isGameActive = false
    @State private var maxMultiplier = 6
    @State private var numQuestionsSelection = 1
    
    @State private var currentQuestionIndex = 0
    @State private var questionsThisGame = 0
    @State private var scoreThisGame = 0
    @State private var questions = [Question]()
    @State private var isGameOver = false
    @State private var currentAnswer = ""
    
    let numQuestionsOptionsStr = ["5", "10", "20", "all"]
    let numQuestionsOptions = [5, 10, 20, 0]
    
    var currentQuestion: Question? {
        return questions[currentQuestionIndex]
    }
    
    var body: some View {
        Group {
            if isGameActive {
                if isGameOver {
                    Text("\(scoreThisGame) / \(currentQuestionIndex)")
                    
                    Button("Game Over") {
                        self.isGameActive = false
                    }
                } else {
                    VStack {
                        Text("Multiplying up to \(maxMultiplier)x")
                        Text("\(currentQuestionIndex + 1) of \(questionsThisGame)")
                        Text("\(currentQuestion!.question)")
                        TextField("Answer: ", text: $currentAnswer)
                        Button("Answer", action: answerQuestion)
                        Text("\(scoreThisGame) / \(currentQuestionIndex)")
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
                    
                    Button("Let's Play", action: startGame)
                }
            }
        }
    }
    
    func startGame() {
        questionsThisGame = numQuestionsOptions[numQuestionsSelection]
        scoreThisGame = 0
        createQuestions()
        isGameActive = true
        isGameOver = false
        currentQuestionIndex = 0
    }
    
    func createQuestions() {
        questions = [Question]()
        for i in 1...maxMultiplier {
            for j in 1...maxMultiplier {
                let questionStr = "\(i) X \(j)"
                let answer = i * j
                let elem = Question(question: questionStr, answer: answer)
                questions.append(elem)
            }
        }
        questions.shuffle()
        if questionsThisGame == 0 {
            questionsThisGame = questions.count
        }
    }
    
    func answerQuestion() {
        guard let current = currentQuestion else {
            return;
        }
        
        
        if let playerAnswer = Int(currentAnswer) {
            if playerAnswer == current.answer {
                scoreThisGame += 1
                print("correct!")
            } else {
                print("wrong")
            }
        } else {
            print("what are you doing?")
        }
        
        nextQuestion()
    }
    
    func nextQuestion() {
        currentQuestionIndex += 1
        if currentQuestionIndex == questionsThisGame {
            isGameOver = true
        }
        currentAnswer = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
