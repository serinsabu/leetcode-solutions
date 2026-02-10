class Solution {
    public int[] dailyTemperatures(int[] temperatures) {
        int n = temperatures.length;
        Stack<Integer> st = new Stack<>();
        int[] ans = new int[n];

        //st=[6,2]
        // Next Greater Element concept - exact pattern
        // start from end 
        for(int i=n-1; i>=0; i--) {//1
            // check if stack is not empty and stack.peek() <= my current element, POP
            while(!st.isEmpty() && temperatures[st.peek()] <= temperatures[i]) {
                st.pop();
            }

            if(st.isEmpty()) {
                ans[i] = 0;
            } else {
                ans[i] = st.peek() - i;//number of elements greater than current elt
            }
            st.push(i);
        }
        return ans;//[0,0,1,1,2,4]
    }
}
