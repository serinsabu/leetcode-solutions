class Solution {
    public List<List<Integer>> combine(int n, int k) {
        List<List<Integer>> res = new ArrayList<>();
        List<Integer> ans = new ArrayList<>();
        return combinations(1, n, k, res, ans);
    }

    public List<List<Integer>> combinations(int start, int n, int k, List<List<Integer>> res, List<Integer> ans) {
        if(ans.size() == k) {
            res.add(new ArrayList<>(ans));
            return res;
        }
        // DO NOT start from i=1, as there can be duplicates [1,2], [2,1]
        // avoid it, you must always only move forward, so start from one point
        for(int i=start; i<=n; i++) {
            ans.add(i);
            // backtrack-keep moving forward => i+1
            combinations(i+1, n, k, res, ans);
            ans.remove(ans.size()-1);
        }
        return res;
    }
}
