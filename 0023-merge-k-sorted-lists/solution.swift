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
        var interval = 1
        var n = lists.count
        var lists = lists

        guard !lists.isEmpty else {
            return nil
        }
        
        while interval < n {
            var i = 0
            while i + interval < n {
                lists[i] = mergeSortedList(lists[i], lists[i+interval])
                i += interval * 2
            }
            interval *= 2
        }
        return lists[0]
    }

    private func mergeSortedList(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var dummy = ListNode(0)
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
        
        while(l1 != nil) {
            temp.next = l1
            temp = temp.next!
            l1 = l1?.next
        }
        while(l2 != nil) {
            temp.next = l2
            temp = temp.next!
            l2 = l2?.next
        }
        return dummy.next
    }
}
