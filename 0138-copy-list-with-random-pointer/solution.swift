/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var next: Node?
 *     public var random: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *    	   self.random = nil
 *     }
 * }
 */

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        guard let head = head else {
            return head
        }

        var newHead = Node(head.val)
        var prev = newHead
        var map: [Node:Node] = [head: newHead]

        var curr = head.next
        while curr != nil {
            let newNode = Node(curr!.val)
            prev.next = newNode
            map[curr!] = newNode

            prev = newNode
            curr = curr?.next
        }

        var oldCurr: Node? = head
        var newCurr: Node? = newHead

        while oldCurr != nil {
            if let random = oldCurr?.random {
                newCurr?.random = map[random]
            }
            oldCurr = oldCurr?.next
            newCurr = newCurr?.next
        }
    return newHead
    }
}
