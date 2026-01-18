class Solution {
    public boolean canConstruct(String ransomNote, String magazine) {
        int n = ransomNote.length();
        int m = magazine.length();
        int[] freq = new int[26];

        for(int i=0; i<m; i++) {
            char ch1 = magazine.charAt(i);
            freq[ch1 - 'a']++;
        }

        for(int i=0; i<n; i++) {
            char ch2 = ransomNote.charAt(i);
            if(freq[ch2 - 'a'] == 0) return false;
            freq[ch2 - 'a']--;
        }
        return true;
    }
}
