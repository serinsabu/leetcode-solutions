class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var n = nums.count
        var path = [Int]()
        var result = [[Int]]()

        var used = Array(repeating: false, count: n)
        solve()
        
        func solve() {
            // BASE CASE:
            // We have chosen all elements
            if path.count == n {
                result.append(path)
                return
            }

            // Try every element for the current position
            for i in 0..<n {
                // If nums[i] is already used in this path,
                // we cannot use it again
                if used[i] {
                    continue
                }
                // CHOOSE
                path.append(nums[i])
                used[i] = true

                // EXPLORE
                solve()

                // BACKTRACK / UNDO
                path.removeLast()
                used[i] = false
            }
        }
        return result
    }
}
