class Solution {
    public long countSubarrays(int[] nums, int k) {
        int n = nums.length;
        int i=0;
        int j=0;
        int maxElt = 0;
        for(int elt=0; elt<n; elt++) {
            maxElt = Math.max(maxElt, nums[elt]);//3
        }
        int maxCount = 0;
        long count = 0;
        
        while(j < n) {
            if(nums[j] == maxElt) {
                maxCount++;
            }

            while(maxCount >= k) {
                if(nums[i] == maxElt) {
                    maxCount--;
                }
                i++;
            }
            count += i;
            j++;
        }
        return count;
    }
}

/*

💡 What does “ending at j” mean?

It means:

We fix the right boundary j,
and count how many left boundaries are valid.

⸻

🧠 Why do we shrink?

We shrink to find:

The smallest left index where condition still holds.

Once we go one step further, condition breaks.

That boundary tells us:

All starts before this point are valid.

*/
