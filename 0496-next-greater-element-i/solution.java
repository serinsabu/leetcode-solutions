class Solution {
    public int[] nextGreaterElement(int[] nums1, int[] nums2) {
        int n = nums2.length;
        // Find Next greater in nums2 first
        Stack<Integer> st = new Stack<>();
        Map<Integer,Integer> map = new HashMap<>();
        for(int i=n-1; i>=0; i--) {//1
            while(!st.isEmpty() && st.peek() <= nums2[i]) {
                st.pop();
            }

            if(st.isEmpty()) {
                // ans[i] = -1;
                map.put(nums2[i], -1);
            } else {
                // ans[i] = st.peek();
                map.put(nums2[i], st.peek());
            }
            st.push(nums2[i]);
        }
        //map={1->3, 3->4, 4->-1, 2->-1}
        int ind = 0;
        int[] ans = new int[nums1.length];
        for(int i=0; i<nums1.length; i++) {
            ans[ind++] = map.getOrDefault(nums1[i], -1);
        }
        //ans[0] = -1, ans[1] = 3, ans[2] = -1
        return ans;
    }
}
