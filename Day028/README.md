# Day 28
Wrap up of Views and Modifiers with 3 challenges.

#### Challenge 1

> Replace each VStack in our form with a Section.

[Commit]([https://github.com/nickwrightdev/swiftui100/commit/8fce42a3f8748ba7f2d68614a3845f3ad158b868](https://github.com/nickwrightdev/swiftui100/commit/8fce42a3f8748ba7f2d68614a3845f3ad158b868))
#### Challenge 2

> Replace the "Number of cups" stepper with a Picker showing the same range of values.

[Commit]([https://github.com/nickwrightdev/swiftui100/commit/a8b3e09881ebdbd720ec46fa87daf76e6ade90f7](https://github.com/nickwrightdev/swiftui100/commit/a8b3e09881ebdbd720ec46fa87daf76e6ade90f7))
The trick here was Picker uses a zero-based index for the Picker options.
#### Challenge 3

> Change the user interface so that it always shows their recommended bedtime using a nice and large font.  Remove the Calculate button entirely

[Commit]([https://github.com/nickwrightdev/swiftui100/commit/cf199494899e9e3c4dcda3aced160e2feff5e445](https://github.com/nickwrightdev/swiftui100/commit/cf199494899e9e3c4dcda3aced160e2feff5e445))
Done easily by changing the calculateBedtime function to a computed property and cleaning up alert code
