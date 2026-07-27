class Solution {
    func maximumProduct(_ nums: [Int]) -> Int {
        var nums = nums
        var max1 = Int.min
        var max2 = Int.min
        var max3 = Int.min
        var min1 = Int.max
        var min2 = Int.max

        // max1 = 1,max2=,max3=3
        
        for num in nums {
            // first 3 largest
            if num > max1 {
                max3 = max2
                max2 = max1
                max1 = num
            } else if num > max2 {
                max3 = max2
                max2 = num
            } else if num > max3 {
                max3 = num
            }

            // first 2 smallest and 1 largest
            if num < min1 {
                min2 = min1
                min1 = num
            } else if num < min2 {
                min2 = num
            }
        }
        let cand1 = max1 * max2 * max3
        let cand2 = min1 * min2 * max1
        return max(cand1, cand2)
    }
}
