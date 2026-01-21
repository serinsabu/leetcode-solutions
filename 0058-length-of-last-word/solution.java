class Solution {
    public int lengthOfLastWord(String s) {
        int n = s.length();
        int end = n-1;

        while(end >= 0 && s.charAt(end) == ' ') {
            end--;
        }

        int start = end;
        while(start >= 0 && s.charAt(start) != ' ') {
            start--;
        }
        return end - start;
    }
}
