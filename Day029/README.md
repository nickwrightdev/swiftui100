# Day 29
Lessons and techniques for the 5th project Word Scramble.

## List
The equivalent for `List` in UIKit was `UITableView`.    It provides a scrolling table of data.

##### Providing static views rendered in individual rows

    List {
	    Text("Hello World")
	    Text("Hello World")
	    Text("Hello World")
    }
##### Create rows dynamically 

    List { 
	    ForEach(0..<5) { 
		    Text("Dynamic row \($0)")
		}
	}
##### Here we use a mix of static and dynamic rows

    List {
	    Text("Static row 1")
	    Text("Static row 2")
	    
	    ForEach(0..<5) {
		    Text("Dynamic row \($0)")
	    }
    }
###### Combine them in Sections to make things easier to read

    List {
	    Section(header: Text("Section 1")) {
		    Text("Static row 1")
		    Text("Static row 2")
	    }
	    Section (header: Text("Section 2")) {
		    ForEach(0..<5) {
			    Text("Dynamic row \($0)")
		    }
	    }
    }

##### Use the listStyle() modifier to change the look and feel

    .listStyle(GroupedListStyle())
##### If you only need dynamic rows, List can be used like ForEach

    List(0..<5) {
	    Text("Dynamic Row \($0)")
    }

##### We can use arrays of data to build Lists using id: \\.self

    struct ContentView: View { 
	    let people = ["Finn", "Leia", "Luke", "Rey"]
	    
	    var body: some View {
		    List(people, id: \.self) {
			    Text($0)
			}
	    }
    }
    
##### If we needed to mix static and dynamic rows, it could be written this way

    List {
	    ForEach(people, id: \.self) { 
		    Text($0)
	    }
    }

## Loading Resources from App Bundle
For data files, the process is the same whether its XML, JSON, or TXT.   All apps have a "Bundle" which stores all files for a single app in one place.

Even though the files are local, we use the data type `URL?`to read the file.   It will return nil if file doesn't exist.
##### Unwrapping a URL for a file in our main app bundle

    if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
	    // file is in the bundle!
    }
Once we have a URL, we can load it into a string with a special initializer: **String(contentsOf:)**

    if let fileContents = try? String(contentsOf: fileURL) {
	    // file is loaded into a String!
    }
## Working with Strings
### components(separatedBy:)
##### Converts this string into an array of string sepearted by spaces.
    let input = "a b c"
    let letters = input.components(separatedBy: " ")
    
  

##### Seperating by carriage returns

    let input = """
			    a
				b
				c
				"""
	let letters = input.components(searatedBy: "\n")

##### Reading letters from the array above

    let letter = letters.randomElement()
    let secondLetter = letters[1]
    
##### Trimming characters (in this case whitespace)

    let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)

##### Checking for misspelled words with UITextChecker

    let word = "swift"
    let checker = UITextChecker()
    let range = NSRange(location: 0, length: word.utf16.count)
    let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
    let allGood = misspelledRange.location == NSNotFound

