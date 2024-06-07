import UIKit

/*
 To calculate the probability that the knight remains on the board after \(k\) moves, you can use dynamic programming to keep track of the probabilities at each position on the chessboard.

 Let \(dp(x, y, m)\) be the probability of being on square \((x, y)\) after making \(m\) moves. The values of \(x\) and \(y\) range from 0 to 7, and \(m\) ranges from 0 to \(k\).

 The recurrence relation for the probability is as follows:

 \[ dp(x, y, m) = \frac{1}{8} \sum_{\text{{valid moves}}} dp(x', y', m-1) \]

 where the sum is over all valid moves from \((x, y)\), and \(dp(x', y', m-1)\) is the probability of being at \((x', y')\) after \(m-1\) moves.

 The base case is \(dp(x, y, 0) = 1\) for all \((x, y)\), as the knight is initially on the board.

 The final answer is the sum of probabilities over all squares \((x, y)\) after \(k\) moves:

 \[ \text{{Probability}} = \sum_{\text{{all squares}}}(dp(x, y, k)) \]

 This solution uses a 3D array `dp` to store probabilities and iterates through all valid moves for each position and move count. The final result is the sum of probabilities over all positions after \(k\) moves.

 This Swift-like pseudocode closely follows the logic of the dynamic programming solution in a Swift-style syntax. Note that the actual Swift code may require additional adjustments, such as type annotations and specific Swift syntax, but this pseudocode should give you a good starting point
 */

/*
 In the context of the provided pseudocode for the knight probability problem:

 - `N`: Represents the size of the chessboard. Since a standard chessboard is 8x8, `N` is set to 8.

 - `K`: Denotes the number of moves the knight will make on the chessboard.

 - `r`: Represents the initial row (or y-coordinate) of the knight on the chessboard.

 - `c`: Represents the initial column (or x-coordinate) of the knight on the chessboard.

 These parameters are inputs to the `knightProbabilityOnBoard` function, allowing you to specify the size of the chessboard, the number of moves, and the initial position of the knight. The function calculates the probability that the knight remains on the board after making the specified number of moves.
 */
func knightProbabilityOnBoard(_ N: Int, _ K: Int, _ r: Int, _ c: Int) -> Double {
    var dp: [[[Double]]] = Array(
        repeating: Array(
            repeating: Array(
                repeating: 0.0,
                count: K + 1
            ),
            count: N
        ),
        count: N
    )
    let moves = [(-2, -1), (-2, 1), (-1, -2), (-1, 2), (1, -2), (1, 2), (2, -1), (2, 1)]

    // Base case: probability is 1 for initial position
    for i in 0..<N {
        for j in 0..<N {
            dp[i][j][0] = 1.0
        }
    }

    // Dynamic programming recurrence
    for m in 1...K {
        for x in 0..<N {
            for y in 0..<N {
                for move in moves {
                    let x_new = x + move.0
                    let y_new = y + move.1
                    if 0 <= x_new && x_new < N && 0 <= y_new && y_new < N {
                        dp[x][y][m] += dp[x_new][y_new][m - 1] / 8.0
                    }
                }
            }
        }
    }

    // Sum up probabilities over all positions after K moves
    var probability: Double = 0.0
    for i in 0..<N {
        for j in 0..<N {
            probability += dp[i][j][K]
        }
    }

    return probability
}

print(knightProbabilityOnBoard(8, 100, 0, 0))
