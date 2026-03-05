class Solution {
    public List<List<Integer>> permute(int[] nums) {
        List<List<Integer>> res = new ArrayList<>();
        List<Integer> ans = new ArrayList<>();
        return recurse(nums, nums.length, ans, res);
    }

    public List<List<Integer>> recurse(
        int[] nums, int n, List<Integer> ans, List<List<Integer>> res
        ) {
        if(ans.size() == n) {
            res.add(new ArrayList<>(ans));
            return res;
        }
        // try every numbers possible
        for(int i=0; i<n; i++) {
            if(ans.contains(nums[i])) {
                continue;
            }
            ans.add(nums[i]);
            // arrange the rest recursiveky
            recurse(nums, n, ans, res);
            ans.remove(ans.size()-1);
        }
        return res;
    }
}
