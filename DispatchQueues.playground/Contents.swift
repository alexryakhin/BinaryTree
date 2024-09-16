import Foundation
//
//print("print 1")
//
//func execute() {
//    print("print 2")
//
//    DispatchQueue.global().async {
//        print("print 3")
//        DispatchQueue.main.sync {
//            print("print 4")
//        }
//        print("print 5")
//    }
//
//    print("print 6")
//}
//
//print("print 7")
//
//// Execute the function
//execute()
//
//class Object {
//    private let creationDate: Date
//
//    init() {
//        self.creationDate = Date()
//    }
//
//    deinit {
//        print("Object was alive for \(Date().timeIntervalSince(creationDate)) seconds")
//    }
//
//    func doSomething() { 
//        // action
//    }
//}
//
//let obj = Object()
//
//DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
//    DispatchQueue.main.async { [weak obj] in
//        obj?.doSomething()
//    }
//}
//
//protocol Animal {}
//
//extension Animal {
//    var name: String { "Animal" }
//}
//
//struct Dog: Animal {
//    var name = "Dog"
//}
//
//let dog: Animal = Dog()
//
//print(dog.name)
//
//let ints = [1,4,6,3,5]
//
//func sortedInts(_ ints: [Int]) -> [Int] {
//    return ints.sorted(by: { $0 < $1 })
//}
//
//print(sortedInts(ints))

func exampleTask() {
    print("Start")

    DispatchQueue.global().async {
        print("1")

        DispatchQueue.main.async {
            print("2")
        }

        print("3")
    }

    DispatchQueue.global().async {
        print("4")

        DispatchQueue.main.sync {
            print("5")
        }

        print("6")
    }

    print("End")
}

exampleTask()


class Vehicle {
    func startEngine() {
        print("Engine started")
    }
}

class Car: Vehicle {
    override func startEngine() {
        print("Car engine started")
    }
}

let myCar: Vehicle = Car()
myCar.startEngine()

protocol VehicleInterface {
    // Метод не определен в теле протокола
}

extension VehicleInterface {
    func startEngine() {
        print("Default engine started")
    }
}

struct Truck: VehicleInterface {
    func startEngine() {
        print("Truck engine started")
    }
}

let truck = Truck()
truck.startEngine()
