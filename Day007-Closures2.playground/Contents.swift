import UIKit

//****************************
// Closures as Parameters that have Parameters
//****************************
func travel(action: (String) -> Void) {
    print("I'm getting ready to go.");
    action("London");
    print("I arrived!")
}

travel { (place: String) in
    print("I'm going to \(place) in my car")
}

//****************************
// Closures as Parameters that Return Values
//****************************
func travel(action: (String) -> String) {
    print("I'm getting ready to go.");
    let description = action("Atlanta")
    print(description)
    print("I arrived");
}

travel { (place: String) in
    return "I'm going to \(place) in my car";
}

//****************************
// Shorthand Parameter Names
//****************************
// Swift knows the types to use for the parameter and the return type
travel { place in
    // closures with one line of code can omit 'return'
    "I'm trucking it to \(place) as fast as I can";
}

// swift also provides automatic closure names using $n counting from 0
travel {
    "I'm heading to \($0) but I'm in no rush";
}

//****************************
// Closures with Multiple Parameters
//****************************
func travel(action: (String, Int) -> String) {
    print("I'm getting ready to go");
    let description = action("London", 60)
    print(description)
    print("I'm here!")
}

travel {
    "I'm going to \($0) at \($1) miles per hour"
}

//****************************
// Return Closures from Functions
//****************************
func travel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

let result = travel()
result("London")

//****************************
// Capture Values
//****************************
func travelAndTrack() -> (String) -> Void {
    var counter = 1
    return {
        print("\(counter) I'm going to \($0)")
        counter += 1
    }
}

let tracker = travelAndTrack()
tracker("Nashville")
tracker("Atlanta")
tracker("Charlotte")

// Summary:
//
// 1. You can assign closures to variables, then call later on
//
// 2. Closures can accept parameters and return values
//    must specify type
//
// 3. closures can be parameters into other functions
//    closures can have their own parameters and return values
//
// 4. If last parameter of function is a closure
//    use trailing closure syntax
//
// 5. Swift automatially provides shorthand parameter names ($0, $1, $2,...)
//    not good for clarity, but handy
//
// 6. external values inside your closures
//    get captured so they can be refered to later

