/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        // testcase head=[], k=0 , expected = [] -> return nil
        if head == nil {
            return nil
        }
        var curr = head
        var len = 0

        while curr != nil {
            len += 1
            curr = curr?.next
        }

        // testcase for this head = [1], k=0 , expected=[1], but i got = []
        if k%len == 0 {
            return head
        }
        
        curr = head
        for _ in 0..<len-(k%len)-1 {
            curr = curr?.next
        }
        
        var dummy = curr?.next
        var first = curr?.next
        curr?.next = nil

        while first?.next != nil {
            first = first?.next
        }

        first?.next = head
        return dummy
    }
}
