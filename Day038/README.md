# Day 38
Today we are given a review (and as usual I got 12/12 correct).

There are some challenges related to this recent iExpense game.    These will be improvements to the app and I have to write that code!   

#### Challenge 1

> Add an Edit/Done button to ContentView so users can delete rows more easily

[Commit](https://github.com/nickwrightdev/swiftui100/commit/fdd9e0cc44ae9603f2c677ab45edcc88c1740225)

#### Challenge 2

> Modify the expense amounts in ContentView to contain some styling depending on their value.  Under $10 should have one style, under $100 should use another, and expenses above $100 a third style.   Can use any kind of styles I want.

[Commit](https://github.com/nickwrightdev/swiftui100/commit/f889619a1529b753a0add722de5be2b94d81c2f9)
I accomplished this by creating a function to return a foreground **Color**, and another to return a **Font.Weight** based on the amount of the expense.

#### Challenge 3

> Add some validation to the Save button in AddView.  If you enter "fish" or another thing that can't be converted to an integer, show an alert telling users about the error.

[Commit](https://github.com/nickwrightdev/swiftui100/commit/d712c15562909337a4d7fba8a91d83568e1e687f)
