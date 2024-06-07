import UIKit

/*
 This problem was asked by Uber.

 Given an array of integers, return a new array such that each element at index i of the new array is the product of all the numbers in the original array except the one at i.

 For example, if our input was [1, 2, 3, 4, 5], the expected output would be [120, 60, 40, 30, 24]. If our input was [3, 2, 1], the expected output would be [2, 3, 6].

 Follow-up: what if you can't use division?
 */

var numbers = [1, 2, 3, 4, 5]

/// Time complexity: O of n squared (Quadratic time)
func modify1(_ numbers: [Int]) -> [Int] {
    var result = [Int]()

    for number in numbers {
        var i = 1

        for j in numbers {
            if j != number {
                i = i * j
            }
        }

        result.append(i)
    }

    return result
}

/// Time complexity: O of n squared (Quadratic time)
func modify2(_ numbers: [Int]) -> [Int] {
    numbers.map {
        var i = 1

        for j in numbers {
            if j != $0 {
                i = i * j
            }
        }

        return i
    }
}

/// Time complexity: O of n (linear)
func modify3(_ numbers: [Int]) -> [Int] {

    var i = 1

    for number in numbers {
        i = i * number
    }

    return numbers.map {
        i / $0
    }
}

print(modify3(numbers))
