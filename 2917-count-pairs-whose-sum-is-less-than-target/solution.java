class Solution {
    public int countPairs(List<Integer> nums, int target) {
        int i=0;
        int j=nums.size()-1;
        int count = 0;

        Collections.sort(nums);
        while(i < j) {
            if(nums.get(i) + nums.get(j) < target) {
                count += j-i; // include whole window
                i++;
            } else {
                j--;
            }
        }
        return count;
    }
}
