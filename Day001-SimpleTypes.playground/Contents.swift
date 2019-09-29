import UIKit

var str = "Hello, playground"
str = "Goodbye"

var age = 39                    // integer
var population = 8_000_000      // use underscores as thousands separators

// includes line breaks
var str1 = """
This goes
over multiplie
lines
"""

// no line breaks
var str2 = """
This goes \
over multiple \
lines
"""

var pi = 3.141                  // double
var awesome = true              // boolean

var score = 85
// string interpolation
var scoreStr = "Your score was \(score)"
var results = "The results are: \(scoreStr)"

// constants
let taylor = "swift"
let helloConst = "Hello, playground"

// type annotations
let album: String = "Reputation"
let year: Int = 1989
let height: Double = 1.78
let taylorRocks: Bool = true

// Summary:
//
// 1. Prefer use of constants whenever possible.
//    Create constants with let
//    Create variables with var
//
// 2. Strings start and end in double quotes
//    To run strings across multiplie lines use three sets of double quotes.
//
// 3. Integers hold whole numbers
//    Doubles hold fractional numbers
//    Booleans hold true or false
//
// 4. String interpolation allows creation of strings from other variables and constants
//
// 5. Swift uses type inference to assign each variable
