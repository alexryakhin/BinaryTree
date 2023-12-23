import UIKit

final class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // my
        for (index1, number1) in nums.enumerated() {
            if number1 <= abs(target) {
                for (index2, number2) in nums.enumerated() {
                    if number2 == target - number1, index1 != index2 {
                        return [index1, index2]
                    }
                }
            }
        }

        // best
//        var dict = [Int: Int]()
//
//        for (index, value) in nums.enumerated() {
//            if let addent = dict[value] {
//                return [addent, index]
//            } else {
//                dict[target - value] = index
//            }
//        }
//
        return []
    }
}

print(Solution().twoSum([2,7,11,15], 9))
print(Solution().twoSum([0,4,3,0], 0))
print(Solution().twoSum([-1,-2,-3,-4,-5], -8))


// runtime: 102 ms - beats 6%
// memory: 14.12 mb - beats 85%


/*
 Best solution using Dictionary

 Approach

 This approach to solving the problem uses a dictionary to keep track of the difference between the target and each element in the input array.

 The function first initializes an empty dictionary called dict.

 Then, it loops through the array using the enumerated() method to get both the index and value of each element in the array. For each element, it checks if the difference between the target and the element is already in the dictionary. If it is, that means the current element plus the element at the index in the dictionary adds up to the target, so it returns the indices of those two elements. If the difference is not in the dictionary, it adds the difference as a key and the index as a value to the dictionary.

 If the loop is completed and no two elements in the array add up to the target, the function returns an empty array.

 Complexity

 Overall, this approach has a time complexity of O(n)O(n)O(n) because it only needs to loop through the array once, and a space complexity of O(n)O(n)O(n) because it needs to store the dictionary.

 Code

 class Solution {
     func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
         var dict = [Int: Int]()

         for (index, value) in nums.enumerated() {
             if let addent = dict[value] {
                 return [addent, index]
             } else {
                 dict[target - value] = index
             }
         }

         return []
     }
 }

 */

