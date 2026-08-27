class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var ans = [[Int]]()
        var res = [Int]()
        let n = nums.count

        solve(0)

        func solve(_ index: Int) {
            ans.append(res)

            for i in index..<n {
                // if duplicate , skip
                if i > index && nums[i] == nums[i-1] {
                    continue
                }
                
                res.append(nums[i])
                solve(i+1)
                res.removeLast()
            }
        }
        return ans
    }
}
