import UIKit

//***************************************
// Protocols
//***************************************
// a way of describing what properties and methods something must have
protocol Identifiable {
    var id: String {get set}
}

// here a struct conforms to the protocol above
struct User: Identifiable {
    var id: String
}

func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}

// OBSERVATION: these seem a lot like interfaces in java and c#

//***************************************
// Protocol Inheritance
//***************************************
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation { }

// NOTE: unlike classes, you can inhiert from multiple protocols

//***************************************
// Extensions
//***************************************
// add methods to existing types
extension Int {
    func squared() -> Int {
        return self * self
    }
}

let number = 9
print(number.squared())

// can have computed properties, but not stored properties
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

// NOTE: mark methods that change the value of the instance with mutating

//***************************************
// Protocol Extensions
//***************************************
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

extension Collection {
    func summarize() {
        print("There are \(count) of us:")
        for name in self {
            print(name)
        }
    }
}

// since Array and Set both conform to the Collection protocol, we can do this
pythons.summarize()
beatles.summarize()


//***************************************
// Protocol-Oriented Programming
//***************************************
// protocol extensions can provide default implementations for our own protocol methods
protocol Idable {
    var id: String { get set }
    func identify()
}

extension Idable {
    func identify() {
        print("My ID is \(id)")
    }
}

struct Student: Idable {
    var id: String
}

let twostraws = Student(id: "twostraws")
twostraws.identify()

// Summary:
//
// 1. protocols describe what methods and properties a conforming type must have
//    no implementation
//
// 2. build protocols on top of other protocols
//    similar to classes
//
// 3. extensions add methods and computed properties to specific types
//
// 4. protocol extensions let you add methods and computed properties to protocols
//
// 5. protocol-oriented programming
//    design app architecture as series of protocols
//    use protocol extension to provide default implementations

