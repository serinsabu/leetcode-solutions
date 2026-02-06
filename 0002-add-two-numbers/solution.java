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
    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        ListNode dummy = new ListNode(-1);
        ListNode temp = dummy;
            int carry = 0;
        while(l1 != null || l2 != null || carry > 0) {
            int sum = 0;
            if(l1 != null) {
                sum += l1.val;//3
                l1 = l1.next;
            }

            if(l2 != null) {
                sum += l2.val;//4
                l2 = l2.next;
            }
            sum += carry;//8
            int dig = sum%10;//0
            carry = sum/10;//1
            temp.next = new ListNode(dig);//-1 -> 7 -> 0
            temp = temp.next;
        }
        return dummy.next;
    }
}
