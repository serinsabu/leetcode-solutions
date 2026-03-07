class Solution {
    public List<List<Integer>> subsets(int[] nums) {
        List<List<Integer>> res = new ArrayList<>();
        List<Integer> ans = new ArrayList<>();

        generateSubsets(0, nums, res, ans);
        return res;
    }

    public void generateSubsets(int start, int[] nums, List<List<Integer>> res, List<Integer> ans) {
        int n = nums.length;
        // removed ans.size() == n, as subsets can be of any size, not only of n size
        // it can be [], [1,2] etc
        res.add(new ArrayList<>(ans));

        for(int i=start; i<n; i++) {
            ans.add(nums[i]);
            // i+1 , controls next recursion pointer
            generateSubsets(i+1, nums, res, ans);
            ans.remove(ans.size()-1);
        }
    }
    
}
