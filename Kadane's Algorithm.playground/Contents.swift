import UIKit

/*
 Given an array of numbers, find the maximum sum of any contiguous subarray of the array.

 For example, given the array [34, -50, 42, 14, -5, 86], the maximum sum would be 137, since we would take elements 42, 14, -5, and 86.

 Given the array [-5, -1, -8, -9], the maximum sum would be 0, since we would not take any elements.

 Do this in O(N) time.
 */

func maxSumSubArray(_ array: [Int]) -> Int {
    guard !array.isEmpty else { return 0 }

    var maxSum = array[0]
    var currentSum = array[0]

    array.dropFirst().forEach {
        currentSum = max(currentSum + $0, $0)
        maxSum = max(maxSum, currentSum)
    }

    return max(maxSum, 0)
}

maxSumSubArray([34, -50, 42, 14, -5, 86])
maxSumSubArray([-5, -1, -8, -9])
