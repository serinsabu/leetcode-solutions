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
    public ListNode removeNthFromEnd(ListNode head, int n) {
        ListNode dummy = new ListNode(0);
        dummy.next = head;
        ListNode l = head;
        int jumps = 0;
        
        while(jumps < n && l != null) {
            jumps++;
            l = l.next;
        }

        ListNode prev = dummy;
        ListNode curr = l;// move l to number of jumps so curr would be 2 steps ahead already
        while(curr != null) {
            prev = prev.next; // move prev 
            curr = curr.next; // curr one step ahead
        }

        // then remove the next pointer of prev and point to next of next of prev pointer
        prev.next = prev.next.next;
        return dummy.next;
    }
}
