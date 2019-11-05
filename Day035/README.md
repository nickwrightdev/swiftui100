# Day 35
A consolidation day after the last 3 apps.
### Topics Covered
- Using `Stepper` for numerical input.
- Entering dates with `DatePicker` and **displayedComponents** parameter.
- Working with dates using `Date`, `DateFormatter`, and `DateComponents`.
- An intro to machine learning with CreateML and CoreML.
- Building scrolling tables with `List` and creating rows from arrays of data.
- Running code when view is showing in `onAppear()`
- Reading files from app bundle using `Bundle`.
- Forcing crashes with `fatalError()`.
- Spellchecking with `UITextChecker`.
- Creating implicit animations with `animation()`
- Customizing animations with delays and repeats.   Easing in-out vs spring animations.
- Attaching `animation()` to bindings to control animation.
- using `withAnimation()` to create animations explicitly.
- Controlling the animation stack using multiple calls of `animation()`.
- Moving views around with `DragGesture`.
- Using Transitions, Swift made and custom.

### Key Points
#### ForEach and Lists
This works.. it creates 5 Text views.

    ForEach(0..<5) {
	    Text("Row \($0)")
    }
This does not.  ForEach does not support ClosedRange.

    ForEach(0...5) {
	    Text("Row \($0)")
    }

#### Strings
Can include emoji, which can make things tricky.
#### Flat App Bundles
 Don't use the same file name anywhere in your project!

### Challenge
The challenge is to build an "Edutainment" app based on multiplication tables.
