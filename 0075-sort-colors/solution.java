class Solution {
    public void sortColors(int[] nums) {
        int n = nums.length;
        int i=0;
        int j=n-1;
        int k=0;

        while(k <= j) {
            if(nums[k] == 1) {
                // do nthng and just move k, as k must have all 1's
                k++;
            } else if(nums[k] == 2) {
                // j pos must have 2, so swap with nums[k]
                int temp = nums[j];
                nums[j] = nums[k];
                nums[k] = temp;
                j--; // dec j as we know that j got its value 2 at the end
                // do not move k as k pos can have any value 0,1,2 
                // it is not necessary that it can have 1 only
            } else {
                // when nums[k] == 0
                // when i < k or i == k  and nums[k] == 0 , move i and k (reason in notes)
                // swap nums[i] with nums[k]
                int temp = nums[i];
                nums[i] = nums[k];
                nums[k] = temp;
                i++;
                k++;
            }
        }
    }
}
