import UIKit

/*
 Problem Statement:
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 You must assume that the input array can be in any order.

 Input: nums = [2, 7, 11, 15], target = 9
 Output: [0, 1]
 Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

 Try to solve that in O(n)
*/

// Brute forse
func twoSumBruteForce(_ nums: [Int], target: Int) -> [Int] {
    for num in nums {
        let remaining = target - num
        if let index = nums.firstIndex(of: remaining) {
            return [num, nums[index]]
        }
    }

    return []
}

// But this would not work if, for example, the target is an even number that can be composed out of two same numbers. or would it?
// And I think it's just a O(n squared) here

// How to do it better.

// I already know that I need to use a dictionary

func twoSum(_ nums: [Int], target: Int) -> [Int] {
    var dictionary: [Int: Int] = [:]

    for (index, num) in nums.enumerated() {
        let complement = target - num
        if let secondIndex = dictionary[num] {
            return [secondIndex, index]
        }
        dictionary[complement] = index
    }

    return []
}

twoSum([2, 7, 11, 15], target: 9)
