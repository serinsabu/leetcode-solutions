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
    public ListNode deleteDuplicates(ListNode head) {
        Map<Integer, Integer> map = new TreeMap<>();
        ListNode curr = head;

        while(curr != null) {
            map.put(curr.val, map.getOrDefault(curr.val, 0)+1);
            curr = curr.next;
        }
        //map={1-1,2-1,3-2,4-2,5-1}
        ListNode dummy = new ListNode(-1);
        ListNode temp = dummy;
        for(Integer m: map.keySet()) {
            if(map.get(m) == 1) {
                ListNode node = new ListNode(m);
                dummy.next = node;
                dummy = dummy.next;
            }
        }
        return temp.next;
    }
}
