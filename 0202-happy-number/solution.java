class Solution {
    public int sumOfSq(int num) {
        int sum = 0;
        while(num > 0) {//1>0
            int rem = num%10;//1
            sum += rem * rem;//81+1
            num = num/10;//0
        }
        return sum;
    }

    public boolean isHappy(int n) {
        // slow = fast = n
        // sum of squares of digit
        int slow = n;
        int fast = n;
        while(fast != 1) {
            slow = sumOfSq(slow);
            fast = sumOfSq(sumOfSq(fast));// as fast move 2 pointers ahead

            if(fast == 1) {
                return true; // happy
            }
            if(slow == fast) { // if both pointers meet, its a cycle, returns false
                return false;
            }
        }
        return true;//comes here only if while loop fails fast == 1
    }
}
