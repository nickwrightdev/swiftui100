# Day 39
Introduction to concepts for Project 8, *Moonshot*.  

An example project covering these techinques is included.

### Resizing images to fit the screen using GeometryReader
##### Clipping into a frame

    Image("Example")
	    .frame(width: 300, height: 300)
	    .clipped()

##### Resizing in frame

    Image("Example")
	    .resizable()
	    .frame(width: 300, height: 300)

#### Aspect Ratios (.fit vs .fill)
##### Resizing will fit entire container even if it leaves some parts empty

    Image("Example")
	    .resizable()
	    .aspectRatio(contentMode: .fit)
	    .frame(width: 300, height: 300)

##### Resizing will fill entire container but parts of image may be outside container

    Image("Example")
	    .resizable()
	    .aspectRatio(contentMode: .fill)
	    .frame(width: 300, height: 300)
#### GeometryReader 
GeometryReader provides a GeometryProxy that lets us query the enviornment.  How big is the container?  

    VStack {
	    GeometryReader { geo in
		    Image("Example")
			    .resizeable()
			    .aspectRatio(contentMode: .fit)
			    .frame(width: geo.size.width)


### Introduction to Scrollview
We've done scrolling with List and Form, but we can scroll our own custom views with SwiftUI's **ScrollView**.

ScrollViews can go vertically, horizontally, or both.

It works nicer than UIKit's UIScrollView counterpart, but you have to keep in mind that views loaded inside the **ScrollView** are loaded at runtime, not lazily like a **List**.

##### ScrollView example, using frame to capture the entire width of the screen

    ScrollView(.vertical) {
	    VStack(spacing: 10) {
		    ForEach(0..<100) {
			    Text("item \($0)")
				    .font(.title)
		    }
	    }
	    .frame(maxWidth: .infinity)
    }

### Presenting New Views with NavigationLink
**NavigationLink** allows us to push views onto the a view stack and provides powerful, built-in navigation.

The most common way to use this is with a List, and when used this way, SwiftUI will add disclosure indicators on the right edge telling the user to tap into a detail view.

    NavigationView {
	  List(0..<100) { row in
	    NavigationLink(destination: Text("Detail \(row)")) {
	      Text("Row \(row)")
		}
	  }
	  .navigationBarTitle("SwiftUI")
    }

### Hierarchial Codable Data
We can make hierarchys of **Codable** objects, and go as deep as we need to go.   

Our objects can serialize complex data this way.  

##### if we want User to be codable, Address also needs to be Codable.  
    struct User: Codable {
	    var user: String
	    var address: Address
    }
##### Common sense, right?

    struct Address: Codable {
	    var street: String
	    var city: String
    }

