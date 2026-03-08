class Solution {
    public List<List<Integer>> permuteUnique(int[] nums) {
        List<List<Integer>> res = new ArrayList<>();
        List<Integer> ans = new ArrayList<>();
        // USE boolean for tracking duplicate nodes
        boolean[] used = new boolean[nums.length];

        Arrays.sort(nums);
        generateCombs(nums, res, ans, used);
        return res;
    }

    public void generateCombs(int[] nums, List<List<Integer>> res, List<Integer> ans, boolean[] used) {

        int n = nums.length;
        if(ans.size() == n) {
            res.add(new ArrayList<>(ans));
            return;
        }

        for(int i=0; i<n; i++) {
            // Because we must only skip duplicates 
            // if the previous identical number hasn’t been used yet.(!used[i-1] || used[i])
            //ex:- nums = [1,1,2], We want:=> [1,1,2], [1,2,1], [2,1,1] but we might miss this
            // If we skip duplicates incorrectly, some valid permutations disappear.
            //If this element is already used in the current permutation, skip it.
            if(used[i]) continue;
            // previous duplicate was not used
            if(i > 0 && nums[i] == nums[i-1] && !used[i-1]) {
                continue;
            }
            ans.add(nums[i]);
            used[i] = true;
            generateCombs(nums, res, ans, used);
            ans.remove(ans.size()-1);
            used[i] = false;
        }
    }
}

/*
    Subsets ignore order:
    [1,2]  ==  [2,1]
    So we only generate combinations, not permutations.
    The recursion always moves forward.
    If two identical numbers appear at the same recursion level, skip the second.
    []
    ├──1
    │  ├──1,2
    │  │   └──1,2,2
    │  └──1,2
    ├──2
    │  └──2,2
    └──2

    Permutations care about order:
    [1,2,1] ≠ [2,1,1]
    So recursion does NOT move forward.
    Each level can choose any unused element.

    Two identical 1s create duplicate branches.
    []
    ├──1
    │  ├──1
    │  │  └──2
    │  └──2
    │     └──1
    ├──1
    │  ├──1
    │  │  └──2
    │  └──2
    │     └──1
    └──2
    ├──1
    │  └──1
    └──1
        └──1
*/
