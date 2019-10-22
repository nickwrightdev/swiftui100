# Day 16
## Basic App Structure of SwiftUI App
- AppDelegate.swift - managing app
- SceneDelegate.swift - launches window in app.  
- ContentView.swift - initial user interface for program
- Assets.xcassets is an asset catolog for images, icons, and more.
- LaunchScreen.storyboard is a visual editor for creating a small piece of UI to show when app is launching
- Info.plist is a collection of special values that describe to the system how your app works, what version it is, supported device orientations, and more.  

## Creating a Form

    var body: some View {
	    Form {
		    Text("Hello World")
	    }
    }
There is a 10 child limit.   Use Group get around this restriction.   

    Form {
	    Group {
		    Text("Hello World")
		    Text("Hello World")
		    Text("Hello World")
		    Text("Hello World")
		    Text("Hello World")
		    Text("Hello World")
	    } 
	    Group {
		    Text("Hello World")
		    Text("Hello World")
		    Text("Hello World")
		    Text("Hello World")
		    Text("Hello World")
		    Text("Hello World")
	    } 
    } 
##### Use Section to seperate items visually

    Form {
	    Section {
		    Text("Hello World")
	    } 
	    Section {
		    Text("Hello World")
		    Text("Hello World")
	    }
    }

## Adding a Navigation Bar
Wrap in a NavigationView

    var body: some View {
	    NavigationView { 
			Form {
				Section {
					Text("Hello World")
				}
			}
			.navigationBarTitle(Text("SwiftUI"))
		}
    }
Note navigationBarTitle() is a modifier of Form, not the NavigationView.
##### Inline displayMode

    .navigationBarTitle("SwiftUI", displayMode: .inline)
##### Shortcut for plain text

    .navigationBarTitle("SwiftUI")

## Modifying Program State

> Views are a function of their state.

Swift provides a property wrapper @State that stores the property where it can be modified.

Use private access control for @State properties.

    struct ContentView: View { 
	    @State private var tapCount = 0 
	    
		var body: some View { 
			Button("Tap Count: \(tapCount)") {
			self.tapCount += 1
		}
	}
	    
Note the requirement to use self.tapCount inside the Button's closure.

## Binding State to UI controls

    struct ContentView: View {
	    @State private var name = ""
		
		var body: some View {
			Form { 
				TextField("Enter your name", text: $name)
				Text("Hello \(name)")
			}
		} 
    }

Note the use of the $ for writing the name back from the TextField.   The dollar sign creates a two-way binding.

## Creating Views in a Loop
We can create multiple views with ForEach.

    Form {
	    ForEach(0 ..< 100) { number in
		    Text("Row \(number)") 
	    } 
    }
Using shorthand syntax  we could also do this.

    Form {
	    ForEach(0 ..< 100) {
		    Text("Row \($0)") 
	    } 
    }

Works great with things like Pickers

    struct ContentView: View { 
	    let students = ["Harry", "Hermione", "Ron"]
	    @State private var selectedStudent = "Harry"
	    
	    var body: some View { 
		    Picker("Select your student", selection: $selectedStudent) {
			    ForEach(0 ..< students.count) {
				    Text(self.students[$0] 
			    }
		    }
	    }
    }

