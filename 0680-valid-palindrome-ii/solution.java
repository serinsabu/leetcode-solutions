class Solution {
    public boolean checkPalindrome(int i, int j, String s) {
        while(i < j) {
            char left = s.charAt(i);
            char right = s.charAt(j);
            if(left != right) {
                return false;
            }
            i++;
            j--;
        }
        return true;
    }
    public boolean validPalindrome(String s) {
        int i=0;
        int j=s.length()-1;

        while(i < j) {
            char left = s.charAt(i);
            char right = s.charAt(j);

            if(left != right) {
                // delete that character , check palindrome for remaining string
                // try deleting i char -> can get palindrome
                // or try deleting j char -> can get palindrome
                return checkPalindrome(i + 1, j, s) || checkPalindrome(i, j - 1, s);
            } else {
                i++;
                j--;
            }
        }
        return true;
    }
}
