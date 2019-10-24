## RockPaperScissors Trainer
This is the second challenge.   

##### Here is how the game is supposed to work.:
- Each turn of the game the app will randomly pick either rock, paper, or scissors.
- Each turn the app will either prompt the player to either win or lose. 
- The player must then tap the correct move to win or lose the game.
- If they are correct they score a point; otherwise they lose a point.
- The game ends after 10 questions, at which point their score is shown.

##### To solve the challenge here are the steps given:
1. Start with a single view app and create a property to store the three possible moves: ["Rock", "Paper", "Scissors"]
2. Create 2 @State properties to store the app's current choice and whether the player should win or lose.
3. Use Int.random(in:) to select a random move.  Can use Bool.random() for the win or loss selection.
4. Create VStack showing the player's score, the app's move, and whether the player should win or lose.   
5. The important part is making three buttons that respond to the player's move: Rock, Paper, or Scissors.

## Issues

No known bugs.    I didn't even try to make it look nice, I should come back and do that.
## Thoughts
I had a good time working on this.

The game itself could be made more fun by adding a timer.

This is a good project to come back to if I want to practice my (poor) UI / art skills.
