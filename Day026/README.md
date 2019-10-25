

# Day 26
## Steppers

Steppers are useful for entering numbers and can bind to Int and Double.   
##### Lets create a property

    @State private var sleepAmount = 8.0
##### Bind the property like this

    Stepper(value: $sleepAmount) { 
	    Text("\(sleepAmount) hours")
    }
    
##### Provide a range, in this case between 4 and 12 inclusive.

    Stepper(value: $sleepAmount, in: 4...12) { 
	    Text("\(sleepAmount) hours")
    }
##### Provide a step value, in this case 15 minute increments

    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) { 
	    Text("\(sleepAmount) hours")
    }

##### Formatting to 2 decimals for that Text

    Text("\(sleepAmount, specifier: "%.2f") hours")

##### Even more useful, remove insignificant zeros

    Text("\(sleepAmount, specifier: "%g") hours")

## DatePicker
DatePicker can be bound to Date properties.
##### Lets create a property

    @State private var wakeUp = Date()
##### Bind to a DatePicker like this

    DatePicker("Please enter a date", selection: $wakeUp)

##### Use labelsHidden() to hide associated label but keep for screen readers

    DatePicker("Please enter a date", selection: $wakeUp)
	    .labelsHidden()
We can also wrap in a `Form.`

We can use `displayedComponents` to decide what kind of options to use.  
- Default is day, hour, minute.
- use `.date` for month, day, year
- use `.hourAndMinute` for just the hour and minute components.

##### Only show Hour and Minute with .hourAndMinute

    DatePicker("Enter a time", selection: $wakeUp, displayComponents: .hourAndMinute)

   `DatePicker` also has an in parameter that works the same as `Stepper`.

##### Make a Range of Dates (Today thru Tomorrow)

    let now = Date()
    let tomorrow = Date().addingTimeInterval(86400)
    let range = now ... tomorrow
Swift allows the use of one-sided ranges, these are pretty nifty. 
##### A range of all dates in the future

    DatePicker("Enter a time", selection: $wakeUp, in: Date()...)

## Working with Dates and DateFormatter

Dates and calendars have all sorts of complications like Daylight Savings Time, Leap Years, etc.  Thus, dates can be tricky to work with.

Luckily Swift and iOS provides `DateComponents` and`DateFormatter` along with `Calendar` to make things manageable.

`DateComponent` is used to read and write specific parts of a Date as opposed to the whole thing.
##### Represents 8 a.m. with DateComponents

    var components = DateComponents()
    components.hour = 8
    components.minute = 0
    let date = Calendar.current.date(from: components) ?? Date()

##### Get Minute and Hour components from a given Date

    let components = Calendar.current.dateComponents([.hour, .minute], from: someDate)
    let hour = components.hour ?? 0
    let minute = components.minute = components.minute ?? 0

While, `DateFormatter` lets us convert a date to a string in a variety of ways.
##### Just printing the time from a date

    let formatter = DateFormatter()
    formatter.timeStyle = .short
    let dateString = formatter.string(from: Date())
For further research, look into using custom formats with `dateFormat`.  Useful stuff!
## Training a model with Create ML
Core ML can handle a lot of tasks, like recognizing images, sounds, or motion.

**Tabular Regression** - throw a load of spreadsheet-like data at Create ML and ask it to figure out the relationship between various values.

Two steps to Machine Learning - train the model, and then ask the model for predictions.

Its a pretty big topic, one that I haven't studied really since college.     This will be my first experimentation with it in iOS. 
