import UIKit

//********************************
// Variables and Constants
//********************************
var name = "Tim McGraw"             // variable
name = "Romeo"                      // can change

let anotherName = "Tim McGraw"      // constant
//anotherName = "Romeo"             // can't change constants

// NOTE: variable and constant names must be unique in their scope

//********************************
// Types of Data
//********************************
var personName: String
personName = "Tim McGraw"

var personAge: Int
personAge = 25

var latitude: Double
latitude = 36.166667

var longitude: Float                // Double has better accuracy than Float
longitude = -86.783333
longitude = -168.783333
longitude = -1268.783333
longitude = -123468.783333
longitude = -1234568.783333

var stayOutTooLate: Bool
stayOutTooLate = true

var nothingInBrain: Bool
nothingInBrain = true

var missABeat = false               // don't need to use type annotations, swift can infer

//********************************
// Operations
//********************************
var a = 10
a = a + 1
a = a - 1
a = a * a
a = a / 2
a = a % 10

var b = 10
b += 10                             // add, then assign.  b = b + 10
b -= 10                             // subtract, then assign.   b = b - 10

var x = 1.1
var y = 2.2
var z = x + y

var name1 = "Tim McGraw"
var name2 = "Romeo"
var both = name1 + " and " + name2

// Modulus - get remainder
9 % 3
10 % 3

z > 3
z >= 3
z > 4
z < 4

name1 == "Tim McGraw"               // equality
name1 == "TIM McGraw"               // strings are case sensitive

var wakingUpEarly = true
wakingUpEarly
!wakingUpEarly                      // not operator

name != "Tim McGraw"                // not equal

//********************************
// String Interpolation
//********************************
// combining variables and constants inside string
var singer = "Tim McGraw"
"Your name is \(singer)"
"Your name is " + singer            // less efficent way to do it

var singerAge = 25
var singerLat = 36.166667
"Your name is \(singer), your age is \(singerAge), and your latitude is \(singerLat)"

"Your age is \(singerAge) years old.  In another \(singerAge) years you will be \(singerAge * 2)."

//********************************
// Arrays
//********************************
var evenNumbers = [2, 4, 6, 8]
var songs = ["Shake it Off", "You Belong To Me", "Back to December"]

songs[0]
songs[1]
songs[2]

type(of: songs)

var anyTypeArray: [Any] = ["Shake it Off", "You Belong To Me", "Back to December", 3]
type(of: anyTypeArray)

var tunes: [String] = []            // one way to make empty string array

var diddies = [String]()            // preferred way to create empty string array

var songs1 = ["Shake it Off", "You Belong To Me", "Love Story"]
var songs2 = ["Today was a Fairytale", "Welcome to New York"]
var songs3 = songs1 + songs2
songs3 += ["Everything has changed"]

//********************************
// Dictionaries
//********************************
var person = ["first": "Taylor",
              "middle": "Allison",
              "last": "Swift",
              "website": "taylorswift.com",
              "birthmonth": "December"]

person["middle"]
person["last"]

//********************************
// Conditional Statements
//********************************
var action: String
var personType = "hater"

if personType == "hater" {
    action = "hate"
} else if personType == "player" {
    action = "player"
} else {
    action = "cruise"
}

var tired = true
var braindead = true

if tired && braindead {             // both must be true
    action = "sleep"
}

if !tired && !braindead {           // both must be false
    action = "sleep"
}

//********************************
// Loops
//********************************
for i in 1...10 {
    print("\(i) x 10 is \(i * 10)")
}

var str = "Fakers gonna"
for _ in 1...5 {
    str += " fake"
}
print(str)

for i in 1..<5 {
    print(i)
}

var songList = ["Shake if Off", "You Belong With Me", "Look What You Made Me Do"]

for song in songList {
    print("My favorite song is \(song)")
}

var people = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]

for i in 0...3 {
    print("\(people[i]) gonna \(actions[i])")
}

for i in 0..<people.count {
    var s = "\(people[i]) gonna"
    for _ in 1...5 {
        s += " \(actions[i])"
    }
    print(s)
}

var counter = 0
while true {
    print("Counter is now \(counter)")
    counter += 1
    if counter == 556 {
        break;                          // use to exit loop
    }
}

var mySongs = ["Shake It Off", "You Belong To Me", "Look what you made me do"]
for song in mySongs {
    if song == "You Belong To Me" {
        continue                       // quit current iteration and go back to the top of the loop
    }
    print("my favorite song is \(song)")
}

//********************************
// Switch case
//********************************
let liveAlbums = 2

switch liveAlbums {
case 0:
    print("You're just starting out")
    
case 1:
    print("You just released iTunes Live From SoHo")
    
case 2:
    print("You just released Speak Now World Tour")
    
default:
    print("Have you done something new?")
}

let studioAlbums = 5

switch studioAlbums {
case 0...1:
    print("You're just starting out")
    
case 2...3:
    print("You're a rising star")
    
case 4...5:
    print("You're world famous!")
    
default:
    print("Have you done something new?")
}

// break is not needed.  use fallthrough to do the opposite (and fall to the next condition)
