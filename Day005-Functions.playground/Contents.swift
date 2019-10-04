import UIKit

//*************************
// Writing Functions
//*************************
func printHelp() {
    let message = """
Welcome to MyApp!

Run this app inside a directory of images and
MyApp will resize them all into thumbnails
"""
    print(message)
}

printHelp()             // Calling the function

//*************************
// Accepting Parameters
//*************************
print("Hello World")        // String parameter for print() method

func square(number: Int) {
    print(number * number)
}

square(number: 8)

//*************************
// Returning Values
//*************************
func squareWithReturn(number: Int) -> Int {
    return number * number;
}

let squareResult = squareWithReturn(number: 16)
print(squareResult)

//*************************
// Parameter Labels
//*************************
func sayHello(to name: String) {
    print("Hello, \(name)")
}

// this allows the function to read naturally
sayHello(to: "Taylor")

//*************************
// Omitting Parameter Labels
//*************************
func greet(_ person: String) {
    print("Hello, \(person)")
}

greet("Taylor")

// As a general rule, parameter names are preferred to avoid confusion

//*************************
// Default Parameters
//*************************
func anotherGreet(_ person: String, nicely: Bool = true) {
    if (nicely == true) {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}

// two ways to call anotherGreet..
anotherGreet("Taylor")
anotherGreet("Taylor", nicely: false)

//*************************
// Variadic Functions
//*************************
print("Haters", "gonna", "hate")

// variadic = accepts any number of parameters
// use ...
func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}
square(numbers: 1, 2, 3, 4, 5)

//*************************
// Writing Throwing Functions
//*************************
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true;
}

//*************************
// Running Throwing Functions
//*************************
do {
    try checkPassword("password")
    print("That password is good")
} catch {
    print("You can't use that password")
}

//*************************
// inout Parameters
//*************************
func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 10
doubleInPlace(number: &myNum)       // must be a variable
print(myNum)

// parameters are constant by default
// inout changes the parameters outside the function

// Summary:
//
// 1. Functions allow code reuse
//    don't repeat yourself!
//
// 2. functions accept parameters
//    must specify type
//
// 3. functions can return values
//    must specify type
//    use tuples to return several values
//
// 4. parameters have internal and external names
//    can omit external name entirely
//
// 5. Paramaters can have default values
//    good for common cases
//
// 6. Variadic functions accept zero or more of a parameter
//    swift converts parameter to array
//
// 7. functions can throw erros
//    must be marked with 'throw' keyword
//    handle with do, try, and catch
//
// 8. use inout to change variables inside a function
//    better practice to make a new return value
