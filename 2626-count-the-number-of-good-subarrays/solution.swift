class Solution {
    func countGood(_ nums: [Int], _ k: Int) -> Int {
        var dict = [Int: Int]()
        var count = 0
        var n = nums.count
        var i = 0
        var j = 0
        var pairs = 0

        while j < n {
            pairs += dict[nums[j], default: 0]
            dict[nums[j], default: 0] += 1

            while pairs >= k {
                count += n - j
                dict[nums[i], default: 0] -= 1
                pairs -= dict[nums[i], default: 0]
                i += 1
            }
            j += 1
        }
        return count
    }
}
