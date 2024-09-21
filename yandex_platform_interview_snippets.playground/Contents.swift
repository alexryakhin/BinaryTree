import Foundation

// MARK: - with names about classes and structs
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let person1 = Person(name: "John")
let person2 = Person(name: "Jane")

let people: [Person] = [person1, person2]
let copyOfPeople = people

copyOfPeople.last?.name = "Janet"
print(people.last?.name)

// MARK: - about the weak var prints
class A {
    var delegate: B?

    init() { print("init A") }
    deinit { print("deinit A") }
}

class B {
    var delegate: A?

    init() { print("init B") }
    deinit { print("deinit B") }
}

weak var a: A? = A()
weak var b: B? = B()


func setup() {
    print("1")

    a?.delegate = b
    b?.delegate = a

    print("2")
}

print("3")

setup()

print(a?.delegate)
print(b?.delegate)

print("4")

// MARK: - method dispatch
protocol MyProtocol {

}

extension MyProtocol {
    func myMethod() {
        print("myMethod from extension")
    }
}

struct MyStruct: MyProtocol {
    func myMethod() {
        print("myMethod from struct")
    }
}

let myStruct = MyStruct()
myStruct.myMethod()

// MARK: - unit test
// Code from a library, closed for modification
public final class Tracker {

    static let shared = Tracker()

    private init() {}

    func track(event: String) {
        print("Tracking event: \(event)")
    }
}
// Our code
final class Analytics {

    func trackScreen() {
        Tracker.shared.track(event: "Screen")
    }
}

// Test function
import XCTest
func testAnalytics() {
    let analytics = Analytics()
    // write a function that checks XCTAssertEqual(_,_)
}

// MARK: - write a storage

class ThreadSafeStorage<Value> {
    var object: Value?
}

// MARK: - write a layout

// Write a simple layout. We got an optional image and a string.
// The image should be of size 32x32. The text should be to the right from the image, 12 points spacing.
// Also 16 points padding from the left of the image as well as 16 points from the right side of the text.

// MARK: - theoretic question about scroll view lags

// We got this vertical collection of items in our app, and our users report that it stutters during a scroll. how to fix this issue?
