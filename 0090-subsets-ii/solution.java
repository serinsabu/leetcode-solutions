class Solution {
    public List<List<Integer>> subsetsWithDup(int[] nums) {
        List<List<Integer>> res = new ArrayList<>();
        List<Integer> ans = new ArrayList<>();
        
        // to avoid duplicates, sort and the add only if previous is not equal with current
        Arrays.sort(nums);
        generateSubsets(0, nums, res, ans);
        return res;
    }

    public void generateSubsets(int start, int[] nums, List<List<Integer>> res, List<Integer> ans) {

        res.add(new ArrayList<>(ans));

        int n = nums.length;
        for(int i=start; i<n; i++) {
            // Because duplicates appear next to each other after sorting.
            if(i > start && nums[i] == nums[i-1]) {
                continue;
            }
            ans.add(nums[i]);
            generateSubsets(i+1, nums, res, ans);
            ans.remove(ans.size()-1);
        }

    }
}
