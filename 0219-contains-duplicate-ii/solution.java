class Solution {
    public boolean containsNearbyDuplicate(int[] nums, int k) {
        Set<Integer> set = new HashSet<>();
        int n = nums.length;
        int i=0;
        int j=0;

        while(j < n) {
            if(set.contains(nums[j])) {
                return true;
            }
            set.add(nums[j]);
            if(j - i + 1 > k) {
                set.remove(nums[i]);
                i++;
            }
            j++;
        }
        return false;
    }
}
