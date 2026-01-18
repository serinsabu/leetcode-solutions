class Solution {
    public boolean isSubsequence(String s, String t) {
        int n = s.length();
        int m = t.length();
        int i=0;
        int j=0;
        if(s.isEmpty()) return true;

        if(n > m) return false;
        while(i < n && j < m) {
            char ch1 = s.charAt(i);
            char ch2 = t.charAt(j);

            if(ch1 == ch2) {
                i++;
            }
                j++;
        }
        return i >= n;
    }
}
