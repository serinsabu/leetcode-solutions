class Solution {
    func maxSubarrayLength(_ nums: [Int], _ k: Int) -> Int {
        var n = nums.count
        var map = [Int:Int]()
        
        var i = 0
        var j = 0
        var maxLen = 0

        while j < n {
            map[nums[j], default: 0] += 1//1-1,2-1

            while map[nums[j]]! > k {
                map[nums[i]]! -= 1
                i += 1
            }
            maxLen = max(maxLen, j-i+1)//1
            j += 1//1
        }
        return maxLen
    }
}
