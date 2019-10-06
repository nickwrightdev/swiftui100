import UIKit

//***************************************
// Initializers
//***************************************
struct User {
    var username: String
}

// by default, structs have a memberwise initializer
// asks to provide a value for each property upon creation
var user = User(username: "twostraws")

struct UserWithCustomInitializer {
    var username: String
    
    init() {
        username = "Anonymous"
        print("creating a new user!")
    }
}

var userWithInit = UserWithCustomInitializer()
userWithInit.username = "twostraws";

// NOTE: Initializers cannot finish until all properties have a value!

//***************************************
// Referring to current instance
//***************************************
struct Baby {
    var name: String
    
    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

// self helps distinguish between parameters and properties

//***************************************
// Lazy properties
//***************************************
struct FamilyTree {
    init() {
        // family trees could take a long time to create in theory
        print("Creating family tree!")
    }
}

struct Person {
    var name: String
    lazy var familyTree = FamilyTree()      // not created until first accessed
    
    init(name: String) {
        self.name = name
    }
}
var ed = Person(name: "Ed")
ed.familyTree                               // first time familyTree is accessed

// this can be a good performance optimization
// only creates properties when needed

//***************************************
// Static Properties and methods
//***************************************
struct Student {
    static var classSize = 0
    var name: String
    
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
    
    static func printTotalSize() {
        print("there are \(Student.classSize) total students")
    }
}

let chris = Student(name: "Chris")
let tim = Student(name: "Tim")
print(Student.classSize)
Student.printTotalSize()

// static properties and methods belong to the struct itself, not instances

//***************************************
// Access control
//***************************************
struct Employee {
    private var id: String          // can only be accessed in methods inside this struct
    
    init(id: String) {
        self.id = id
    }
    
    func identify() -> String {
        return "My employee id number is \(id)"
    }
}

let nick = Employee(id: "12345")
//print(nick.id);
print(nick.identify())

// can also make properties explicity 'public'

// NOTE: memberwise initialziers cannot be generated with structs that have private properties

// Summary:
//
// 1. create your own types with structs
//    have their own properties and methods
//
// 2. use stored properties
//    use computed properties to calulate values on the fly
//
// 3. methods can change properties values
//    mark these methods with 'mutating'
//
// 4. initializers create structs
//    by default, memberwise initializer is avaiable
//    must give all properties a value
//
// 5. use 'self' to refer to the current instance inside a method
//
// 6. use 'lazy' to create properties only when they are first used
//
// 7. share properties and methods across all instances using 'static'
//
// 8. use access control to restrict what code can use properties and methods
