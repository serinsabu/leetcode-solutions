class Solution {
    public String simplifyPath(String path) {
        int n = path.length();
        Stack<String> st = new Stack<>();
        String[] str = path.split("/");
        String ans = "";

        for(String dir: str) {
            if(dir.equals("..")) {
                if(!st.isEmpty())
                    st.pop();
            } else if(dir.equals(".") || dir.equals("")) {
                //ignore
                continue;
            } else {
                st.push(dir);
            }
        }
        for(String val: st) {
            ans += "/" + val;
        }
        return ans.isEmpty() ? "/" : ans;
    }
}
