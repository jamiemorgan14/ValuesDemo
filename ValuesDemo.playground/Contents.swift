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
print(secondFavoriteAnimal)
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

