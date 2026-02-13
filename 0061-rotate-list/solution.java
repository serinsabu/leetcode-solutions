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
    /*
            Think like this:
            1.	Count length n
            2.	Make list circular
        (connect tail → head)
            3.	Find new tail
            4.	Break circle
    */
    public ListNode rotateRight(ListNode head, int k) {
        // idea is to get last k nodes to front => (length-k) nodes
        if(head == null) {
            return head;
        }
        // find length 
        int length = 1;
        ListNode curr = head;
        while(curr.next != null) {
            curr = curr.next;
            length++;
        }

        // try to get curr to the last node , NOT TO NULL
        curr.next = head;

        // make sure to do k%n -> the idea is to make it circular , then break circle
        // run loop till (n-k), get (n-k%n)th node
        // get one node previous to kth node, thats why run till n-k=> 5-2 = 3rd node from 0
        ListNode newTail = head;
        for(int i=1; i<length-k%length; i++) {
            newTail = newTail.next;
        }
        
        // after 3rd node, k nodes will be moved to front
        // make 3rd node next to null, but before that 3rd node next would be new head
        // the make 3rd node next to null as that will be the last node
        ListNode newHead = newTail.next;
        newTail.next = null;

        return newHead;
    }
}
