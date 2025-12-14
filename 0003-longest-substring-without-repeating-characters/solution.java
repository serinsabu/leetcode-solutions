class Solution {
    public int lengthOfLongestSubstring(String s) {
        Set<Character> set = new HashSet<>();
        int n = s.length();
        int i=0;
        int j=0;
        int maxLength = Integer.MIN_VALUE;

        while(j < n) {
            while(set.contains(s.charAt(j))) {
                set.remove(s.charAt(i));
                i++;
            }
            set.add(s.charAt(j));
            maxLength = Math.max(maxLength, j-i+1);
            j++;
        }
        return maxLength == Integer.MIN_VALUE ? 0 : maxLength;
    }
}
