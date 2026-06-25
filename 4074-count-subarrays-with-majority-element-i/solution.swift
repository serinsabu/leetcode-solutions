class Solution {
    func countMajoritySubarrays(_ nums: [Int], _ target: Int) -> Int {
        var n = nums.count
        var ans = 0

        for i in 0..<n {
            var targetCount = 0
            var otherCount = 0
            for j in i..<n {
                if nums[j] == target {
                    targetCount += 1//2
                } else {
                    otherCount += 1//2
                }

                if targetCount > (j-i+1)/2 {
                    ans += 1//1
                }
            }
        }
        return ans
    }
}
