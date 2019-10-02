import UIKit

//*************************
// For Loops
//*************************
let count = 1...10
for number in count {
    print("Number is \(number)")
}

let albums = ["Red", "1989", "Reputation"]
for album in albums {
    print("\(album) is on Apple Music")
}

print("Players gonna ")
for _ in 1...5 {
    print("play")
}

//*************************
// While Loops
//*************************
var number = 1
while number <= 20 {
    print(number)
    number += 1
}
print("Ready or not, here I come!")

var counter = 2
while counter < 64 {
    print("\(counter) is a power of 2")
    counter *= 2
}

//*************************
// Repeat Loops
//*************************
var num = 1
repeat {
    print(number)
    number += 1
} while number <= 20
print("Ready or not, here I come!")

// this will never be run
while false {
    print("This is false")
}

// repeat loops run at least one time
repeat {
    print("this is false")
} while false

//*************************
// Exiting Loops
//*************************
var countDown = 10
while countDown >= 0 {
    print(countDown)
    if countDown == 4 {
        print("I'm bored.  Let's go now")
        break       // use to exit the loop
    }
    countDown -= 1
}

print("Blast off!")

// give loops a label to break from inside nested loops
outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("\(i) * \(j) is \(product)")
        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}

// IMPORTANT: using break by itself exits the current loop only!

//*************************
// Skipping Items
//*************************
for i in 1...10 {
    if i % 2 == 1 {
        continue    // continue skips the rest of the code in that iteration
    }
    print (i)
}

//*************************
// Infinite Loops
//*************************
var loopIndex = 0
while true {
    print(" ")
    loopIndex += 1
    if loopIndex == 273 {
        break
    }
}

// Summary:
//
// 1. Loops let us repeat code until a condition is false
//
// 2. for is most common loop
//    assigns a temporary constant for each item
//
// 3. Use _ if temporary constant is unused/unneeded
//
// 4. while loops require an explicit condition to check
//
// 5. repeat loops work like while loops, condition checked at the end
//    ran at least one time
//
// 6. Use break to exit loops
//    use labels with break to break out of nested loops
//
// 7. use continue to skip items in a loop
//
// 8. Infinite loops don't end until you ask them to
//    use while true
//    make sure there is a condition to end!!

