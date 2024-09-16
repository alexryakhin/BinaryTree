import Foundation

// Function to measure the execution time of a code block
func measureTime(for closure: () -> Void) {
    let startTime = CFAbsoluteTimeGetCurrent()
    closure()
    let endTime = CFAbsoluteTimeGetCurrent()
    let timeElapsed = endTime - startTime
    print("Time elapsed: \(timeElapsed) seconds")
}

// Example: Constant Time - O(1)
func constantTime() {
    let array = [1, 2, 3, 4, 5]
    print(array[2])  // Accessing an element takes constant time O(1)
}

// Example: Linear Time - O(n)
func linearTime() {
    let array = Array(1...1_000_000)
    var sum = 0
    for number in array {
        sum += number
    }
    print("Sum: \(sum)")
}

// Example: Quadratic Time - O(n^2)
func quadraticTime() {
    let array = Array(1...1000)
    for _ in array {
        for _ in array {
            // Nested loop - takes O(n^2) time
        }
    }
    print("Completed quadratic loop")
}

// Measure time for each function
measureTime {
    constantTime()  // O(1)
}

measureTime {
    linearTime()  // O(n)
}

measureTime {
    quadraticTime()  // O(n^2)
}

