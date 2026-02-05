class Solution {
    public int[] constructTransformedArray(int[] nums) {
        int n = nums.length;
        int[] result = new int[n];
        int i=0;
        
        while(i < n) {
            if(nums[i] == 0) {
                result[i] = 0;
            } else {
                // move right
                //int newIndex = i + nums[i];//fails 4 out of 4 out of bounds index
                int newIndex = (i + nums[i])%n;
                // move left
                //int newIndex1 = i - Math.abs(nums[i]);//this failed read below
                if(newIndex < 0) {
                    newIndex += n;
                }
                result[i] = nums[newIndex];
            }
            i++;
        }
        return result;
    }
}

/*

Think like a clock 🕒 (5-year-old explanation)
Imagine numbers are on a circle:
For n = 5, valid indexes are:
0 → 1 → 2 → 3 → 4 → (back to 0)
If you go left from index 0 by 1 step:
	•	You don’t go to -1
	•	You go to the last index → 4

n = 5
newIndex = -1

How do we convert -1 to 4?
👉 Add n

newIndex += n
newIndex = -1 + 5 = 4 ✅

Why modulo alone is NOT enough in Java

-1 % 5 = -1   ❌

newIndex = (i + nums[i]) % n;
if (newIndex < 0) newIndex += n;

0 ≤ newIndex < n

*/
