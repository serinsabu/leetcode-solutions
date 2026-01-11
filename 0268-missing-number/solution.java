class Solution {
    public int missingNumber(int[] nums) {
        int n = nums.length;
        //BIT MANIPULATION -
        // xor of all indexes till n
        // xor of all numbers at that index till n
        int num = 0;

        for(int i=1; i<=n; i++) {
            num ^= i;
            num ^= nums[i-1];
        }
        return num;
    }
}
