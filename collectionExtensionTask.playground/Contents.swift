import UIKit

/*
 [1, 2, 3, 4, 5].groupBy { $0 % 2 } -> [
    0: [2, 4],
    1: [1, 3, 5]
]

 ["Nick", "Dan", "Alex"].groupBy { $0.count } -> [
    6: ["Nick", "Alex"],
    5: ["Dan"]
 ]
 */

extension Array where Element: Hashable {
    func groupBy<Key: Hashable>(_ key: (Element) -> Key) -> [Key: [Element]] {
        Dictionary(grouping: self, by: key)
    }
}

print([1, 2, 3, 4, 5].groupBy { $0 % 2 })
print(["Nick", "Dan", "Alex"].groupBy { $0.count })
print(["Nick", "Dan", "Alex", "Nate"].groupBy { $0.first })
