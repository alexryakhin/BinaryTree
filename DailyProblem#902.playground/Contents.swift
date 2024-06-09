import Foundation

/*
 This problem was asked by Stripe.

 Given a collection of intervals, find the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping.

 Intervals can "touch", such as [0, 1] and [1, 2], but they won't be considered overlapping.

 For example, given the intervals (7, 9), (2, 4), (5, 8), return 1 as the last interval can be removed and the first two won't overlap.

 The intervals are not necessarily sorted in any order.
 */

func minimumNumberOfIntervalsToRemove(_ intervals: [[Int]]) -> Int {
    // Edge case - empty array
    guard !intervals.isEmpty else { return 0 }

    // Sort the intervals by their ends
    let intervals = intervals.sorted { $0[1] < $1[1] }

    var nonOverlappingCount = 0
    var end = Int.min

    for interval in intervals {
        if interval[0] >= end {
            // No overlap, update the end variable to the end of the current interval
            end = interval[1]
            nonOverlappingCount += 1
        }
    }

    // The number of intervals to remove is the total number of intervals minus the count of non-overlapping intervals
    return intervals.count - nonOverlappingCount
}

let intervals1 = [[0, 1], [1, 2]]
print(minimumNumberOfIntervalsToRemove(intervals1))

let intervals2 = [[7, 9], [2, 4], [5, 8]]
print(minimumNumberOfIntervalsToRemove(intervals2))

let intervals3 = [[1, 3], [2, 4], [3, 5], [4, 6]]
print(minimumNumberOfIntervalsToRemove(intervals3))
