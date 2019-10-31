# Day 032
Animations 
## Creating Implicit Animations
- Simplest type
- View is told ahead of time how to respond if asked to animate
- Swift does the heavy lifting


Objective-C legacy requires us to use **CGFloat** when dealing with animations. Use type annotations to declare.

 

    @State  private  var  animationAmount: CGFloat = 1

Here is a short code sample that scales a button each time its pressed using the modifier **scaleAmount()**.
##### This will scale immediately with no animation

    struct ContentView: View {
	    @State  private  var  animationAmount: CGFloat = 1
	    var body: some View {
		    Button("Tap Me") {
			    self.animationAmount += 1
		    }
		    .padding(50)
		    .background(Color.red)
		    .foregroundColor(.white)
		    .clipShape(Circle())
		    .scaleAmount(animationAmount)
	    }
    }

To add animation, we only need to add one additional modifier, animation.
##### This creates a nice smooth scaling animation
    .animation(.default)

## Customizing Animations
By attaching the .animation(.default) modifier, Swift will automatically animate any UI changes using default system animation.   This is typically ease in, ease out.   It starts slow, speeds up, and then slows down again as it finishes.

We can customize these.  For example, we could have it ease out.
##### This will start faster with smooth slow stop

    .animation(.easeOut)
##### Spring animation 

    .animation(.interpolatingSpring(stiffness: 50, damping: 1))
##### Precise control for duration on an EaseInOut Animation

    .animation(.easeInOut(duration: 2))
Animations are their own structs with their own modifiers, we can write the above like so.

    .animation(
	    Animation.easeInOut(duration: 2)
    )
This way we can add our own modifiers.
##### Add a 1 sec delay to a 2 sec easeInOut Animation

    .animation(
	    Animation.easeInOut(duration: 2)
		    .delay(1)
    )

##### Run animation 3 times and use auto reversing

    .animation(
	    Animation.easeInOut(duration: 2)
		    .repeatCount(3, autoreverses: true)
    )
##### Repeat forever with autoreversing 

    animation(
	    Animation.easeInOut(duration: 2)
		    .repeatForever(autoreversing: true)
	)


Using **repeatForever** and **onAppear** can create some interesting effects in our apps.
##### Neat growing stroke effect around the button
    struct ContentView: View {
    
	    @State private var  animationAmount: CGFloat = 1
	    
	    var body: some View {
		    Button("Tap Me") {
			    //  self.animationAmount += 1
			}
			.padding(50)
			.background(Color.green)
			.foregroundColor(.white)
			.clipShape(Circle())
			.overlay(
				Circle()
					.stroke(Color.green)
					.scaleEffect(animationAmount)
					.opacity(Double(2 - animationAmount))
					.animation(
						Animation.easeInOut(duration: 2)
						.repeatForever(autoreverses: false)
					)
			)
			.onAppear {
				self.animationAmount = 2
			}
		}
	}
	
## Animation Bindings
The animation() modifier can be applied to any SwiftUI binding.  This is quite powerful.   

    struct ContentView: View {
	    
	    @State private var animationAmount: CGFloat = 1
	    
	    var body: some View {
	        VStack {
	            Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)

	            Spacer()

	            Button("Tap Me") {
	                self.animationAmount += 1
	            }
	            .padding(40)
	            .background(Color.red)
	            .foregroundColor(.white)
	            .clipShape(Circle())
	            .scaleEffect(animationAmount)
	        }
	    }
	}

This is a major contrast to implicit animations, where the animation is set on a view and the animation is done with state change.

With animation binding, we create *a sort of* explicit animation.   The view has no idea it will be changed.

Both methods are useful!

## Explicit Animations
Using the **withAnimation** closure.   withAnimation can be passed an Animation parameter, using all the stuff we did above.
##### 3d Rotation on the Y Axis when Button is tapped

    struct ExplicitAnimationsView: View {
	    
	    @State private var animationAmount = 0.0
	    
	    var body: some View {
		    Button("Tap Me") {
			    withAnimation(.easeInOut(duration: 2)) {
				    self.animationAmount += 360
				}
			}
			.padding(50)
			.background(Color.purple)
			.foregroundColor(.yellow)
			.clipShape(Circle())
			.rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
		}
	}

