class Solution {
    public int removeDuplicates(int[] nums) {
        int n = nums.length;
        int j = 1;
       /* 
        Approach to optimise 
        Instead of asking:
        “Is this element different from the next one?”
        Ask:
        “Is this element different from the last element I already kept?”
        */
        for(int i=1; i<n; i++) {
            if(nums[j-1] != nums[i]) {
                nums[j++] = nums[i];
            }
        }
        return j;
    }
}
