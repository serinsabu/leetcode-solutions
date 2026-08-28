class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var ans = [[Int]]()
        var res = [Int]()
        var nums = candidates
        nums.sort()
        var n = nums.count
        var used = Array(repeating: false, count: n)

        solve(0, target)

        func solve(_ index: Int, _ target: Int) {
            if target < 0 || index == n {
                return
            }

            if target == 0 {
                ans.append(res)
                return
            }

            for i in index..<n {
                if used[i] {
                    continue
                }
                if i > index && nums[i] == nums[i-1] && !used[i-1] {
                    continue
                }
                used[i] = true
                res.append(nums[i])
                solve(i, target - nums[i])
                res.removeLast()
                used[i] = false
            }
        }
        return ans
    }
}
