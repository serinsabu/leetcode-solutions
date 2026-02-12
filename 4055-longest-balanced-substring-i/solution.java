class Solution {
    public int longestBalanced(String s) {
        int n = s.length();
        int maxLength = Integer.MIN_VALUE;

        for(int i=0; i<n; i++) {
            char[] freq = new char[26];
            int maxFreq = Integer.MIN_VALUE;
            int distinct = 0;
            for(int j=i; j<n; j++) {
                char ch = s.charAt(j);
                if(freq[ch-'a'] == 0) {
                    distinct++;
                }
                freq[ch-'a']++;
                maxFreq = Math.max(maxFreq, freq[ch-'a']);
                // if equal, it means balanced
                if(maxFreq * distinct == j-i+1) {
                    // update max length
                    maxLength = Math.max(maxLength, j-i+1);
                }
            }
        }
        return maxLength;
    }
}
