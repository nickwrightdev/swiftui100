import UIKit

// *************
// Arrays
// *************
let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"
let beatles = [john, paul, george, ringo]

beatles[1]              // arrays are zero-indexed
//beatles[9] would crash, since there is no 10th index

// arrays written using type annotations are written in brackets
var stringArr: [String]
var intArr: [Int]

// *************
// Sets
// *************
// Two main differences from arrays:
//      1. Items aren't stored in any order
//      2. All items must be unique
let colors = Set(["red", "green", "blue"])
// duplicates will be ignored
let colors2 = Set(["red", "green", "blue", "red", "blue"])

// *************
// Tuples
// *************
var name = (first: "Taylor", last: "Swift")
name.0                                  // access via numerical position
name.first                               // access via name

// we can change the values of tuples, but not the types of values
name = (first: "Taylor", last: "Smith")
//name = (first: "Taylor", age: 25);        // can't do this

// *************
// Arrays vs Sets vs Tuples
// *************

// if you need a specific fixed collection, where each item has a precise position or name
// use a tuple
let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")

// if you need a collection of values that muts be unique
// use a set
let mySet = Set(["aardvark", "astronaut", "azalea"])

// if you need a collection that can contain duplicates, or the order matters
// use an array
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]

// *************
// Dictionaries
// *************
let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]
heights["Taylor Swift"]

// dictionaries written using type annotations
var oneDict: [String: Double]
var anotherDict: [String: String]

let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]
favoriteIceCream["Paul"]
favoriteIceCream["Charlotte"]

// assigning a default value
favoriteIceCream["Charlotte", default: "Unknown"]

// *************
// Creating Empty Collections
// *************
// Creating a Dictionary
var teams = [String: String]()
teams["Paul"] = "Red"

// Creating an array of Integers
var results = [Int]()

// Sets don't get special syntax, and use angle brackets instead
var words = Set<String>()
var numbers = Set<Int>()

// Arrays and Dicts can be created this way too..
var otherScores = Dictionary<String, Int>()
var otherResults = Array<Int>()

// *************
// Enumerations
// *************
enum Result {
    case success
    case failure
}
let failedResult = Result.failure
let successResult = Result.success

enum Directions {
    case north
    case south
    case east
    case west
}

// enum associated values - allows us to get more precise
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity.talking(topic: "football")

// enum raw values - allows for dynamic creation
enum Suit: Int {
    case clubs
    case hearts
    case spades
    case diamonds
}
let clubs = Suit.RawValue(0)
let spades = Suit.RawValue(2)

enum Planet : Int {
    case mercury = 1
    case venus
    case earth
    case mars
}
let earth = Planet.RawValue(3)

// Summary:
//
// 1. Arrays, sets, tuples, and dictionaries store a group of items under a signle value
//    choose which to use based on the behavior you want
//
// 2. Arrays
//    store items in the order you add them
//    access items using numerical positions
//
// 3. Sets
//    store items without any order
//    can't access using numerical positions
//
// 4. Tuples
//    fixed in size
//    read items using numerical positions or names
//
// 5. Dictionaries
//    store items according to a key
//    read items using the key
//
// 6. Enums
//    group related values without the spelling mistakes of strings or ambiguity of numbers
//
// 7. Attach raw values to enums so they can be created from integers or strings
//
// 8. Attach associated values to enums to store additional information about each case

