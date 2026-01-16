class Solution {
    public int removeDuplicates(int[] nums) {
        int n = nums.length;
        int j = 2;
        // “I can keep nums[i] if it differs from the element at position j-2 in the result.”
        for(int i=2; i<n; i++) {
            if(nums[j-2] != nums[i]) {
                nums[j++] = nums[i];//7
            } 
        }
        //[0,0,1,1,2,3,3]
        return j;
    }
}

/*If you already have at least 2 elements in the result, then:
Adding nums[i] is allowed only if it is different from the element 2 positions before.
Why?
If nums[i] == nums[j-2]
→ you already kept two of this number
→ adding one more would make 3 copies ❌
If nums[i] != nums[j-2]
→ you are either:
starting a new number, or
keeping the second occurrence
→ allowed ✅*/
