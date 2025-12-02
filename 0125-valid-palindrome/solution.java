class Solution {
    public boolean isPalindrome(String s) {
        int i=0;
        int j=s.length()-1;

        while(i < j) {
            // check non alpha numeric
            char chLeft = s.charAt(i);
            char chRight = s.charAt(j);
            if(!Character.isLetterOrDigit(chLeft)) {
                i++;
                continue;
            }
            
            if(!Character.isLetterOrDigit(chRight)) {
                j--;
                continue;
            } 

            if(Character.toLowerCase(chLeft) != Character.toLowerCase(chRight)) {
                return false;
            } 
            
                i++;
                j--;
        }
        return true;
    }
}
