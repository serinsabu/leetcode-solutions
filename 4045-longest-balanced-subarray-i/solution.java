class Solution {
    public int longestBalanced(int[] nums) {
        int n = nums.length;
        int maxLength = 0;

        for(int i=0; i < n; i++) {
            // fix the left boundary
            Set<Integer> evenSet = new HashSet<>();
            Set<Integer> oddSet = new HashSet<>();

            int j=i;
            while(j < n) {
                // maintain distinct even / odd
                if(nums[j]%2 == 0) {
                    evenSet.add(nums[j]);//{1}
                } else {
                    oddSet.add(nums[j]);//{}
                }

                // check balance at each step
                if(evenSet.size() == oddSet.size()) {
                    maxLength = Math.max(maxLength, j-i+1);//
                } 
                // expand right boundary
                j++;
            }
        }
        return maxLength;
    }
}
