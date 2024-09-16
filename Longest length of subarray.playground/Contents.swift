import UIKit

/*
 Given a array of binary integers (0, 1)
 find the length of the longest contiguous subarray where every element is 1
 */

func longestContiguousSubarray(_ array: [Int]) -> Int {
    var maxLength = 0
    var currentLength = 0
    
    for element in array {
        if element == 1 {
            currentLength += 1
        } else {
            maxLength = max(maxLength, currentLength)
            currentLength = 0
        }
    }

    return max(maxLength, currentLength)
}

let str = "12 1"

// print str where remove spaces and new lines
print(str.split(separator: .whitespacesAndNewlines).joined())
