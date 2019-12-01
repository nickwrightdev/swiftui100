# Day 45
## Blurs, Blending, Etc
Blend modes control the way one view is rendered on top of another.

Default mode is **.normal**.

One common blending mode is .multiply.  It multiplier each source pixel color with the destination pixel color.   This appliesa common tint where blacks stay black (because they have a value of 0)

##### Image inside a ZStack with a red rectnagle using the multiply blend mode.
    ZStack {
	    Image("NickWright")
	    
	    Rectangle()
		    .fill(Color.red)
		    .blendMode(.multiply)
    }
    .frame(width: 400, height: 500)
    .clipped()

   
   
 
##### Multiply is so common, there is a shortcut modifier

    var body: some View {
	    Image("NickWright")
		    .colorMultiply(.red)
	}

Another popular blending mode is .**screen**, which does the opposite of multiply.  It inverts the colors, performs a multiply, and inverts them again, resulting in a brighter image.   

See [BlendingScreenView.swift](https://github.com/nickwrightdev/swiftui100/blob/master/Project09/Drawing/Drawing/BlendingScreenView.swift) in the corresponding project for an in-depth example.

#### Blur and Saturation
We've used **.blur()**, we can also use .**saturation()**, which adjusts how much color is used inside a view.   Give it a value of 0(no color, grayscale) and 1(full color).

See [BlurAndSaturationView.swift](https://github.com/nickwrightdev/swiftui100/blob/master/Project09/Drawing/Drawing/BlurAndSaturationView.swift) in the Drawing project for a working example adjusting blur and saturation to make a nice effect.

**Another important note is that using `Color.red` is not a pure red color.   Color.red is a custom color blend meant to look better in light and dark mode.  To get pure red, use `Color(red: 1, green: 0, blue: 0)`

## Animating simple shapes with animatableData
Putting drawing and animations together.

We can override a property called animateableData to tell SwiftUI which values to watch for animations.

##### Sample shape whose path is effected by insetAmount.   By adding insetAmount into animatableData, this is how SwiftUI knows to manage animations.
    struct MyShape: Shape {
      var insetAmount: CGFloat
      
      var animatableData: CGFloat {
	      get { insetAmount }
	      set { self.insetAmount = newValue }
      }
      
      func path(in rect: CGRect) -> Path {
	      var path = Path()
	      // create shape using inset amount..
	      return path
      } 
    }

## AnimatablePair for Complex Shape animation
AnimatablePair is, as the name suggests, a pair of animatable values!  Imagine that!   

In the last example, it was explained how to animate one value using animatableData.    But what if we need to do more??

Values inside AnimatablePair can read using **.first** and **.second**.

    public var animatableData: AnimatablePair<Double, Double> {
	    get {
		    AnimatablePair(Double(rows), Double(cols))
	    }
	    set {
		    self.rows = Int(newValue.first)
		    self.cols = Int(newValue.second)
	    }
    }

What if we need more than two?   We can make AnimatablePairs of AnimatablePairs.  Below is SwiftUI's EdgeInsets type.  
##### The animatableData property for SwiftUI's EdgeInsets type

    AnimatablePair<CGFloat, AnimatablePair<CGFloat, AnimatablePair<CGFloat, CGFloat>>>

It uses three separate AnimatablePair types then just digs thru them like **newValue.second.second.first**.   

*That's not complicated at all!!!*  

The benefit is that we do not need to invoke the body property 60 or 120 times a second during an animation.    This just changes the parts that are actually changing as needed!.

## Creating a spirograph with SwiftUI
See [CreateSpirographView.swift](https://github.com/nickwrightdev/swiftui100/blob/master/Project09/Drawing/Drawing/CreateSpirographView.swift) in the Drawing Project.  

