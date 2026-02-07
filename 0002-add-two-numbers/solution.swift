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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(-1)
        var temp: ListNode? = dummy

        var p1 = l1
        var p2 = l2
        var carry = 0
        // why (OR) -> sometimes list1 elements can be more, sometimes list2 will have more
        // if carry > 0 is not included 9+9 = 18 will miss carry here
        while(p1 != nil || p2 != nil || carry > 0) {
            var sum = 0
            if let node1 = p1 {
                sum += node1.val
                p1 = node1.next
            }

            if let node2 = p2 {
                sum += node2.val
                p2 = node2.next
            }

            // calculate sum with old carry
            sum += carry
            // get a new digit
            var digit = sum%10
            // get new carry
            carry = sum/10
            temp?.next = ListNode(digit)
            temp = temp?.next
        }
        return dummy.next
    }
}
