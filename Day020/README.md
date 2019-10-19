# Day 20

## Using stacks to arrange views

- VStack - vertial stack of views
- HStack - horizontal stack of views
- ZStack - arrange views by depth

Use `Spacer()` to create space and push views to one side.  These automatically take up remaining space.

##### Controlling Alignment
    VStack(alignment: .leading) {
	    Text("Hello World")
	    Text("This is inside a stack")
    }

##### Creating spacing

    HStack(spacing: 20) {
	    Text("Hello World")
	    Text("This is inside a stack")
    }
## Colors and Frames
##### ZStack with the entire background red
    ZStack {
	    Color.red
	    Text("Your content")
    }
##### ZStack with 200 x 200 frame background red

    ZStack {
		Color.red.frame(width: 200, height: 200)
		Text("My content")
	}

##### Custom Color

    Color(red: 1, green: 0.8, blue: 0)

To ignore the safe area, use the **edgesIgnoringSafeArea()** modifier.

    ZStack {
	    Color.red.edgesIgnoringSafeArea(.all)
	    Text("Your content")
    }

## Gradients
Swift provides 3 gradients, and they are made up of the following:

- An array of colors
- Size and direction information
- Gradient type

##### Linear Gradient

    LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)

##### Radial Gradient

    RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
##### Angular Gradient

    AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)

## Buttons and Images
##### Text Button

    Button("Tap me!") {
	    print("Button was tapped")
    }
##### Another way

    Button(action: {
	    print("Button was tapped")
    }) {
	    Image(systemName: "pencil")
    }

#### Three ways to create images
1. `Image("pencil")`will load an image called "pencil" in the project
2. `Image(decorative: "pencil")`will load the same image as above but won't render for users who enabled screen reader.
3. `Image(systemName: "pencil")`will load the pencil icon built into iOS.

**Tip**: use `renderingMode(.original)` to force SwiftUI to show the original image rather than a recolored version.

## Alerts
#### Example: show alert when button is tapped
The old "state of events" way would have us call myAlert.show(), but with SwiftUI create a state that tracks whether the alert is showing, like the example below.

    struct  ContentView: View {
		@State  private  var  showingAlert = false
		var  body: some  View {
			Button("Show Alert") {
				self.showingAlert = true
			}
			.alert(isPresented: $showingAlert) {
				Alert(title: Text("Hello SwiftUI"),
				message: Text("This is a some detail message"),
				dismissButton: .default(Text("OK")))
			}
		}
	}
    
    
