import Foundation

/*
 This problem was asked by Amazon.

 Given an array of numbers, find the maximum sum of any contiguous subarray of the array.

 For example, given the array [34, -50, 42, 14, -5, 86], the maximum sum would be 137, since we would take elements 42, 14, -5, and 86.

 Given the array [-5, -1, -8, -9], the maximum sum would be 0, since we would not take any elements.

 Do this in O(N) time.
 */

/*
 The problem is a classic algorithmic problem known as "Kadane's Algorithm," which efficiently finds the maximum sum of any contiguous subarray in linear time O(n).
 */

/// Kadane's Algorithm works by iterating through the array while keeping track of the maximum subarray sum ending at each position. It also maintains a global maximum that represents the highest sum encountered so far.
func maxSubarraySum(_ nums: [Int]) -> Int {
    /// Edge case where we have 0 elements in the given array
    guard !nums.isEmpty else { return 0 }

    /// The maximum subarray sum ending at the current position.
    var max_current = nums[0]

    /// The maximum subarray sum found so far.
    var max_global = nums[0]

    /// For each element, update max_current to be the maximum of the current element itself or the current element added to max_current (which represents the sum of the subarray ending at that position).
    for i in 1..<nums.count {
        max_current = max(nums[i], max_current + nums[i])
        if max_current > max_global {
            max_global = max_current
        }
    }

    /// If all numbers are negative, max_global should be 0
    return max(0, max_global)
}

// Example usage
let nums1 = [34, -50, 42, 14, -5, 86]
print(maxSubarraySum(nums1))  // Output: 137

let nums2 = [-5, -1, -8, -9]
print(maxSubarraySum(nums2))  // Output: 0
