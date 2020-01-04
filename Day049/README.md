# Day 49
## Codable Conformance with @Published Properties
We have to make **@Published** types conform to **Codable** ourselves.
##### Simple Example 

    class User: ObservableObject, Codable {
	    @Published var name = "Link the Cat"
    }

Step 1 - Create an **enum** that conforms to **CodingKeys**, listing all properties to archive/unarchive.

    enum CodingKey: CodingKeys {
	    case name
    }

Step 2 - Add a custom initializer to for decoding.  Overriding classes must override this initializer, so it must be either marked **required** or the class can be marked **final**. 

Here we ask the decoder for a container matching all the coding keys set it **CodingKey**.  Then the data can be read from the container to the properties. 

    required init(from decoder: Decoder) throws {
	    let container = try decoder.container(keyedBy: CodingKeys.self)
	    name = try container.decode(String.self, forKey: .name) 
    }

Step 3 - Override the encode method.  

    func encode(to encoder: Encoder) throws {
	    var container = encoder.container(keyedBy: CodingKeys.self)
	    try container.encode(name, forKey: .name)
    }

## Send and Receive Codable Data with URLSession

See CodableAndURLSessionView.swift in the example project for the full working example of getting Taylor Swift songs from the Apple iTunes store and displaying in a SwiftUI List.

Step 1 - create two structs, a **Result** with song info and a **Response** that holds an Array of Result.

    struct Response {
	    var results: [Result]
    }
    
    struct Result {
	    var trackId: Int
	    var trackName: 	String
	    var collectionName: String
    }

Step 2 - add a results property to the main content view and write some code to display it in a list.

    struct CodableAndURLSessionView: View {
	    @State private var results = [Result]()
		var body: some view {
			List(results, id: \.trackId) { item in
				VStack(alignment: .leading) {
					Text(item.trackName)
						.font(.headline)
					Text(item.collectionName)
				}
			}
		}
    }

Step 3 - add the **onAppear** modifier to the **List** to call a new method **loadView**.

    .onAppear(perform: loadData)

Step 4 - Implement the loadData function.   This is a 4 step process.  
1. Create the **URL** we want to read
2. Wrap the url in a **URLRequest** (configures how the URL is accessed)
3. Create and start a networking task from the **URLRequest**.
4. Handle the result of the networking task.

Its a lot of code..  see the project for the full details for how it uses DispatchQueue.main.async().

## Validating and Disabling Forms
Best practices require us to *check* input before we allow a user to proceed with a form.

SwiftUI provides a modifier for this explicit purpose called **disabled()** .  Use it to disable sections of a form.

##### Condition in the parameter

    Section {
	    Button("Create Account") {
		    // work here..
	    }
    }
    .disabled(username.isEmpty || email.isEmpty)

##### Computed Property in the parameter

    Section { 
	    Button("Create Account") { 
		    // work here.. 
		}
	} .disabled(disableForm)

   
   ...

    var disableForm: Bool {
		username.count < 5 || username.email.count < 5
    }

