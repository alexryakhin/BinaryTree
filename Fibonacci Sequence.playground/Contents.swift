import UIKit

/*
 Fibonacci Sequence

 In the Fibonacci sequence, each number is the sum of the two preceding ones.
 */

// Standard Version
func fibonacci(_ n: Int) -> Int {
    if n == 0 { return 0 }
    if n == 1 { return 1 }
    return fibonacci(n - 1) + fibonacci(n - 2)
}

// Memoization Version
func memoizedFibonacci(_ n: Int) -> Int {
    var memo: [Int: Int] = [:]
    func fibonacci(_ n: Int) -> Int {
        if n == 0 { return 0 }
        if n == 1 { return 1 }

        if let result = memo[n] { return result }
        memo[n] = fibonacci(n - 1) + fibonacci(n - 2)
        return memo[n]!
    }

    return fibonacci(n)
}

// Function to measure the execution time of a code block
func measureTime(for closure: () -> Void) {
    let startTime = CFAbsoluteTimeGetCurrent()
    closure()
    let endTime = CFAbsoluteTimeGetCurrent()
    let timeElapsed = endTime - startTime
    print("Time elapsed: \(timeElapsed) seconds")
}

//measureTime(for: { print(fibonacci(10)) })
measureTime(for: { print(memoizedFibonacci(92)) })
