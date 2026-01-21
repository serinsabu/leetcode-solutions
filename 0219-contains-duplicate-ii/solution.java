class Solution {
    public boolean containsNearbyDuplicate(int[] nums, int k) {
        int n = nums.length;
        Map<Integer, Integer> map = new HashMap<>();

        for(int i=0; i<n; i++) {
            if(map.containsKey(nums[i])) {
                // calculate and check abs(i-j) <= k
                if(Math.abs(map.get(nums[i]) - i) <= k) {
                    return true;
                }
            }
            map.put(nums[i], i);//{1-3,2-4,3-5}
        } 
    return false;
    }
}
