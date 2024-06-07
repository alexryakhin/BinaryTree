import UIKit

class TreeNode {
    var value: Int
    var left: TreeNode?
    var right: TreeNode?

    init(_ value: Int) {
        self.value = value
    }
}

func sumOfBinaryTree(_ root: TreeNode?) -> Int {
    guard let root else { return 0 }

    let leftSum = sumOfBinaryTree(root.left)
    let rightSum = sumOfBinaryTree(root.right)

    return root.value + leftSum + rightSum
}

func countNodes(_ root: TreeNode?) -> Int {
    guard let root else { return 0 }

    // Calculate the height of the leftmost path
    var leftHeight = 0
    var currentLeft = root
    while currentLeft.left != nil {
        leftHeight += 1
        currentLeft = currentLeft.left!
    }

    // Calculate the height of the rightmost path
    var rightHeight = 0
    var currentRight = root
    while currentRight.right != nil {
        rightHeight += 1
        currentRight = currentRight.right!
    }

    // If the heights are equal, the tree is a full binary tree
    if leftHeight == rightHeight {
        return (1 << (leftHeight + 1)) - 1
    }

    // If the heights are not equal, recursively count nodes in left and right subtrees
    return 1 + countNodes(root.left) + countNodes(root.right)
}

// Example usage:
let root = TreeNode(1)
root.left = TreeNode(2)
root.right = TreeNode(3)
root.left?.left = TreeNode(4)
root.left?.right = TreeNode(5)
root.right?.left = TreeNode(6)

let treeSum = sumOfBinaryTree(root)
print(treeSum)

let totalNodes = countNodes(root)
print(totalNodes)
