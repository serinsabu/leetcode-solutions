class Solution {
    public int majorityElement(int[] nums) {
        int n = nums.length;
        int count = 0;
        int candidate = 0;

        for(int i=0; i<n; i++) {
            // 3 cases
            // if count == 0, update current elt as new candidate
            // set count = 1 , becoz no candidate is winning
            if(count == 0) {
                candidate = nums[i];
                count = 1;
            } else if(nums[i] == candidate) {
                // if curr == count , increase count, supporting the candidate
                count++;
            } else {
                // if curr != count, decrease count, cancellation of votes
                count--;
            }    
        }
        return candidate;
    }
}
