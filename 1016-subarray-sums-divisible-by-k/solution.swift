class Solution {
    func subarraysDivByK(_ nums: [Int], _ k: Int) -> Int {
        var n = nums.count
        var presum = 0
        var dict = [Int: Int]()
        dict[0] = 1
        var count = 0

        // Remainder -> freq

        for i in 0..<n {
            presum += nums[i]
            // also , handle negative numbers
            let rem = ((presum % k) + k) % k
            if let freq = dict[rem] {
                count += freq
            }
            dict[rem, default: 0] += 1
        }
        return count
    }
}
