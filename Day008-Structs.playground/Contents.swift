import UIKit

//****************************
// Creating Structs
//****************************

// structs can be given their own variables, constants, and functions

struct Sport {
    var name: String            // variables inside structs are called properties
}

var tennis = Sport(name: "Tennis")
print(tennis.name)

tennis.name = "Lawn tennis"

// NOTE: properties can have default values and can often rely on type inference

//****************************
// Computed properties
//****************************
struct SportWithComputedProperty {
    var name: String
    var isOlympicSport: Bool
    
    var olympicStatus: String {         // must have explict type for computed properties
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

let chessBoxing = SportWithComputedProperty(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)

// NOTE: computed properties CANNOT be constants!

//****************************
// Property observers
//****************************
// runs code before and after property changes
struct Progress {
    var task: String
    var amount: Int {
        // will run every time amount changes
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

// NOTE: can also use willSet before property change, but that is less useful

//****************************
// Methods
//****************************
// functions inside structs
struct City {
    var population: Int
    
    func collectTaxes() -> Int {
        return population * 1000
    }
}

let london = City(population: 1_000_000)
print(london.collectTaxes())

//****************************
// Mutating Methods
//****************************
// Swift won't let you write methods that change properties unless you request it
struct Person {
    var name: String
    
    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var ed = Person(name: "Ed")
ed.makeAnonymous()
print(ed.name)

let jim = Person(name: "Jim")
//jim.makeAnonymous()               // can't call mutating methods on constnats

//****************************
// Properties and Methods of Strings
//****************************
let str = "Do or do not, there is no try."
print(str.count)
print(str.hasPrefix("Do"))
print(str.uppercased())
print(str.sorted())

//****************************
// Properties and Methods of Arrays
//****************************
var toys = ["Woody"]
print(toys.count)

toys.append("Buzz")
toys.firstIndex(of: "Buzz")

print(toys.sorted())

toys.remove(at: 0)


