import UIKit

//Type casting in Swift is implemented with the is and as operators. is is used to check the type of a value whereas as is used to cast a value to a different type.

class LivingBeing {
    var age: Int?
    
    init(age: Int?) {
        if let age = age {
            self.age = age
        }
    }
}

class Human: LivingBeing {
    var name: String?
    
    init(name: String?, age: Int?) {
        if let name = name {
            self.name = name
        }
        // super.init here means we are using the superClass method of init()
        // null check, evalutes if age is not nil, if not, it passes age, if it is nil it passes 0
        super.init(age: age ?? 0)
    }
}

class Animal: LivingBeing {
    var isMammal: Bool?
    
    init(isMammal: Bool?, age: Int?) {
        if let isMammal = isMammal {
            self.isMammal = isMammal
        }
        super.init(age: age ?? 0)
    }
}

let livingBeingArray = [Animal(isMammal: true, age: 10), Human(name: "Dexter", age: 49)]
// We can create an array that includes both animal and human, because they both share LivingBeing superclass. If we inspect our livingBeingArray, we will see it is type [LivingBeing]
// In this array, our items are still human and animal, technically, but when we iterate over this array the types we receive will be LivingBeing. To use them as their intended type, we need to check their type or downcast them to a different type

// Checking Type
let livingBeingObj = livingBeingArray[0] // inspect type with option + click

// We can check whether an instance is of a certain subclass type by using the "is" keyword, which returns a bool

for item in livingBeingArray {
    if item is Animal {
        print("item is of type Animal") // first item
    } else if item is Human {
        print("item is of type Human") // second item
    }
}

// Downcasting

// From apple docs: A constant or variable of a certain class type may actually refer to an instance of a subclass behind the scenes. Where you believe this is the case, you can try to downcast to the subclass type with a type cast operator (as? or as!).

// Since we know that livingBeingArray will return a LivingBeing object, we can try to downcast the type after getting it from the array.

// Swift uses as? and is? to downcast
// as? is conditional downcasting
// is? is forced downcasting

//The conditional usage returns an optional value of the type you are trying to downcast to
// The forced type attempts to downcast and force-unwraps the result in one step.

// if there's a chance the downcast will fail, we can use the optional (as?) version. This value can be nil, so if the downcast was not successful it will return nil

let animal = livingBeingArray[0]
let human = livingBeingArray[1]

let animalObj = animal as! Animal
let humanObj = human as! Human

// These work, because our first element of the array is of type animal and the second element is of type human

// However, if we try and force downcast the human element to what we know is an animal, and vice versa, the process will crash

//let animalObjFail = human as! Animal
//let humanObjFail = animal as! Human

// in this case, we can use optional downcasting to prevent the app from crashing

let animalObjOptionalNil = animal as? Human
let humanObjOptionalNil = human as? Animal

let animalObjOptional = animal as? Animal
let humanObjOptional = human as? Human

// We can also upcast from a base class to its superclass

let animalObj1 = animal as! Animal

let animalObjectAsLivingBeingObj = animalObj1 as LivingBeing

animalObjectAsLivingBeingObj is Animal
animalObjectAsLivingBeingObj is LivingBeing

// Using Any and AnyObject
// Swift has two types for working with non-specifics
// Any can represent an instance of any type at all, including function types
// AnyObject can represent an instance of any class type
// The keyword ‘Any’ is used to represent an instance which belongs to any type including function types. Consider an array of type Any which can accept different types of values. We can use a switch statement to checl the type and do downcasting.

var groups = [Any]()
groups.append(1.0)
groups.append(1)
groups.append("string")

for item in groups {
    switch item {
    case _ as Int:
        print("\(item) is an int")
    case _ as Double:
        print("\(item) is a double")
    case let aString as String:
        // The above warning is because we're declaring an unused variable. the _ in the previous cases allows us to bypass declaring a variable, but still evaluate the expression
        print("\(item) is a string")
    default:
        print("The limit does not exist")
    }
}

for obj in livingBeingArray
{
    switch obj {
    case is Animal:
        print("\(obj) is an animal")
        break
    case is Human:
        print("\(obj) is an human")
        break
    default:
        print("unknown type")
    }
}


// Guard statements
var value: Int? = 1
//value = nil

func testGuard() -> Int {
    // We don't need ! here to unwrap value, because it is implicitly optional since we are using it in a guard statement
    guard let val = value else {
        return 0
    }
    return val
}
print(testGuard())
