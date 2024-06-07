import UIKit

/*
 Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.



 Example 1:

 Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
 Output: [[1,6],[8,10],[15,18]]
 Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6].
 Example 2:

 Input: intervals = [[1,4],[4,5]]
 Output: [[1,5]]
 Explanation: Intervals [1,4] and [4,5] are considered overlapping.


 Constraints:

 1 <= intervals.length <= 104
 intervals[i].length == 2
 0 <= starti <= endi <= 104
 */

/*
 func merge(_ intervals: [[Int]]) -> [[Int]] {

 }
 */

func merge(_ intervals: [[Int]]) -> [[Int]] {
    // Step 1: Sort the intervals
    var intervals = intervals.sorted(by: { $0[0] < $1[0] })

    // Step 2: Initialize an array to hold the merged intervals
    var mergedIntervals: [[Int]] = []

    // Step 3: Iterate through the sorted intervals
    for interval in intervals {
        // If mergedIntervals is empty or the current interval does not overlap with the last interval in mergedIntervals
        if mergedIntervals.isEmpty || mergedIntervals.last![1] < interval[0] {
            // Add the current interval to mergedIntervals
            mergedIntervals.append(interval)
        } else {
            // If they overlap, merge them by updating the end of the last interval in mergedIntervals
            mergedIntervals[mergedIntervals.count - 1][1] = max(mergedIntervals.last![1], interval[1])
        }
    }

    // The mergedIntervals now contains the merged intervals
    return mergedIntervals
}

print(merge([[1,3],[2,6],[8,10],[15,18]]))
