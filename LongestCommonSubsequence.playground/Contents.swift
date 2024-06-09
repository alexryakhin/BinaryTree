import Foundation

func longestCommonSubsequence(_ str1: String, _ str2: String) -> Int {
    let strCount1 = str1.count
    let strCount2 = str2.count

    // Early termination if one of the strings is empty
    if strCount1 == 0 || strCount2 == 0 {
        return 0
    }

    // Convert strings to arrays of characters for easier indexing
    let str1Array = Array(str1)
    let str2Array = Array(str2)

    // Dictionary to store results of subproblems
    var memo = [String: Int]()

    func lcs(_ i: Int, _ j: Int) -> Int {
        // Base case: if either string is empty
        if i == 0 || j == 0 {
            return 0
        }

        // Create a unique key for the current state
        let key = "\(i)-\(j)"

        // Check if the result is already cached
        if let cachedResult = memo[key] {
            return cachedResult
        }

        // Compute the result for the current state
        var result: Int
        if str1Array[i - 1] == str2Array[j - 1] {
            result = 1 + lcs(i - 1, j - 1)
        } else {
            result = max(lcs(i - 1, j), lcs(i, j - 1))
        }

        // Cache the result
        memo[key] = result
        return result
    }

    // Start the recursion from the end of both strings
    return lcs(strCount1, strCount2)
}

// Example usage
let X = "ABCBDAB"
let Y = "BDCAB"
print("Length of LCS is \(longestCommonSubsequence(X, Y))")  // Output: 4
