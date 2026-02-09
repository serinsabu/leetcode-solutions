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
    public ListNode reverseBetween(ListNode head, int left, int right) {
        if(head.next == null) {
            return head;
        }

        // dummy node to handle left = 1 case
        ListNode dummy = new ListNode(-1);
        dummy.next = head;
        
        // move beforeLeft to (left - 1)th node
        ListNode beforeLeft = dummy;
        for(int i=0; i<left-1; i++) {
            beforeLeft = beforeLeft.next;
        }

        // Identify left and right nodes
        ListNode leftNode = beforeLeft.next;
        ListNode rightNode = leftNode;  
        // get the count excluding last element
        // run the loop for all the elements between right and left excluding last val
        // will reach the correct right node
        for(int i=0; i<right-left; i++) {
            rightNode = rightNode.next;
        }

        // cut the list - for that, save the nodes after the right pointer
        // the make the next pointer of right to null
        ListNode rightNext = rightNode.next;
        rightNode.next = null;

        // reverse the sublist
        ListNode newHead = reverse(leftNode);

        // reconnect - beforeLeft.next has nodes from 1 pointer before left
        beforeLeft.next = newHead;
        leftNode.next = rightNext;

        return dummy.next;
    }

    public ListNode reverse(ListNode head) {
        ListNode prev = null;
        ListNode curr = head;
        while(curr != null) {
            ListNode temp = curr.next;
            curr.next = prev;
            prev = curr;
            curr = temp;
        }
        return prev;
    }
}
