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

// Example usage:
let root = TreeNode(1)
root.left = TreeNode(2)
root.right = TreeNode(3)
root.left?.left = TreeNode(4)
root.left?.right = TreeNode(5)

let treeSum = sumOfBinaryTree(root)
print(treeSum)

