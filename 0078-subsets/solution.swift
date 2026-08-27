class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var n = nums.count
        var res = [Int]()
        var ans = [[Int]]()

        solve(0)

        func solve(_ index: Int) {
            // You’re only adding res to ans when index == n
            // But with the for-loop subset approach, every current res is a valid subset.
            // so commenting index == n
            // if index == n {
                ans.append(res)
                // return
            // }
            // at every number
            // take / skip
            // for loop does going to every number
            // choose 1, choose 2 
            for i in index..<nums.count {
                // choose
                res.append(nums[i])

                // explore choices after i
                solve(i+1)

                // unchoose
                res.removeLast()
            }
            // skip
            // solve(index+1)
        }
        return ans
    }
}
