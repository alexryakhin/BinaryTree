import UIKit

/*
 You are given a sorted array consisting of only integers where every element appears exactly twice, except for one element which appears exactly once.

 Return the single element that appears only once.

 Your solution must run in O(log n) time and O(1) space.

 So apparently the targeted number is located on the odd index of the array. So I need to look for that odd index.

 [1,1,2,3,3,4,4,8,8]
 [3,3,7,7,10,11,11]
 */

func singleNonDuplicate(_ nums: [Int]) -> Int {
    var low = 0
    var high = nums.count - 1
    
    while low <= high {
        let mid = (low + high) / 2
        let left = mid - 1
        let right = mid + 1
        
        if left >= 0 && nums[left] == nums[mid] {
            high = mid - 1
        }
    }

    return nums[low]
}

singleNonDuplicate([1,1,2,3,3,4,4,8,8])
