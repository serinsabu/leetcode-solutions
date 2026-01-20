class Solution {
    public boolean isAnagram(String s, String t) {
        // anagram => must contain every character of t in s, order can be different
        /*
            Two strings are anagrams if and only if:
            They have the same length
            Every character appears the same number of times
            so check length first
        */
        int[] freq = new int[256];
        int n = s.length();
        int m = t.length();

        if(n != m) return false;

        for(int i=0; i<n; i++) {
            char ch1 = s.charAt(i);
            freq[ch1]++;
        }

        for(int i=0; i<m; i++) {
            char ch1 = t.charAt(i);
            if(freq[ch1] > 0) {
                freq[ch1]--;
            } else {
                return false;
            }
        }
        return true;
    }
}
