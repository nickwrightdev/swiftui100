# Day 25
A review day after creating two apps and one technique app.
### Topics Covered Thus Far
- Building scrolling forms that mix text with controls like `Picker`.
- Creating a `NavigationView` and giving it a title. 
- Using `@State` to store changing data.  SwiftUI views are structs, which means properties cannot be changed unless marked with `@State`.
- Creating two-way bindings to controls and using `$variable` to read and write values.
- Using ForEach to create views in a loop
- Using stacks like `VStack`, `HStack`, and `ZStack` to build complex layouts.
- Using colors and gradients as views and controlling their size by giving them frames.
- Creating buttons by providing text or an image, along with a closure that is executed when the button is tapped.
- Using ternary (?:) operator to create conditional modifiers.
- Breaking up views into smaller views using view composition and custom view modifiers.

Important to note in order to conform to the View protocol, all it requires is a computed property called body that returns `some View`.

### Key Points
#### Structs vs classes
1. Classes don't come with a memberwise intializer; structs have them by default.
2. Classes use inheritance; structs cannot.
3. A copy of a class points to the same data; copies of structs are always unique
4. Classes can have denitializers; structs cannot.
5. variable properties can change inside constant classes; proerpties inside constant structs are fixed regardless.

#### ForEach
ForEach conforms to View like most other things in SwiftUI, but it allows us to create other views inside a loop.   This allows us to bypass the 10 child limit.   **ForEach itself becomes one of the 10!**

How to loop thru an array, a working example. 

    let agents = ["Cyril", "Lana", "Pam", "Sterling"]
##### One way to loop thru the array

    VStack {
	    ForEach(0 ..< agents.count) {
		    Text(self.agents[$0])
	    }
    }
##### Another way to loop thru the array

    VStack {
	    ForEach(agents, id: \.self) {
		    Text($0)
	    }
    }
Another way is to look into the Identifiable protocol.
### Working with Bindings
##### To react to changes in a binding, we could leverage didSet

    @State var selection = 0 {
	    didSet {
		    print("Selection was changed to \(selection)")
	    }
    }
There may be times we want to do custom binding.   Here is a simple example using toggle switches on a form.
##### Three @State properties as booleans

    @State var agreedToTerms = false
    @State var agreedToPrivacyPolicy = false
    @State var agreedToEmails = false
    
##### Here is a binding that could toggle all 3 at once

    let agreedToAll = Binding(
	    get: { 
		    self.agreedToTerms && self.agreedToPrivacyPolicy && self.agreedToEmails
	    },
	    set: {
		    self.agreedToTerms = $0
		    self.agreedToPrivacyPolicy = $0
		    self.agreedToEmails = $0
	    }
    )
I'm going to put the code for this in a sample project to see it working. 
