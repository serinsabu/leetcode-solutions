class Solution {
    public String reverseWords(String s) {
        // reverse the whole string
        int n = s.length();
        String ans = "";
        
        int start = n-1;
        int end = n-1;

            while(start >= 0) {
                while(end >= 0 && s.charAt(end) == ' ') {
                    end--;
                }
                start = end;
                while(start >= 0 && s.charAt(start) != ' ') {
                    start--;
                }

                for(int i=start+1; i<=end; i++) {
                    ans += s.charAt(i);
                }
                ans += " ";
                end = start;
            }

        return ans.trim();
    }
}
