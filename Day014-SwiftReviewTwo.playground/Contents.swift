import UIKit

//********************************
// Functions
//********************************
func favoriteAlbum() {
    print("My favorite is Fearless")
}

favoriteAlbum()

func favoriteAlbum(name: String) {
    print("My favorite is \(name)")
}

favoriteAlbum(name: "Nevermind")
favoriteAlbum(name: "Appetite for Destruction")

func printAlbumRelease(name: String, year: Int) {
    print("\(name) was released in \(year)")
}

printAlbumRelease(name: "Fearless", year: 2008)

func countLettersInString(in string: String) {
    print("The string \(string) has \(string.count) letters.")
}

countLettersInString(in: "Hello")

func countLettersInStringAgain(_ string: String) {
    countLettersInString(in: string)
}

countLettersInStringAgain("Hi")

func albumIsTaylors(name: String) -> Bool {
    if name == "Taylor Swift" || name == "Fearless" {
        return true;
    }
    return false;
}

if albumIsTaylors(name: "Taylor Swift") {
    print("That's one of her's")
} else {
    print("Who made that?")
}

//********************************
// Optionals
//********************************
func getHaterStatus(weather: String) -> String? {
    if weather == "sunny" {
        return nil
    }
    return "Hate"
}

var status: String?
status = getHaterStatus(weather: "rainy")

var status2 = getHaterStatus(weather: "cloudy")

if let unwrappedStatus = status {
    // unwrappedStatus contains non-optional string
    print(unwrappedStatus)
} else {
    // status is nil
}

func takeHaterAction(status: String) {
    if status == "Hate" {
        print("Hating")
    }
}

if let haterStatus = getHaterStatus(weather: "rainy") {
    takeHaterAction(status: haterStatus)
}

func yearAlbumReleased(name: String) -> Int? {
    if name == "Taylor Swift" { return 2006 }
    if name == "Fearless" { return 2008 }
    return nil
}

if let albumYear = yearAlbumReleased(name: "Fearless") {
    print("\(albumYear) is the year of release")
}

// another example
var items = ["James", "John", "Sally"]

func position(of string: String, in array: [String]) -> Int? {
    for i in 0 ..< array.count {
        if array[i] == string {
            return i
        }
    }
    return nil
}

let jamesPosition = position(of: "James", in: items)
let johnPosition = position(of: "John", in: items)
let sallyPosition = position(of: "Sally", in: items)
let bobPosition = position(of: "Bob", in: items)

// Force Unwrapping with !
var fearlessYear = yearAlbumReleased(name: "Fearless")
if fearlessYear == nil {
    print("There was an error")
} else {
    print("the year is \(fearlessYear!)")       // force unwrap
}

var name: String = "Paul"               // regular variable must contain a value
var name2: String? = "Bob"              // optional might contain a value, might not
var name3: String! = "Sophie"           // might contain a value, will crash if used and it doesn't

//********************************
// Optional Chaining
//********************************
func albumReleased(year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    default: return nil
    }
}

let album = albumReleased(year: 2006)?.uppercased() // if album released returns nil, uppercased never called
print("The album is \(album!)")

// nil coalescing operator
let album2 = albumReleased(year: 2006) ?? "Unknown"     // returns default value if nil
print("The album is \(album2)")

let album3 = albumReleased(year: 2009) ?? "Unknown"
print("The album is \(album3)")

//********************************
// Enumerations
//********************************

enum WeatherType {
    case sun
    case cloud
    case rain
    case wind(speed: Int)
    case snow
}

func getCurrentHaterStatus(weather: WeatherType) -> String? {
    switch weather {
    case .sun:
        return nil
    case .wind(let speed) where speed < 10:
        return "meh"
    case .cloud, .wind:
        return "dislike"
    case .rain, .snow:
        return "hate"
    }
}

getCurrentHaterStatus(weather: .cloud)
getCurrentHaterStatus(weather: .sun)
getCurrentHaterStatus(weather: .wind(speed: 9))

//********************************
// Structs
//********************************
struct Person {
    var clothes: String
    var shoes: String
    
    func describe() {
        print("I like wearing \(clothes) witih \(shoes)")
    }
}

let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "high heels")

var taylorCopy = taylor
taylorCopy.shoes = "flip flops"

taylor.describe()
taylorCopy.describe()

//********************************
// Classes
//********************************
class PersonClass {
    var clothes: String
    var shoes: String
    
    init(clothes: String, shoes: String) {
        self.clothes = clothes
        self.shoes = shoes
    }
}

// non-optional properties must have values by the time init() has run

class Singer {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func sing() {
        print("La la la la")
    }
}

class CountrySinger: Singer {
    override func sing() {
        print("Trucks, guitars, liquor")
    }
}

class HeavyMetalSinger: Singer {
    var noiseLevel: Int
    
    init(name: String, age: Int, noiseLevel: Int) {
        self.noiseLevel = noiseLevel
        super.init(name: name, age: age)
    }
    
    override func sing() {
        print("Grrrrr rargh rargh rarrrrrgh!")
    }
}

let taylorSwift = Singer(name: "Taylor", age: 25)
taylorSwift.name
taylorSwift.age
taylorSwift.sing()

let timMcGraw = CountrySinger(name: "Tim", age: 50)
timMcGraw.sing()

let lemmy = HeavyMetalSinger(name: "Lemmy", age: 70, noiseLevel: 100)
lemmy.noiseLevel
lemmy.sing()

