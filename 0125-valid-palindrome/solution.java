class Solution {
    public boolean isPalindrome(String s) {
        //if we find non alphanumeric character at i, then i++, if at j then j--
        int n = s.length();
        int i=0;
        int j=n-1;

        while(i < j) {
            char ch1 = s.charAt(i);
            char ch2 = s.charAt(j);

            if(!Character.isLetter(ch1) && !Character.isDigit(ch1)) {
                i++;
                continue;
            }
            if(!Character.isLetter(ch2) && !Character.isDigit(ch2)) {
                j--;
                continue;
            } 
                if(Character.toLowerCase(ch1) == Character.toLowerCase(ch2)) {
                    i++;
                    j--;
                } else {
                    return false;
                }
            
        }
        return true;
    }
}
