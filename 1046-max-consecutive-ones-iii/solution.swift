class Solution {
    func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        var n=nums.count
        var i=0
        var j=0
        var numOfZeros = 0
        var maxLength = 0

        while j < n {
            if nums[j] == 0 {
                numOfZeros += 1//
            }
            // invalid
            while numOfZeros > k {
                if nums[i] == 0 {
                    numOfZeros -= 1//2
                }
                // shrink
                i += 1//5
            }
            maxLength = max(maxLength, j-i+1)//6
            j += 1
        }
    return maxLength
    }
}
