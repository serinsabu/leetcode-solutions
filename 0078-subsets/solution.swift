class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var n = nums.count
        var ans = [[Int]]()
        var subset = [Int]()

        func recurse(_ ind: Int) {
            if ind == n {
                ans.append(subset)
                return 
            }

            // PICK
            subset.append(nums[ind])
            recurse(ind+1)

            // BACKTRACK
            subset.removeLast()

            // DON'T PICK
            recurse(ind+1)
        }
        recurse(0)
        return ans
    }
}
