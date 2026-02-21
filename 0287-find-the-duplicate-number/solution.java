class Solution {
    public int findDuplicate(int[] nums) {
        // Floyd’s Cycle Detection (Tortoise and Hare)

        // find intersection point 
        int slow = nums[0];
        int fast = nums[0];

        do {
            slow = nums[slow];
            fast = nums[nums[fast]];
        } while(slow != fast);

        slow = nums[0];//got the duplicate, reset to start again
        // again move slow and fast by one point, thats the actual cycle
        while(slow != fast) {
            slow = nums[slow];
            fast = nums[fast];
        }
        return slow;//duplicate
    }
}
