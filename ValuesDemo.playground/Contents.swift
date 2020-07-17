import UIKit

//////////// Simple values

// Examples of integers
42
-23

// Examples of floating point numbers
3.14156
0.1
-273.15

// Examples of booleans
true
false

// Examples of strings
"hello, world"
"albatross"


// Variables and Constants
// Variable values can be changed, Constants can only be assigned once
// Variable names should be camelCase

// Examples of constants
let theAnswer = 42
let pi = 3.14
let myName = "Jamie"

// Examples of variables
var currentTemp = 84
var age = 29
var currentLocation = "work"

// the following line will fail as constants can't be reassigned
// theAnswer = 51

// Type Inference: Swift determines the constant or variable type based on what value is supplied initially
// To see type of following variable, hold down 'option' and click on constant name
var cuisine = "American"

// Type Annotation
var integer: Int = 15
var double: Double = 15.2233451 // double is preferred
var float: Float = 15.5
var boolean: Bool = true
var str: String = "This is a string"

// Type Safety
//integer = "this isn't an integer anymore"

// Operators
// +
// -
// *
// /

let sum = 23 / 20

// Operators can only work with operands of the same type
let a = 12
let b = 12.0
//let c = Double(a) + b
// you can convert a to a double for this instance by using the syntax: let c = Double(a) + b

// Operators
// += adds and assigns
// -= subtracts and assigns
// *= multiplies and assigns
// /= divides and assigns

// Comparison Operators
// == Equal to
// != Not Equal
// > Greater Than
// < Less Than
// >= Greater Than or Equal
// <= Less Than or Equal

// Logical Operators
// && Logical AND
// || Logical OR
// ! Logical NOT

// String Operations
// Concatenation
let greeting = "Good" + "Morning"

let rating = 3.5
var ratingResult = "The restaurant rating is " + String(rating)

// Interpoplation
ratingResult = "The restauarant rating is \(ratingResult)"

// Printing to console
print(ratingResult)

// Conditionals
if rating > 4 {
    print("Great Restaurant!")
} else if rating < 2 {
    print("Needs improvement")
} else {
    print("Just your average restaurant")
}

// Switch statements
var trafficLight = "Yellow"
switch trafficLight {
case "Red":
    print("Stop")
case "Yellow":
    print("Caution")
case "Green":
    print("Go")
default:
    print("Invalid color")
}
// Switch cases must be exhaustive
// Switch cases stop executing once a condition is met, so in this case, if trafficLight == "Red", the switch statement will stop upon printing "Stop", and won't evaluate for any other cases

// Optional variables
var favoriteAnimal: String
//print(favoriteAnimal) // throws error because it's used before initialization

var secondFavoriteAnimal: String?
secondFavoriteAnimal = "Turtles"
//print(secondFavoriteAnimal)
//let friendlyGreeting = "I like " + secondFavoriteAnimal! // must be unwrapped

// handle with optional binding
var carName: String?
carName = "KITT"
if let car = carName {
    let favoriteCar = "My favorite car is " + car
    print(favoriteCar)
}
// if carName has a value, it will be unwrapped and assigned to car, and the if statement will return true. The statements in the braces will be executed and the constant favoriteCar will be assigned "My favorite car is " + car and be printed. Note that car is not optional.

// range operators
// if we want to log the numbers 10, this can be done by doing the following
    // firstNumber...lastNumber
let closedRange = 10...20 // closed range operator that stores 10 through and including 20
let halfOpenRange = 10..<20 // stores 10 and ends with 19, known as half-open range operator
let oneSidedRange = 2... // range that contains 2 and up

print(closedRange.contains(20)) // true
print(closedRange.contains(9)) // false
print(halfOpenRange.contains(20)) // false
print(oneSidedRange.contains(1)) // false
print(oneSidedRange.contains(25000000)) // true

// Loops

// for-in
for number in closedRange {
    print(number)
}

for integer in 0..<5 {
    print(integer)
}

for number in halfOpenRange.reversed() {
    print(number)
}

// while loops
var y = 0
while y < 50 {
    y += 5
    print("y is \(y)")
}

// repeat-while
// comparable to a do-while loop in other languages
// runs once before evaluating conditions
var x = 0
repeat {
    x += 5
    print("x is \(x)")
} while x < 50

// Arrays
// values must be same type
// 0 index
// if created with LET keyword, array values can't be changed, but can be changed if created with VAR
var shoppingList = ["Eggs", "Milk"]
var arrayLength = shoppingList.count
print(shoppingList.isEmpty)

// append adds element to end
shoppingList.append("Bread")
// insert adds element at specified position
shoppingList.insert("Bananas", at: 1)

// access elements using bracket notation
print(shoppingList[1])
// add elements at certain index
shoppingList[2] = "Cheese"
print(shoppingList)

// remove an item
// removing returns the removed item
let removedItem = shoppingList.remove(at: 1)
print(removedItem, shoppingList)

// iterate over array
for shoppingItem in shoppingList {
    print(shoppingItem)
}

// iterate over array starting at certain element
for shoppingItem in shoppingList[1...] {
    print(shoppingItem)
}

// Dictionaries
// Key: value pairs, all keys in dict must be of same type, and all values must be of same type
// if created with LET, it can't be changed
var contactList = [
    "Jake": "222-222-2222",
    "Stephanie": "333-333-3333"
]

// check length and contents similarly to array
contactList.count
contactList.isEmpty

// add elements to dictionary
contactList["Ryan"] = "444-444-4444"
contactList["Ryan"] // returns ryans number

// change value of dictionary entry
contactList["Ryan"] = "999-999-9999"
contactList

// removing item from dictionary
contactList["Jake"] = nil
contactList

// assign removed value to variable
var oldContactValue = contactList.removeValue(forKey: "Ryan")
oldContactValue
contactList

// iterate over dictionary
for (name, contactNumber) in contactList {
    print("\(name) : \(contactNumber)")
}
// dictionaries are unsorted, so the above may return in an unexpected order, but every item will be printed

// Sets
// A set stores values in an unordered list
// If created with LET, the contents can't be changed

// creating a set
var movieGenres: Set = ["Horror", "Comedy", "Action"]
movieGenres.count
movieGenres.isEmpty

// add items to sets using insert
movieGenres.insert("Adventure")
movieGenres

// check if a set contains an item
movieGenres.contains("Comedy")

// remove items using remove
var oldSetValue = movieGenres.remove("Action")

// remove all values from set with removeall
//movieGenres.removeAll()
//movieGenres.isEmpty // will be true since all elements removed

// iterate over set
for genre in movieGenres {
    print(genre)
}

// Set Operations
let movieGenres2: Set = ["SciFi", "War", "Comedy"]

// union returns a new set which combines two sets
movieGenres.union(movieGenres2)

// intersection returns a new set of the common items in two different Sets
movieGenres.intersection(movieGenres2)

// subtracting will return a new Set without the values in the specified set
// in this case, "Horror" and "Adventure" are returned, as they are not a part of movieGenres2. Comedy is not returned as it is common among both sets
movieGenres.subtracting(movieGenres2)

// symmetricDifference will return a new set without the values common to both sets
movieGenres.symmetricDifference(movieGenres2)

// Set Membership Equality
// isEqual will check if all members of a set are the same as those of another
movieGenres == movieGenres2

// is subset checks whether a set is a subset of another set
movieGenres2.isSubset(of: movieGenres)

// is superset checks whether a set is a superset of another set
movieGenres.isSuperset(of: movieGenres2)

// is disjoint checks whether a set has no values in common with another set
let movieGenresDisjoint: Set = ["Romantic Comedy"]
movieGenresDisjoint.isDisjoint(with: movieGenres)

