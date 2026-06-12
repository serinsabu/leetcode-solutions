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
        guard !lists.isEmpty else { return nil }
        // Start by merging 1 list with its adjacent list.
        // Example:
        // [L1, L2, L3, L4]
        //
        // interval = 1
        // Merge:
        // L1 + L2
        // L3 + L4
        var interval = 1
        var n = lists.count
        var lists = lists
        
        //moving interval each time
        while interval < n {
            var i = 0
            while i + interval < n {
                //i=0 => merge(l1,l2)
                //i=2 =>merge(l3,l4)
                lists[i] = mergeTwoLists(lists[i], lists[i+interval])
                // 0+2=2
                i += interval * 2
            }
            // interval = 1*2 = 2
            interval *= 2
        }
        return lists[0]
    }

    private func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var dummy = ListNode(-1)
        var temp = dummy

        var l1 = list1
        var l2 = list2

        while l1 != nil && l2 != nil {
            if l1!.val <= l2!.val {
                temp.next = l1
                temp = temp.next!
                l1 = l1?.next
            } else {
                temp.next = l2
                temp = temp.next!
                l2 = l2?.next
            }
        }

        while l1 != nil {
            temp.next = l1
            temp = temp.next!
            l1 = l1?.next
        }

        while l2 != nil {
            temp.next = l2
            temp = temp.next!
            l2 = l2?.next
        }
        return dummy.next
    }
}
