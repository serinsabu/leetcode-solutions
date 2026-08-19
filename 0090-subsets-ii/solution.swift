class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var n = nums.count
        var path = [Int]()
        var result = [[Int]]()
        var nums = nums
        nums.sort()
        solve(0)

        func solve(_ index: Int) {
            result.append(path)
            for i in index..<n {
                if i > index && nums[i] == nums[i-1] {
                    continue
                }
                path.append(nums[i])
                solve(i+1)
                path.removeLast()
            }
        }
        return result
    }
}
