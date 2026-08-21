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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard !lists.isEmpty else {
            return nil
        }

        var lists = lists
        var merged = lists[0]
        var interval = 1

        while interval < lists.count {
            var i = 0
            while i + interval < lists.count {
                lists[i] = mergeTwoLists(lists[i], lists[i+interval])
                i += interval * 2
            }
            interval *= 2
        }
        
        func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
            var l1 = list1
            var l2 = list2
            var dummy = ListNode(0)
            var temp = dummy

            while l1 != nil && l2 != nil {
                if l1!.val <= l2!.val {
                    let node = ListNode(l1!.val)
                    dummy.next = node
                    dummy = dummy.next!
                    l1 = l1!.next
                } else {
                    let node = ListNode(l2!.val)
                    dummy.next = node
                    dummy = dummy.next!
                    l2 = l2!.next
                }
            }
            if l1 != nil {
                dummy.next = l1
            } else {
                dummy.next = l2
            }
            return temp.next
        }
        return lists[0]
    }
}
