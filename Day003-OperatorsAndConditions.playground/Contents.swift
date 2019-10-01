import UIKit

// *********************************
// Arithmetic Operators
// *********************************
let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore
let difference = firstScore - secondScore

let product = firstScore * secondScore
let dividend = firstScore / secondScore;

var remainder = firstScore % secondScore;
remainder = 13 % secondScore;

// *********************************
// Operator Overloading
// *********************************
let meaningOfLife = 42
let doubleMeaning = meaningOfLife + meaningOfLife

let fakers = "Fakers gonna "
let action = fakers + "fake"

let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf

// IMPORTANT: cannot mix types!!

// *********************************
// Compound Assignment Operators
// *********************************
var score = 95
score -= 5                  // same as score = score - 5

var quote = "The rain in the Spain falls mainly on the "
quote += "Spainards"        // same as quote = quote + "Spainards"

var amount = 100
amount *= 2                 // same as amount = amount * 2
amount /= 2                 // same as amount = amount / 2

// *********************************
// Comparison Operators
// *********************************
let oneScore = 6
let anotherScore = 4

oneScore == anotherScore
oneScore != anotherScore

oneScore > anotherScore
oneScore >= anotherScore
oneScore < anotherScore
oneScore <= anotherScore

// strings work in natural alphabetical order
"Taylor" <= "Swift"
"John" <= "Lennon"

// *********************************
// Conditions
// *********************************
let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 2 {
    print("Aces - lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack")
} else {
    print("Regular cards")
}

// strings are case sensitive
var favoriteColor = "Red"
if favoriteColor == "red" {
    print("Success")
} else {
    print("Failure")
}

// *********************************
// Combining Operators
// *********************************
let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}

if age1 > 18 || age2 > 18 {
    print("One of them is over 18")
}

// *********************************
// The Ternary Operator
// *********************************
let cardOne = 11
let cardTwo = 10
print(cardOne == cardTwo ? "Cards are the same" : "Cards are different")

// ********************************
// Switch Statements
// ********************************
let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
default:
    print("Enjoy your day!")
}

// use fallthrough to continue execution
switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough
default:
    print("Enjoy your day!")
}

// ********************************
// Range Operators
// ********************************
// ..<  half-open range operator    excludes the final value
// ...  closed range operator       includes the final value

let rangeScore = 85

switch rangeScore {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}


// Summary:
//
// 1. Arithmetic and comparison operators mostly work like you already know
//
// 2. Compound arithmetic operators modify their variables in place
//    +=, -=, *=, /=
//
// 3. if, else, and else if are used to run code based on the result of a condition
//
// 4. Ternary operator combines a check with true and false code blocks
//    (condition) ? "do true thing" : "do false thing"
//
// 5. switch provides a clear way to check multiplie conditions using the same value
//
// 6. Make ranges with ..< and ... depending on whether to include the last number
