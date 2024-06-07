import UIKit

class Foo {
    var timer: Timer? = nil

    func start() {
        timer = Timer(timeInterval: 5, repeats: false, block: { [weak self] timer in
            print("timer fired")
        })
        if let timer {
            print("RunLoop.main.add(timer")
            RunLoop.main.add(timer, forMode: .default)
        }
    }
}

//let foo = Foo()

//foo.start()

struct FullResume {
    let id: String
    let age: Int
    let hasVehicle: Bool
}

MemoryLayout<FullResume>.size
MemoryLayout<FullResume>.alignment
MemoryLayout<FullResume>.stride

// move hasVehicle to the top of the structure

struct FullResume2 {
    let hasVehicle: Bool
    let id: String
    let age: Int
}

MemoryLayout<FullResume2>.size
MemoryLayout<FullResume2>.alignment
MemoryLayout<FullResume2>.stride

MemoryLayout<Int>.size // 8
MemoryLayout<Int32>.size // 4
MemoryLayout<Int16>.size // 2
MemoryLayout<Bool>.size // 1
MemoryLayout<Bool>.alignment // 1

struct Test {
    let firstBool: Bool
    let array: [Bool]
    let secondBool: Bool
    let smallInt: Int32
}

MemoryLayout<Test>.size
MemoryLayout<Test>.alignment
MemoryLayout<Test>.stride
