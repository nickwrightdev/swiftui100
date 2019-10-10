import UIKit

//***************************************
// Handling Missing Data
//***************************************
var age: Int? = nil         // ? makes it optional
age = 38


//***************************************
// Unwrapping Optionals
//***************************************
func unwrappingOptional(_ unwrapped: String?) {
    if let unwrapped = name {
        print("\(unwrapped.count) letters")
    } else {
        print("Missing name.")
    }
}

var name: String? = nil
unwrappingOptional(name)
name = "Nick"
unwrappingOptional(name)

//***************************************
// Unwrapping with Guard
//***************************************
func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }
    
    // since we used guard, unwrapped stays in scope
    print("Hello, \(unwrapped)")
}

var anotherName: String? = nil
greet(anotherName)
anotherName = "Chris"
greet(anotherName)

//***************************************
// Force unwrapping
//***************************************
let str = "5"
let num = Int(str)          // this makes num an optional Int
let num2 = Int(str)!        // this will unwrap.  if nil, code will crash

// NOTE: only force unwrap when sure it is safe!

//***************************************
// Implicitly unwrapped optionals
//***************************************
let personAge: Int! = nil

// these behave as if they are already unwrapped
// if you use them and they are nil, code will crash

//***************************************
// Nil coalescing
//***************************************
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

// this uses either the value, or if nil, a default value
let user = username(for: 15) ?? "Anonymous"
print(user)

//***************************************
// Optional chaining
//***************************************
let names = ["John", "Paul", "George", "Ringo"]
let beatle = names.first?.uppercased()
// if first returns nil, the uppercased() won't happen and beatle will be nil

//***************************************
// Optional try
//***************************************
// how to run throwing functions!
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}

// code from earlier lesson
do {
    try checkPassword("password")
    print("password is good")
} catch {
    print("password is bad")
}

// using try?
if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh")
}

// alternative way; using try! code will crash if this throws an error
try! checkPassword("sekrit")
print("Ok!")

//***************************************
// Failable initializers
//***************************************
let myStr = "5"
let myNum = Int(myStr)      // this is an optional Int, you could get back nil

struct Person {
    var id: String
    
    // return value will be an optional of your type
    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

// NOTE: failable initializers allow us to retun nil

//***************************************
// Typecasting
//***************************************

class Animal {}
class Fish: Animal {}

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]       // swift infers that this is an Array of Animal

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}

// Summary:
//
// 1. optionals let us represent the absence of value in a clear way
//
// 2. unwrap optionals with 'if let' or 'guard let'
//
// 3. force unwrap with !
//    force unwrapping nil values will crash
//
// 4. implicity unwrapped optionals don't have safety checks of regular optionals
//
// 5. use ?? for nil coalescing
//    unwrap optional and provide default value if nil
//
// 6. optional chaining lets us write code to manipulate an optional
//    if optional is empty, code is ignored
//
// 7. try? to convert throwing function to an optional return value
//    try! to crash if an error is thrown
//
// 8. if you need your initializer to fail when given bad input use init?()
//
// 9. use typecasting to convert one type of object to another
