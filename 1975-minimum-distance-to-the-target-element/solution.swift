class Solution {
    func getMinDistance(_ nums: [Int], _ target: Int, _ start: Int) -> Int {
        var n = nums.count
        var minDist = Int.max

        for i in 0..<n {
            if nums[i] == target {
                minDist = min(minDist, abs(i-start))
            }
        }
        return minDist
    }
}
