import UIKit

//****************************
// Properties
//****************************
struct Person {
    
    // example of property observers
    var clothes: String {
        willSet {
            updateUI(msg: "I'm changing from \(clothes) to \(newValue)")
        }
        didSet {
            updateUI(msg: "I just changed from \(oldValue) to \(clothes)")
        }
    }
    
    var shoes: String
    
    var age: Int
    
    // example of computed property
    var ageInDogYears: Int {
        get {
            return age * 7
        }
    }
    
    func describe() {
        print("I like wearing \(clothes) with \(shoes)")
    }
}

func updateUI(msg: String) {
    print(msg)
}

var taylor = Person(clothes: "T-shirts", shoes: "sneakers", age: 25)
taylor.clothes = "short skirts"
print("Age in dog years \(taylor.ageInDogYears)")


//****************************
// Static properties and methods
//****************************
struct TaylorFan {
    static var favoriteSong = "Look What You Made Me Do"
    
    var name: String
    var age: Int
}

let fan = TaylorFan(name: "James", age: 25)
print(TaylorFan.favoriteSong)

// NOTE: static properties and methods belong to the type, not the instance

//****************************
// Access Control
//****************************
// public       everyone can read and write the proprety
// internal     only your swift code can read.
// fileprivate  only code in same file can read and write
// private      most restrictive, read and write only inside type or extensions

//****************************
// Polymorphism and typecasting
//****************************
class Album {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func getPerformance() -> String {
        return "The album \(name) sold lots"
    }
}

class StudioAlbum: Album {
    var studio: String
    
    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
        return "The studio album \(name) sold lots"
    }
}

class LiveAlbum: Album {
    var location: String
    
    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
        return "The live album \(name) sold lots"
    }
}

var taylorSwift = StudioAlbum(name: "Taylor Swift", studio: "The Castles Studios")
var fearless = StudioAlbum(name: "Speak Now", studio: "Aimeeland Studio")
var iTunesLive = LiveAlbum(name: "iTunes Live from SoHo", location: "New York")

// array of type Album but holds types that inherit
var allAlbums: [Album] = [taylorSwift, fearless, iTunesLive]

// polymorphism in action
for album in allAlbums {
    print(album.getPerformance())
    
    // type casting
    if let studioAlbum = album as? StudioAlbum {
        print(studioAlbum.studio)
    } else if let liveAlbum = album as? LiveAlbum {
        print(liveAlbum.location)
    }
}

let number = 5
let text = String(number)
print(text)

//****************************
// closures
//****************************
let vw = UIView()
UIView.animate(withDuration: 0.5, animations: {
    vw.alpha = 0
})

// trailing closure - very common.  does the same as code directly above
UIView.animate(withDuration: 0.5) {
    vw.alpha = 0
}
