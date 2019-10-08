import UIKit

//***************************************
// Creating Classes
//***************************************
class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

// NOTE: classes do NOT have a memberwise initializer

//***************************************
// Inheritance
//***************************************
class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}

// super.init() is required from inside child classes

//***************************************
// Overriding methods
//***************************************
class Cat {
    func makeNoise() {
        print("Meow!")
    }
}

class Lion: Cat {
    override func makeNoise() {
        print("Roar!")
    }
}

let spunky = Cat()
spunky.makeNoise()

let simba = Lion()
simba.makeNoise()

//***************************************
// Final classes
//***************************************
// cannot be overridden!
final class Puppy {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

//***************************************
// Copying objects
//***************************************
// classes copy by reference
class Singer {
    var name = "Taylor Swift"
}
var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Justin Bieber"
print(singer.name)
// in this case singer and singerCopy are the same object

// structs copy by value
struct Movie {
    var name = "Star Wars"
}
var movie = Movie()
print(movie.name)

var movieCopy = movie
movieCopy.name = "Wizard of Oz"
print(movie.name)
// in this case movie and movieCopy are different objects

//***************************************
// Deinitializers
//***************************************
class Person {
    var name = "John Doe"
    
    init() {
       print("\(name) is alive!")
    }
    
    deinit {
        print("\(name) is no more")
    }
    
    func printGreeting() {
        print("Hello, I'm \(name)")
    }
}

// deinit is called when the instance is destroyed

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}

//***************************************
// Mutability
//***************************************

// constant structs cannot have their properties change.
// constant classes can.

class Student {
    let name = "Nick"
}

// declare constant properties with let

// NOTE: the mutating keyword is not allowed with classes

// Summary:
//
// 1. classes and structs are similar
//    both have their own properties and methods
//
// 2. one class can inherit from another
//    gains all properties and methods of parent class
//
// 3. mark class 'final' to stop other classes from inheriting it
//
// 4. use method overriding to replace parent methods
//    use 'override' keyword
//
// 5. when two variables point to the same class instance
//    they point to the same place in memory.
//    changing one changes the other
//
// 6. use deinitializer to run code when and instance of class is desroyed
//    use deinit
//
// 7. classes don't enforce constants on its properties unlike structs
//    use let to use constants inside classes (common sense right)?
//
