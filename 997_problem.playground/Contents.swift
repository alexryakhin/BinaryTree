import UIKit

/*
 Given the root to a binary tree, implement serialize(root), which serializes the tree into a string, and deserialize(s), which deserializes the string back into the tree.

 For example, given the following Node class

 class Node:
     def __init__(self, val, left=None, right=None):
         self.val = val
         self.left = left
         self.right = right
 The following test should pass:

 node = Node('root', Node('left', Node('left.left')), Node('right'))
 assert deserialize(serialize(node)).left.left.val == 'left.left'
 */

var greeting = "Hello, playground"

final class Node {
    let val: String
    let left: Node?
    let right: Node?
    
    init(_ val: String, left: Node? = nil, right: Node? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}

let root = Node("root", left: Node("left", left: Node("left.left")), right: Node("right"))


func serealize(_ node: Node? = nil) -> String {
    guard let node else { return "null|" }
    return  "\(node.val)|" + serealize(node.left) + serealize(node.right)
}

let string = serealize(root)
print(string)

func deserialize(_ string: String?) -> Node? {
    guard let string else { return nil }
    guard !string.isEmpty else { return nil }
    let parts = string.components(separatedBy: "|")
    guard let val = parts.first else { return nil }
    if val == "null" { return nil }
    if parts.count == 1 {
        return Node(val)
    } else if parts.count == 2 {
        return Node(val, left: deserialize(parts[1]))
    } else if parts.count == 3 {
        let left = deserialize(parts[1])
        let right = deserialize(parts[2])
        return Node(val, left: left, right: right)
    } else {
        return Node(
            val,
            left: deserialize(parts[1]),
            right: deserialize(parts[2])
        )
    }
}

let rootDeserialized = deserialize(string)

if let rootDeserialized {
    dump(rootDeserialized)
}
