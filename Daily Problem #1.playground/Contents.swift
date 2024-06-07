import UIKit

/*
 This problem was recently asked by Google.

 Given a list of numbers and a number k, return whether any two numbers from the list add up to k.

 For example, given [10, 15, 3, 7] and k of 17, return true since 10 + 7 is 17.

 Bonus: Can you do this in one pass?
 */

/*
 To solve this problem efficiently, you can use a hash set to keep track of the numbers you've seen so far while iterating through the list. This allows you to check in constant time whether the complement of the current number (i.e., \( k - \text{current number} \)) has already been seen. This approach achieves an \( O(n) \) time complexity and only requires one pass through the list.

 ### Detailed Steps

 1. **Initialize an Empty Set**:
     - Use a set to store the numbers you have seen so far.

 2. **Iterate Through the List**:
     - For each number in the list, calculate its complement (i.e., \( k - \text{current number} \)).
     - Check if the complement is already in the set.
     - If the complement is found in the set, return `true` because a pair has been found that sums up to \( k \).
     - If not, add the current number to the set and continue.

 3. **Return `false` if No Pair is Found**:
     - If the iteration completes without finding any pair that adds up to \( k \), return `false`.

 ### Swift Implementation

 Here’s how you can implement this approach in Swift:
 */

func hasPairWithSum(_ nums: [Int], _ k: Int) -> Bool {
    var seen = Set<Int>()

    for num in nums {
        let complement = k - num
        if seen.contains(complement) {
            return true
        }
        seen.insert(num)
    }

    return false
}

// Example usage
let nums = [10, 15, 3, 7]
let k = 17
print(hasPairWithSum(nums, k))  // Output: true

/*
 ### Explanation

 - **Initialization**:
   - `var seen = Set<Int>()` initializes an empty set to keep track of the numbers we have seen.

 - **Iteration**:
   - `for num in nums` iterates through each number in the list.
   - `let complement = k - num` calculates the complement for the current number.
   - `if seen.contains(complement)` checks if the complement is in the set.
   - `seen.insert(num)` adds the current number to the set if the complement is not found.

 - **Return `true`**:
   - If the complement is found in the set, `return true` immediately as it means a pair that adds up to \( k \) exists.

 - **Return `false`**:
   - If the loop completes without finding such a pair, `return false`.

 ### Time Complexity

 - **Time Complexity**: \( O(n) \), where \( n \) is the number of elements in the list. Each lookup and insertion operation in the set takes \( O(1) \) time on average.
 - **Space Complexity**: \( O(n) \), as in the worst case, all elements could be added to the set.

 This approach ensures that the problem is solved in a single pass through the list, making it efficient and optimal for large datasets. If you have any more questions or need further clarifications, feel free to ask!

 */
