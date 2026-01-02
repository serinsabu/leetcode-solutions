class Solution {
    public int[] plusOne(int[] digits) {
        int n = digits.length;
        int[] ans = new int[n+1];

        for(int i=n-1; i>=0; i--) {
            if(digits[i] == 9) {
                digits[i] = 0;// just put current element as 0 and move to left
            } else {
                // anything not equal or less than 9 , simply add 1 and return 
                digits[i] += 1;
                return digits;
            }
        }

        // if we have came out of the array and carry is still left
        // that means all were 9's , so simply create new array and add 1 in the front
        
        ans[0] = 1;
        return ans;
    }
}
