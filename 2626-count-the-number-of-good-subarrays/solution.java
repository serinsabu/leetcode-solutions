class Solution {
    public long countGood(int[] nums, int k) {
        int n = nums.length;
        int i=0;
        int j=0;
        int pairsCount = 0;
        long count = 0;
        Map<Integer, Integer> map = new HashMap<>();

        while(j < n) {
            pairsCount += map.getOrDefault(nums[j], 0);
            map.put(nums[j], map.getOrDefault(nums[j],0)+1);

            while(pairsCount >= k) {
                // Count valid rights
                // count all the elements after first i, at the ending j
                count += n-j;
                map.put(nums[i], map.getOrDefault(nums[i],0)-1);
                pairsCount -= map.getOrDefault(nums[i], 0);
                i++;
            }
            j++;
        }
        return count;
    }
}
