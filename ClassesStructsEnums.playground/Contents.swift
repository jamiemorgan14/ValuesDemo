import UIKit

// Classes, Structures, and Enumerations

// Class declaration
class Animal {
    var name: String = ""
    var sound: String = ""
    var numberOfLegs: Int = 0
    var breathesOxygen: Bool = true
    
    // Note: properties need to be initialized in the declaration of a class
    
    init(name: String, sound: String, numberOfLegs: Int, breathesOxygen: Bool) {
        self.name = name
        self.sound = sound
        self.numberOfLegs = numberOfLegs
        self.breathesOxygen = breathesOxygen
    }
    
    func makeSound() {
        print(self.sound)
    }
    
    func describe() -> String{
        return "name: \(self.name) sound: \(self.sound) numberOfLegs: \(self.numberOfLegs) breathesOxygen: \(self.breathesOxygen)"
    }
}

var cat = Animal(name: "Cat", sound: "Meow", numberOfLegs: 4, breathesOxygen: true)

print(cat.name)
print(cat.sound)
print(cat.numberOfLegs)
print(cat.breathesOxygen)

cat.makeSound()

// Making a subclass

class Mammal: Animal {
    let hasHairOrFur: Bool = true
    
    // override description method in the superclass
    override func describe() -> String {
        return "Class: Mammal name: \(self.name) sound: \(self.sound) numberOfLegs: \(self.numberOfLegs) breathesOxygen: \(self.breathesOxygen) hasHairOrFur: \(hasHairOrFur)"
    }
}

let dog = Mammal(name: "Dog", sound: "Woof", numberOfLegs: 4, breathesOxygen: true)

print(dog.hasHairOrFur)
print(dog.describe())

// Structures
// Structures, like Classes, group together properties and methods that represent and object.
// Instances of structures can also be made

// Structure declaration
struct Reptile {
    var name: String
    var sound: String
    var numberOfLegs: Int
    var breathesOxygen: Bool
    let hasHairOrFur: Bool = false
    // Note that, unlike a class declaration, property definitions in a structure do not need to be initialized.
    
    func makeSound() {
        print(sound)
    }
    
    func description() -> String {
        return "Class: Reptile name: \(self.name) sound: \(self.sound) numberOfLegs: \(self.numberOfLegs) breathesOxygen: \(self.breathesOxygen) hasHairOrFur: \(hasHairOrFur)"
    }
}

var snake = Reptile(name: "Snake", sound: "Hiss", numberOfLegs: 0, breathesOxygen: true)
print(snake.description())
snake.makeSound()
// Note that, unlike a class, we did not need to implement an initializer; structures automatically have an initializer for all properties. This is called a MEMBERWISE INITIALIZER

// There are 2 major differences between classes and structs.
// 1: structures cannot inherit from another structure.
// 2: classes are reference types, structures are value types

// Example of value vs reference types

// Value Type in structures
struct SampleValueType {
    var sampleProperty = 10
}
var a = SampleValueType()
var b = a
b.sampleProperty = 20
print(a.sampleProperty)
print(b.sampleProperty)
// any changes made to the sampleProperty value of b do not affect the sampleProperty value of a

// Reference Type in classes
class SampleReferenceType {
    var sampleProperty = 10
}
let c = SampleReferenceType()
let d = c
c.sampleProperty = 20
print(c.sampleProperty)
print(d.sampleProperty)
// any changes made to c or d are affecting the same SampleReferenceType

// Which to use, structs or classes?
// It is recommended to use structures unless you need somthing that requires classes, such as subclasses. This actually helps to prevent some subtle errors that may occur due to classes being reference types.

// Enumerations
// Declaring an enum
enum TrafficLight {
    case red
    case yellow
    case green
}
var trafficLight = TrafficLight.red

// enums can contain methods
enum TrafficLightWithMethods {
    case red
    case yellow
    case green
    
    func trafficLightDescription() -> String {
        switch self {
        case .red:
            return "red"
        case .yellow:
            return "yellow"
        default:
            return "green"
        }
    }
}
var trafficLight2 = TrafficLightWithMethods.red
print(trafficLight2.trafficLightDescription())
