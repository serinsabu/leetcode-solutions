class Solution {
    public int numberOfSubstrings(String s) {
        int n = s.length();
        int i=0;
        int j=0;
        int count = 0;
        int[] freq = new int[3];

        while(j < n) {
            char ch = s.charAt(j);
            freq[ch-'a']++;

            while(freq['a'-'a'] >= 1 && freq['b'-'a'] >= 1 && freq['c'-'a'] >= 1) {
                count += n-j;
                freq[s.charAt(i)-'a']--;
                i++;
            }
            j++;
        }
        return count;
    }
}
