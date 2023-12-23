import UIKit

/*
 This problem was asked by Google.

 Given a sorted list of integers, square the elements and give the output in sorted order.

 For example, given [-9, -2, 0, 2, 3], return [0, 4, 4, 9, 81].
*/

let inputIntegers: [Int] = [-9, -2, 0, 2, 3]

let output = inputIntegers.map { $0 * $0 }.sorted()

print("output \(output)")
