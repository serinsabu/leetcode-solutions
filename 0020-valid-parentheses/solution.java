class Solution {
    public boolean isValid(String s) {
        int n = s.length();
        Stack<Character> st = new Stack<>();

        for(int i=0; i<n; i++) {
            char ch = s.charAt(i);
            if(ch == '(' || ch == '{' || ch == '[') {
                st.push(ch);
            } else {
                if(
                !st.isEmpty() && 
                ((st.peek() == '(' && ch == ')') ||
                (st.peek() == '{' && ch == '}') ||
                (st.peek() == '[' && ch == ']'))
                ) {
                    st.pop();
                } else {
                    return false;
                }
            }
        }
        return st.isEmpty();
    }
}
