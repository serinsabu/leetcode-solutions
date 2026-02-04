class Solution {
    public int lengthOfLongestSubstring(String s) {
        int n = s.length();
        HashSet<Character> set = new HashSet<>();
        int i=0;
        int j=0;
        int maxLength = 0;
        // Check duplicates BEFORE inserting the new character, not after.
        while(j < n) {
            // if contains duplicates shrink the window
            while(set.contains(s.charAt(j))) {
                set.remove(s.charAt(i));
                i++;
            }
            set.add(s.charAt(j));
            // expand the window and update max length if window is valid
            maxLength = Math.max(j-i+1, maxLength);
            j++;
        }
        return maxLength;
    }
}
