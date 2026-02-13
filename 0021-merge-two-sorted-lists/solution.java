/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
    public ListNode mergeTwoLists(ListNode list1, ListNode list2) {
        ListNode dummy = new ListNode(-1);
        ListNode temp = dummy;
        while(list1 != null && list2 != null) {
            if(list1.val <= list2.val) {
                ListNode node1 = new ListNode(list1.val);
                dummy.next = node1;
                list1 = list1.next;
            } else {
                ListNode node2 = new ListNode(list2.val);
                dummy.next = node2;
                list2 = list2.next;
            }
            dummy = dummy.next;
        }

        while(list1 != null) {
            ListNode node1 = new ListNode(list1.val);
            dummy.next = node1;
            list1 = list1.next;
            dummy = dummy.next;
        }

        while(list2 != null) {
            ListNode node2 = new ListNode(list2.val);
            dummy.next = node2;
            list2 = list2.next;
            dummy = dummy.next;
        }
        return temp.next;
    }
}
