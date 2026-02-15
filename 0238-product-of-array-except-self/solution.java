class Solution {
    public int[] productExceptSelf(int[] nums) {
        int n = nums.length;
        int[] ans = new int[n];
        
        int prefix = 1;//store elements before i, dont include i, as we are calculating prod
        //ans[0] must be = 1
        for(int i=0; i<n; i++) {
            // prefix = (product before i)
            ans[i] = prefix;
            prefix *= nums[i]; //[1,1,2,6]
            // System.out.println(ans[i] + " " + prefix);
        }

        int suffix = 1;
        for(int i=n-1; i>=0; i--) { 
            // suffix = (product before i) × (product after i)
            ans[i] *= suffix; //[1*24=24,1*12=12,2*4=8,6*1=6]
            suffix *= nums[i];//1, 1*4=4, 4*3=12, 12*2=24
            // System.out.println(ans[i] + " " + suffix);
        }
        return ans;
    }
}
