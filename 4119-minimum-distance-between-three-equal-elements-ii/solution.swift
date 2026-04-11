class Solution {
    func minimumDistance(_ nums: [Int]) -> Int {
        var map:[Int: [Int]] = [:]

        for i in 0..<nums.count {
            map[nums[i], default: []].append(i)
        }

        var ans = Int.max
        for freq in map.values where freq.count >= 3 {
            for i in 1..<freq.count-1 {
                ans = min(ans, (freq[i+1] - freq[i-1]) * 2)
            }
        }
        return ans == Int.max ? -1 : ans
    }
}
