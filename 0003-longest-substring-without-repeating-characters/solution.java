class Solution {
    public int lengthOfLongestSubstring(String s) {
        int n = s.length();
        int i=0;
        int j=0;
        Set<Character> set = new HashSet<>();
        int maxLength = 0;

        while(j < n) {
            while(set.contains(s.charAt(j))) {
                set.remove(s.charAt(i));
                i++;//6
            }
            char ch = s.charAt(j);
            set.add(ch);//b
            //{}
            maxLength = Math.max(maxLength, j-i+1);//3
            j++;//7
        }
        return maxLength;
    }
}
