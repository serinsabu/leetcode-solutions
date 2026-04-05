class Solution {
    func countSubarrays(_ nums: [Int], _ k: Int) -> Int {
        var i=0
        var j=0
        var n = nums.count
        var maxElt = nums.max()!
        // DICT is NOT required
        var dict = [Int:Int]()
        var count = 0
        while j < n {
            dict[nums[j], default:0] += 1
            
            while dict[maxElt, default:0] >= k {
                // atleast >= k, always 0 to i subarrays are valid
                count += n-j
                dict[nums[i]]! -= 1
                if dict[nums[i]] == 0 {
                    dict.removeValue(forKey: nums[i])
                } 
                i += 1
            }
            j += 1
        }
        return count
    }
}
