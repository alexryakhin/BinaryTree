import UIKit

/*
 This problem was asked by Uber.

 Given an array of integers, return a new array such that each element at index i of the new array is the product of all the numbers in the original array except the one at i.

 For example, if our input was [1, 2, 3, 4, 5], the expected output would be [120, 60, 40, 30, 24]. If our input was [3, 2, 1], the expected output would be [2, 3, 6].

 Follow-up: what if you can't use division?
 */

// [1,2,3,4] -> [24,12,8,6]

func foo(_ input: [Int]) -> [Int] {
    // edge cases
    if input.isEmpty { return [] }
    if input.count == 1 { return [input[0]] }

    var result: Int = 1
    for number in input {
        result *= number
    }

    return input.map { result / $0 }
}

func foo2(_ input: [Int]) -> [Int] {
    // edge cases
    if input.isEmpty { return [] }
    if input.count == 1 { return [input[0]] }

    var resultForward: [Int] = [1]
    var resultBackward: [Int] = [1]

    var end = input.count - 1

    for i in 1..<input.count {
        resultForward.append(resultForward[i - 1] * input[i - 1])
        resultBackward.append(resultBackward[i - 1] * input[end])
        end -= 1
    }

    for i in 0..<input.count {
        resultForward[i] *= resultBackward[input.count - 1 - i]
    }
    
    return resultForward
}

func foo3(_ input: [Int]) -> [Int] {
    // Edge cases
    if input.isEmpty { return [] }
    if input.count == 1 { return [input[0]] }

    var resultForward: [Int] = [1]
    var resultBackward: [Int] = [1]

    var end = input.count - 1

    // Forward and backward product
    for i in 1..<input.count {
        resultForward.append(resultForward[i - 1] * input[i - 1])
        resultBackward.append(resultBackward[i - 1] * input[end - i + 1])
    }

    // Combining the forward and backward results
    for i in 0..<input.count {
        resultForward[i] *= resultBackward[input.count - 1 - i]
    }

    return resultForward
}


foo([1,2,3,4,5])
foo2([1,2,3,4,5])
foo3([1,2,3,4,5])
