class Solution {
    func countGood(_ nums: [Int], _ k: Int) -> Int {
        var n = nums.count
        var i=0
        var j=0
        var map: [Int: Int] = [:]
        var count = 0
        var pairs = 0

        while j < n {
            // Then update the frequency.
            // This avoids recomputing combinations every time.
            pairs += map[nums[j], default: 0]
            //count pairs
            map[nums[j], default:0] += 1
            while pairs >= k {
                count += n-j
                map[nums[i], default:0] -= 1
                pairs -= map[nums[i], default: 0]
                i += 1
            }
            j += 1
        }
        return count
    }
}
