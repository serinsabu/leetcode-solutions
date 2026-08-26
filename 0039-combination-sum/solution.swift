class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var ans = [[Int]]()
        var res = [Int]()
        var n = candidates.count
        var nums = candidates

        solve(0, target, res)

        func solve(_ index: Int, _ target: Int, _ res: [Int]) {
            var res = res
            if target < 0 || index == n {
                return
            }
            if target == 0 {
                ans.append(res)
                return
            }

            // keep using the same index 
            res.append(nums[index])
            solve(index, target - nums[index], res)
            // backtrack
            res.removeLast()
            // move forward
            solve(index + 1, target, res)
        }
        return ans
    }
}
