import UIKit

/*
 This problem was asked by Microsoft.

 Given an array of numbers and a number k, determine if there are three entries in the array which add up to the specified number k. For example, given [20, 303, 3, 4, 25] and k = 49, return true as 20 + 4 + 25 = 49.
 */

func hasThreeSum(_ numbers: [Int], _ k: Int) -> Bool {
    /// Edge case, return false
    guard numbers.count >= 3 else { return false }

    /// Sorted numbers array
    let numbers = numbers.sorted()

    /// Count of numbers
    let n = numbers.count

    /// We iterate through the array, fixing one element at a time. For each fixed element numbers[i], we need to find two other elements that sum up to k - numbers[i].
    for i in 0..<n-2 {
        let target = k - numbers[i]
        var left = i + 1
        var right = n - 1

        while left < right {
            let sum = numbers[left] + numbers[right]
            if sum == target {
                return true
            } else if sum < target {
                left += 1
            } else {
                right -= 1
            }
        }
    }

    return false
}

// Usage
let numbers = [20, 303, 3, 4, 25]
let k = 49
print(hasThreeSum(numbers, k))  // Output: true

/*
 Time Complexity

 Sorting:
 O(n log n)

 Iterating and Two-Pointer Search:
 O(n) × O(n) = O(n squared)

 The total time complexity is O(n squared)
 */
