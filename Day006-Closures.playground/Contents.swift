import UIKit

//****************************
// Creating Basic Closures
//****************************
// functions can be used as types and assigned as variables
let driving = {
    print("I'm driving in my car")
}
driving()

//****************************
// Accepting Parameters in Closures
//****************************
let drivingWithParameters = { (place: String) in
    print("I'm going to \(place) in my car")
}
drivingWithParameters("London")        // closures do not use parameter labels

//****************************
// Returning Values from Closures
//****************************
let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

let message = drivingWithReturn("London")
print(message)

//****************************
// Closures as Parameters
//****************************
func travel(action: () -> Void) {
    print("I'm getting ready to go");
    action();
    print("I've arrived");
}
travel(action: driving)

//****************************
// Trailing Closures Syntax
//****************************
// closure must be last parameter
travel {
    print("I'm riding my bike")
}

// because the closure is the only parameter of travel, we don't need parenthesis
// this syntax is extremely common in swift
