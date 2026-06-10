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

        // Continue until we have merged everything into one list
        while interval < n {
            // Start from the first list
            var i = 0
            // Ensure the pair exists:
            // lists[i] and lists[i + interval]
            while i + interval < n {
            // Merge the two sorted linked lists
            // Store the merged result back into the first position
            //
            // interval = 1:
            // lists[0] = merge(L1, L2)
            // lists[2] = merge(L3, L4)
            //
            // interval = 2:
            // lists[0] = merge(L1+L2, L3+L4)

            // I DID NOT ASSIGN BACK to LIST[i] -> FAILED -> [[],[1]] o/p-[], expected-[1]
                lists[i] = mergeTwoLists(lists[i], lists[i+interval])
                // Move to the next pair
                //
                // interval = 1:
                // 0 → 2 → 4 ...
                //
                // interval = 2:
                // 0 → 4 → 8 ...
                i += interval * 2
            }
            // Double interval size
            //
            // 1 → 2 → 4 → 8 ...
            //
            // Similar to Merge Sort:
            // First merge groups of size 1,
            // then groups of size 2,
            // then groups of size 4, etc.
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
