class Solution {
    public int[] canSeePersonsCount(int[] heights) {
        int n = heights.length;
        int[] ans = new int[n];
        Stack<Integer> st = new Stack<>();

        //st=[4,]
        for(int i=n-1; i>=0; i--) {//2
            int count = 0;
            while(!st.isEmpty() && heights[st.peek()] <= heights[i]) {
                st.pop();
                count++;//2
            }

            if(!st.isEmpty()) {
                count++;
            }
                ans[i] = count;
            
            st.push(i);
        }
        return ans;//
    }
}
