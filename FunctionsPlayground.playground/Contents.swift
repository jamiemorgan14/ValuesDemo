import UIKit

// Functions and Closures
// func functionName(parameter1: paramerterType, ...) -> returnType {
//     code
// }

func serviceCharge(mealCost: Int) -> Int {
    return mealCost / 10
}
serviceCharge(mealCost: 50)

// custom labels allow for the syntax when calling the function to be changed. Allowing you to alias variables to be flexible with function calls
func serviceCharge2(forMealPrice mealCost: Int) -> Int {
    return mealCost / 10
}
serviceCharge2(forMealPrice: 50)

// Functions in Swift are a first-class type, so they can be used as parameters and return types
func makePi() -> (() -> Double) {
    func generatePi() -> Double {
        return 22.0/7.0
    }
    return generatePi
}

let pi = makePi()
print(pi())
// pi will be assigned generatePi() and will return 22.0/7.0 when called.

func isThereAMatch(listOfNumbers: [Int], condition: (Int) -> Bool) -> Bool {
    for item in listOfNumbers {
        if condition(item) {
            return true
        }
    }
    return false
}

func oddNumber(number: Int) -> Bool {
    return (number % 2) > 0
}

var numbersList = [2, 4, 6, 7]

isThereAMatch(listOfNumbers: numbersList, condition: oddNumber)

// Using a guard statement to exit function early

func buySomething(ItemValueAsString itemValueField: String, cardBalance: Int) -> Int {
    guard let itemValue = Int(itemValueField) else {
        print("error in item value")
        return cardBalance
    }
    let remainingBalance = cardBalance - itemValue
    return remainingBalance
}

print(buySomething(ItemValueAsString: "10", cardBalance: 50))
print(buySomething(ItemValueAsString: "Blue", cardBalance: 50))
// A guard statement checks to see whether a condition is true; if no, it exits the function. Here, we check if the value the user entered is a valid number. When it's not, the guard statement handles the invalid input by executing the else clause

// Using _ in function arguments
// In Swift, the name of the function arguments are required by default
// if we try and call buySomething with the concise syntax we're used to in other languages, we'll get an error
//buySomething("10", 50) // uncomment to see

// we can remove this requirement by adding _ as the argument label lists when we define a function
func keepItDry(_ firstParameter: String, ParameterTwo secondParameter: Int) -> String {
    return "This function doesn't do much, but we don't have to repeat ourselves every time it's called :)"
}

print(keepItDry("hi", ParameterTwo: 100))

// Closures act like functions, but don't have names
// Closures can be assigned to a constant or variable
let testClosure = { (number: Int) -> Int in
    let result = number * number
    return result
}
let mappedNumbers = numbersList.map(testClosure)
let squaredMappedNumbers = mappedNumbers.map(testClosure)
// the instructions in a closure are surrounded by curly braces and the IN keyword separates the arguments and return type from the body

// Closures can be made more concise
let consicelyMappedNumbers = numbersList.map { number in number * number }
// When a closures type is already known, you can remove the parameter type, return type, or both. Single statment closures implicitly return the value of their only statment, which means you can remove the return statement as well.
// Additionally, when a closure is the only argument to a function, you can omit the parentheses enclosing the closure, as shown above

let evenMoreConsicelyMappedNumbers = numbersList.map { $0 * $0 }
// Above we can refer to parameters by number instead of by name by using $ syntax


