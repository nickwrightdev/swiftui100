
# Day 23
## SwiftUI using Structs for Views
- Element of performance
- Doesn't depend on inheriting UIView
- Isolates state in a clean way

By producing views that don't mutate over time, SwiftUI encourages us to move to a more functional design approach.

No longer required to inherit UIView, means every view does not contain its over 200 inherited properties and methods, whether we want them or not.
## What is behind the main SwiftUI View?
##### Only the area around the text will be red.
    struct ContentView: View {
	    var body: some View {
		    Text("Hello World")
			    .background(Color.red)
	    }
    }
There is nothing behind the text view.
##### Red will take up all of the space

    Text("Hello World")
	    .frame(maxWidth: .infinity, maxHeight: .infinity)
	    .background(Color.red)
	    .edgesIgnoringSafeArea(.all)
## Modifier Order Matters
##### Background color will only be around text

    Button("Hello World") {
	    // do nothing
    }
    .background(Color.red)
    .frame(width: 200, height: 200)
##### Entire 200x200 frame will be colored Red

    Button("Hello World") {
	    // do nothing
    }
    .frame(width: 200, height: 200)
    .background(Color.red)
Imagine the SwiftUI renders the view after each modifier (not how it works in practice but helpful way of thinking). 

 Each modifier adds to whatever was there before.
##### We can get creative with this stuff

    Text("Hello World")
	    .padding()
	    .background(Color.red)
	    .padding()
	    .background(Color.blue)
	    .padding()
	    .background(Color.green)
	    .padding()
	    .background(Color.yellow)

TODO: good place to add a screenshot

## some View
`some view`means that it conforms to the View protocol. 

1. We must always return the same type of view.
2. Even though we don't know what view type is going back, the compiler does.

#### How does VStack conform to View?
If you were to create a VStack with two views inside, SwiftUI silently creates a TupleView to contain those two views.    

TupleViews can contain up to 10 views, which is why SwiftUI does not allow more than 10 views inside a parent.

## Conditional Modifiers
A nice way for modifiers to apply only when certain conditions are met is the ternary operator.
##### Example

    struct ContentView: View {
	    @State private var useRedText = false
	    
	    var body: some View {
		    Button("Hello World") {
			    self.useRedText.toggle()
		    }
		    .foregroundColor(useRedText ? .red : .blue)
	    }
	 }
Since "some View" must always return the same type of view, the code below is NOT allowed, because Text(...) and Text(...).backgroundColor(Color.red) are different underlying types.
##### NOT ALLOWED IN SWIFT UI!  does not conform to "some View"

    var body: some View {
	    if self.useRedText {
		    return Text("Hello World")
	    } else {
		    return Text("Hello World")
			    .background(Color.red)
		}
    }

## Environment Modifiers
Some modifiers can be applied to containers which applies them to their children.
##### Example using font().  Applies to all children in VStack

    VStack { 
        Text("ABCDE")
        Text("FGHIJ")
        Text("KLMNO")
        Text("PQRST")
    }
    .font(.title)

##### Child modifiers take priority!

    VStack { 
	    Text("ABCDE") 
		    .font(.largeTitle)
	    Text("FGHIJ") 
	    Text("KLMNO") 
	    Text("PQRST") 
	} 
	.font(.title)
## Views as Properties

   
##### Example
    struct  ContentView: View {
	    let  motto1 = Text("Draco dormiens")
	    let  motto2 = Text("nunquam titillandus")
    
	    var body: some View {
		    VStack {
			    motto1
				    .foregroundColor(.red)
			    motto2
				    .foregroundColor(.blue)
		    }
	    }
    }

**NOTE:** Swift will not let us create one stored property that refers to other stored properties!

But you can make computed properties.

    var motto1: some View { Text("Draco dormines") }
## View Composition
We can break complex views into smaller views without performance penalty.  
##### Example

    Struct CapsuleText: View {
	    var text: String
	    
	    var body: some View {
		    Text(text)
			    .font(.largeTitle)
			    .padding()
			    .background(Color.blue)
			    .clipShape(Capsule())
	    }
	 }
    
##### Putting into use

    struct ContentView: View { 
	    var body: some View {
		    VStack(spacing: 10) {
			    CapsuleText(text: "First")
				    .foregroundColor(.white)
			    CapsuleText(text: "Second")
				    .foregroundColor(.yellow)
		    }
	    }
    }
## Custom Modifiers
We can create our own modifiers to create our own behaviors.
##### Example

    struct Title: ViewModifier {
	    func body(content: Content) -> some View {
		    content
			    .font(.largeTitle)
			    .foregroundColor(.white)
			    .padding()
			    .background(Color.blue)
			    .clipShape(RoundedRectangle(cornerRadius: 10))
	    }
    }
Can be used like this:

    Text("Hello World")
	    .modifier(Title())

Best practice is to create extensions on View.

    extension View {
	    func titleStyle() -> some View {
		    self.modifier(Title())
	    }
    }
And now it can be used like this:

    Text("Hello World")
	    .titleStyle()
	    
Custom modifiers can do far more than just apply existing modifiers.  They can create additional view structure as needed.
## Custom Containers
##### Example

    struct GridStack<Content: View>: View {
	    let rows: Int
	    let cols: Int
	    let content: (Int, Int) -> Content
	    
	    var body: some View {
		    VStack{
			    ForEach(0 ..< rows) { row in
					HStack {
						ForEach(0 ..< self.cols) { col in
							self.content(row, column)
						}
					}			    
			    }
			}
	    }
    }

Use it like this:

    struct ContentView: View {
	    var body: some View {
		    GridStack(rows: 4, cols: 4) { row, col in 
			    HStack {
				    Image(systemName: "\(row * 4 + col).circle")
				    Text("\R(row) C\(col)")
				}
			}
	    }
    }

TODO: this might be a good place for a screenshot.
