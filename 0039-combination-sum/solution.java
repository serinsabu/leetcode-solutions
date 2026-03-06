class Solution {
    public List<List<Integer>> combinationSum(int[] candidates, int target) {
        List<List<Integer>> res = new ArrayList<>();
        List<Integer> ans = new ArrayList<>();
        
        generate(0, candidates, target, res, ans);
        return res;
    }

    public void generate(int start, int[] nums, int target, List<List<Integer>> res, List<Integer> ans) {
        
        //in the case of [2,2,2,2] = target becomes -1, it is invalid 
        // so [2,2,2] is accepted , then backtrack then remove 2 then [2,2] -> target =3
        //gives [2,2,3]
        if(target < 0) {// this decides if tagret = -1 then it return early
            return;
        }
        if(target == 0) {
            res.add(new ArrayList<>(ans));
            return;
            // return empty, no need to return res, as res is already passed and modified.
        }
        
        for(int i=start; i<nums.length; i++) {
            ans.add(nums[i]);
            // keep i, as number can be reused - NOT i+1
            generate(i, nums, target-nums[i], res, ans);
            ans.remove(ans.size()-1);
        }
    }
}
