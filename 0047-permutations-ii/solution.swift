class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var n = nums.count
        var path = [Int]()
        var result = [[Int]]()
        // var nums = nums
        // nums.sort()
        var used = Array(repeating: false, count: n)
        solve()

        func solve() {
            if path.count == n {
                if !result.contains(path) {
                    result.append(path)
                }
                return
            }

            for i in 0..<n {
                if used[i] {
                    continue
                }
                path.append(nums[i])
                used[i] = true

                solve()

                path.removeLast()
                used[i] = false
            }
        }
        return result
    }
}
