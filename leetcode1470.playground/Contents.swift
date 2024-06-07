import UIKit

/*
 Leetcode 1470. Shuffle the Array

 Given the array nums consisting of 2n elements in the form [x1,x2,...,xn,y1,y2,...,yn].

 Return the array in the form [x1,y1,x2,y2,...,xn,yn].
 */

class Solution {
    func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
        var result = [Int]()

        for i in 0..<n {
            result.append(nums[i])
            result.append(nums[n + i])
        }
        return result
    }
}

let a1 = [2,5,1,3,4,7]
print(Solution().shuffle(a1, a1.count / 2))

let a2 = [1,2,3,4,4,3,2,1]
print(Solution().shuffle(a2, a2.count / 2))

let a3 = [1,1,2,2]
print(Solution().shuffle(a3, a3.count / 2))
