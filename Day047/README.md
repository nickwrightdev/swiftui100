# Day 47

A recap day after 3 projects.    Lots of items covered! 

## Recap
- Why **@State** only works with structs
- How to use **@ObservedObject** to work with classes.
- How **@Published** lets us announce property changes to any SwiftUI views we are watching.
- Presenting and dismissing views using the **sheet()** modifier and **presentationMode**.
- Using **onDelete(perform:)** to enable swipe to delete.
- Adding **EditButton** to navigation bar items, to let users edit list data.
- Reading and writing data with **UserDefaults**.
- Archiving and unarchiving data with **Codable**, including hierarchical data.
- Using the **Identifiable** protocol to make sure items can be identified uniquely by the user interface.
- How to use **GeometryReader** to make content fit the screen.
- **ScrollView** to layout custom views in a scrollable area.
- Pushing new views onto the navigation stack using **NavigationLink**.
- Using generics to write methods to work with different types.
- Making use of **first(where:)** to find the first element in an array that matches a predicate.
- Use **layoutPriority()** to adjust how much space is allocated to a view.
- Creating custom paths and shapes.
- Creating shapes that can be inset and have their border stroked using the **InsettableShape** protocol.
- Using CGAffineTransform to create rotations and translations.
- Making creative borderes and fills using **ImagePaint**.
- Enabling Metal for drawing complex views using drawingGroup()
- Modifying blend modes and saturation.
- Animating shapes with **AnimatableData** and **AnimatablePair**

## Key Points
### Classes vs Structs: the Difference and Why it Matters
- **Struct** is a *value* type
- **Class** is a *reference* type

SwiftUI behaves the opposite in some ways as UIKit.  For UIKit, all views were designed as classes, while data is often stored in structs.   In SwiftUI, views are created as structs and data is stored in classes.    For *oldish* developers like myself, this can be a strange adjustment.

### Using UserDefaults Wisely
- Only meant for storing small amounts of data - Keep it under 512KB
- Only stores certain types of data easily

Apple says they are called **UserDefaults** because they're commonly used to determine an app's default state at startup, or the way it acts by default.   *Use them this way!*

### When to use Generics
Generics are handy and useful and its important to use *generic constraints*.    In other words, "this can be any kind of object as long as it...".

The key to using generics well is to not use them first, and then when you do need them, add restrictions to get the most functionality you can.

