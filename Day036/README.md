# Day 36
Projects are going to get bigger, starting with Project #7 which is called *iExpense.*
### @State only works with structs
SwiftUI's @State property wrapper is designed for simple data local to the current view.    As soon as you want to share this data between views it stops being useful!

To use classes, we will need to use a more powerful property wrapper called **@ObservedObject**.
### Sharing SwiftUI state with @ObservedObject
You will want to use classes if you want your data to shared across more than one view.

Rather than using @State to declare local state, there are 3 steps:
1. Make a class that conforms to the **ObservableObject** protocol.
2. Mark some properties with **@Published** so that any views using the class get updated when they change.
3. Create an instance of our class using the **@ObservedObject** property wrapper.
##### Using @State 

    struct User {
	    var firstName = "Nick"
	    var lastName = "Wright" 
    }
    
    struct ContentView: View {
	    @State private var user = User()
	    
	    var body: some View {
		    VStack {
				Text("Your name is \(user.firstName) \(user.lastName)")
				
				TextField("First name", text: $user.firstName)
				TextField("Last name", text: $user.lastName)
			}
	    }
    }
    
   
##### Using a class with @ObservedObject

    class User: ObservableObject {
	    @Published var firstName = "Nick"
	    @Published var lastName = "Wright" 
    }
    
    struct ContentView: View {
	    @ObservedObject var user = User()
	    
	    var body: some View {
		    VStack {
				Text("Your name is \(user.firstName) \(user.lastName)")
				
				TextField("First name", text: $user.firstName)
				TextField("Last name", text: $user.lastName)
			}
	    }
    }

The end result is that we can have our state stored in an external object, and, can use that object in multiple views and have them all point to the same values.

### Showing and Hiding Views
Basic way to show a view is a *sheet*: a new view presented on top of our existing one.

##### Showing a second view with a sheet

    struct SecondView: View {
	    var name: String
	    var body: some View {
		    Text("Hello \(name)!")
	    }
    }
    
    struct ContentView: View {
		@State private var showingSheet = false
		
		var body: some View {
			Button("Show Sheet") {
				self.showingSheet.toggle()
			}
			.sheet(isPresented: $showingSheet) {
				SecondView(name: "Nick Wright")
			}
		}    
    }
To dismiss the sheet, the user can drag it down.     We can also do it programatically.

#### @Environment
@Environment allows us to create properties that store values provided to us externally.   (i.e. is the user in light or dark mode?)

    @Environment(\.presentationMode) var presentationMode

##### Replace SecondView above with this below to dismiss the sheet on button tap

    struct SecondView {
	    @Environment(\.presentationMode) var presentationMode
	    
	    var name: String
	    
	    var body: View {
		    Button("Dismiss") {
			    self.presentationMode.wrappedValue.dismiss()
		    }
	    }
	}

### Deleting items with onDelete
SwiftUI provides **onDelete()** to control how objects should be deleted from a collection, almost exclusively with **List** and **ForEach**.

**onDelete()** must be attached to **ForEach**, not List, requiring a little more code.  (no looping with directly with **List**).

The code below will allow the user to create and delete rows.  Create by tapping the button and delete by swiping left on a row. 


    struct ContentView: View {
	    @State private var numbers = [Int]()
	    @State private var currentNumber = 1
	    
	    var body: some View {
		    VStack {
			    List {
				    ForEach(numbers, id: \.self) {
					    Text("\($0)")
					}
					.onDelete(perform: removeRows)
				}
				
				Button("Add Number") {
					self.numbers.append(self.currentNumber)
					self.currentNumber += 1
				}
			}
		}
		
		func removeRows(at offsets: IndexSet) {
			numbers.remove(atOffsets: offsets)
		}
    }

If we wrapped it all in a NavigationStack, we could add an edit button to the navigation bar which will do even more SwiftUI magic.

    .navigationBarItems(leading: EditButton())

### Storing user settings with UserDefaults
UserDefaults lets us store small amounts of user data attached to our app.     

- loaded when app launches
- keep it to 512 KB.
- perfect for storing settings or other important data
- string-ly typed.  
- data is stored using a key-value string.
##### Example storing increments of a tap count on Button

    struct ContentView: View {
	    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
	    
	    var body: some View {
		    Button("Tap count: \(tapCount)") {
			    self.tapCount += 1
			    UserDefaults.standard.set(self.tapCount, forKey: "Tap")
		    }
		}
	}

For this, we use UserDefaults.standard.  In more advanced apps we can create our own instances.

Writing data this way takes a little bit of time, like a couple seconds.   

### Archiving Swift Objects with Codable
While **UserDefaults** are fine for storing simple things like booleans and integers, complex data requires more work.

Swift provides a protocol called **Codable** for archiving and unarchving data.

Most common method of encoding is JSON.

