class Solution {
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        var n = nums.count
        var presum = 0
        var dict = [Int: Int]()
        dict[0] = -1

        for i in 0..<n {
            presum += nums[i]

            if let val = dict[presum%k], i - dict[presum%k]! >= 2 {
                return true
            }
            if dict[presum%k] == nil {
                dict[presum%k] = i
            }
        }
        return false
    }
}
