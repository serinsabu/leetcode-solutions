class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var n = nums.count
        var res = [Int]()
        var ans = [[Int]]()
        var used = Array(repeating: false, count: n)

        solve()

        func solve() {
            // only allows n number of elements
            if res.count == n {
                ans.append(res)
                return
            }

            // for loop from 0 because [1,2] , [2,1] is both valid
            // choose 1 -> choose 2 -> [1,2] and also 
            // choose 2 -> choose 1 -> [2,1]
            for i in 0..<n {
                if used[i] {
                    continue
                }
                // skip duplicates
                if i > 0 && nums[i] == nums[i-1] && !used[i-1] {
                    continue
                }
                used[i] = true
                res.append(nums[i])
                solve()
                res.removeLast()
                used[i] = false
            }
        }
        return ans
    }
}
