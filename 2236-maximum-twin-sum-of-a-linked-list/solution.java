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
    public int pairSum(ListNode head) {
        // find the middle point
        ListNode slow = head;
        ListNode fast = head;

        while(fast != null && fast.next != null) {
            slow = slow.next;
            fast = fast.next.next;
        }
        ListNode p1 = head;
        // reverse
        ListNode p2 = reverse(slow);
        // then do the sum instead of comparing p1 and p2
        int max = Integer.MIN_VALUE;
        while(p1 != null && p2 != null) {
            int sum = p1.val + p2.val;
            max = Math.max(max, sum);
            p1 = p1.next;
            p2 = p2.next;
        }
        // return maximum
        return max;
    }

    public ListNode reverse(ListNode curr) {
        ListNode prev = null;
        while(curr != null) {
            ListNode temp = curr.next;
            curr.next = prev;
            prev = curr;
            curr = temp;
        }
        return prev;
    }
}
