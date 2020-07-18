import UIKit

// Protocols, Extensions, and Error Handling

// Protocols
// Protocols define a blueprint of methods, properties, and other requirements that can be adopted by a class
// Imagine a mature restaurant app that has a new requirement to add calories to all existing objects
class Burger {
    
}

class Fries {
    
}

enum Sauce {
    case chili
    case tomato
}

// None of these objects have calorie counts!
// We can solve this issue and add calorie counts to these existing objects by using protocols
// A protocol is like a blueprint that determines what properties or methods an object should have. After you've declared a protocol, classes, structures, and enumerations can adopt this protocol, and provide their own implementation for the required properties and methods.

// here is what a protocol declaration looks like:
// protocol protocolName {
// property1
// property2
// property3
// method1()
//  method2()
// }
// Note that we just have method names, the implementation is done within the adopting class, structure, or enumeration
// Each class, structure, or enum that adopts a protocol must implement a calories variable and a description() method.
protocol CalorieCountProtocol {
    // To adopt this protocol these methods must be implemented
    var calories: Int { get }
    // get means we'll only need to read the value, not write
    func description() -> String
}

class BurgerThatAdoptsCalorieProtocol : CalorieCountProtocol {
    let calories: Int = 800
    // Even though the protocol specifies a variable, we can use a constant here because protocol only requires that we "get" this value, not write. If we add a "set" option in the protocol variable definition this will throw an error
    func description() -> String {
        return "This burger has \(calories) calories"
    }
}

class FriesThatAdoptsCalorieProtocol : CalorieCountProtocol {
    let calories: Int = 500
    func description() -> String {
        return "These fries have \(calories)"
    }
}
// a class that adopts a protocol must use all elements of that protocol. If we delete either description() or calories from the FriesThatAdoptsCalorieProtocol we will get an error for not conforming to the protocol we've defined


// Exentions
// Extentions provide new functionality for an existing class, structure, or enum
extension Sauce : CalorieCountProtocol {
    // enums can't have stored variables, only computed variables, so a switch statment is used to retrn the number of calories
    var calories: Int {
        switch self {
        case .chili:
            return 20
        case.tomato:
            return 15
        }
    }
    func description() -> String {
        return "This sauce has \(calories) calories"
    }
}
// This is also very useful if you want to extend the capabilities of existing Swift types.

// Creating an array of different types of objects
// Normally, it is not possible to create an array of different object types. However, since burger, fries, and sauce all conform to calorieCountProtocol, we can make an array that contains them.

// First, create instances of each type
let burger = BurgerThatAdoptsCalorieProtocol()
let fries = FriesThatAdoptsCalorieProtocol()
let sauce = Sauce.tomato
// print the descriptions
print(burger.description())
print(fries.description())
print(sauce.description())

let foodArray : [CalorieCountProtocol] = [burger, fries, sauce]
// Create a loop to add total calories of a meal
var totalCalories = 0
for food in foodArray {
    totalCalories += food.calories
}
print(totalCalories)


// Error Handling
enum WebpageError: Error {
    case success
    case failure(Int)
}
// this declares an enumeration, WebpageError, that has adopted the Error protocol. It has two values, success, and failure(Int). You can associate Int with the failure value, which will be used to store the server response code.

// getWebpage will throw an error if the site is down
func getWebpage(_ url: String, _ siteUp: Bool) throws -> String {
    if siteUp == false {
        throw WebpageError.failure(404)
    }
    return "Success"
}
let webpageURL = "http://www.apple.com"
let websiteUp = true

//try getWebpage(webpageURL, websiteUp)
// as is, websiteUp set to false will throw an error and crash the app

do {
    let status = try getWebpage(webpageURL, websiteUp)
    print(status)
} catch {
    print(error)
}

// The do block tries to execute the getWebpage(url:siteUp:) function and prints the status if successful. If there is an error, instead of crashing, the statements in the catch block are executed, and the error appears in the Debug area.
