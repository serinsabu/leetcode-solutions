class Solution {
    func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        //zeroes <= k -> valid window
        var n = nums.count
        var zeros = 0
        var i=0
        var j=0
        var maxOnes = 0

        while j < n {
            if nums[j] == 0 {
                zeros += 1//3
            }

            // invalid
            while zeros > k { // invalid -> shrink
                if nums[i] == 0 {
                    zeros -= 1
                }
                i += 1//1
            }
            maxOnes = max(maxOnes, j-i+1)//5
            j += 1//6
        }
        return maxOnes 
    }
}
