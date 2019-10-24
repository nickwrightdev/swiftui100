//
//  ContentView.swift
//  RockPaperScissorsTrainer
//
//  Created by Nicholas Wright on 10/22/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let moves = ["Rock", "Paper", "Scissors"]
    let movesPerGame = 10
    
    @State private var gameSelection: Int = Int.random(in: 0...2)
    @State private var playerShouldWin: Bool = Bool.random()
    @State private var showingAlert: Bool = false
    @State private var turnNumber: Int = 1;
    @State private var score: Int = 0;
    @State private var correctGuess: Bool = false
    
    private var playerShouldWinStr: String {
        (playerShouldWin) ? "Win" : "Lose"
    }
    
    private var alertTitle: String {
        (correctGuess) ? "Correct" : "Wrong"
    }
    
    private var alertMessage: String {
        var str = "You've answered \(score) correctly out of \(turnNumber)."
        if turnNumber == movesPerGame {
            str += " Game Over!"
        }
        return str
    }
    
    private var alertDismissButton: String {
        return (turnNumber == movesPerGame) ? "Play Again" : "Continue"
    }
    
    var body: some View {
        VStack {
            Text("Move \(turnNumber) of \(movesPerGame)")
                        
            Text("Game chooses \(moves[gameSelection])")
            
            Text("Player should \(playerShouldWinStr)")
            
            ForEach(0 ..< 3) { num in
                Button(action: {
                    self.playerButtonTapped(num)
                }) {
                    Text("\(self.moves[num])")
                }
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("\(self.alertTitle)"),
                  message: Text("\(self.alertMessage)"),
                  dismissButton: .default(Text(self.alertDismissButton)) {
                    self.nextRound();
            })
        }
    }
    
    private func playerButtonTapped(_ buttonIndex: Int) {
        guard let winnerIndex = getIndexAfter(gameSelection) else {
            print("invalid index - no winner")
            return;
        }
        guard let loserIndex = getIndexBefore(gameSelection) else {
            print("invalid index  no loser")
            return;
        }
        
        let isAWin = (buttonIndex == winnerIndex)
        let isALoss = (buttonIndex == loserIndex)
        correctGuess = (playerShouldWin && isAWin) || (!playerShouldWin && isALoss)
        if correctGuess {
            score += 1
        }
        
        showingAlert = true
    }
    
    private func nextRound() {
        if turnNumber < movesPerGame {
            turnNumber += 1
            makeGameSelection()
        } else {
            newGame()
        }
    }
    
    private func newGame() {
        turnNumber = 1
        score = 0
        makeGameSelection()
    }
    
    private func makeGameSelection() {
        gameSelection = Int.random(in: 0...2)
        playerShouldWin = Bool.random()
    }
    
    // with current 'moves', index before gives the loser
    private func getIndexBefore(_ index: Int) -> Int? {
        if index == 0 {
            return moves.count - 1;
        } else if index < moves.count {
            return index - 1;
        }
        return nil;
    }
    
    // with current 'moves' index after gives the winner
    private func getIndexAfter(_ index: Int) -> Int? {
        let maxIndex = moves.count - 1
        if index == maxIndex {
            return 0;
        } else if index >= 0 && index < maxIndex {
            return index + 1
        }
        return nil
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
