class Solution {
    func findClosestNumber(_ nums: [Int]) -> Int {
    // Linear Scan — Track Minimum |value|
    // Scan left to right. For each element, compare |nums[i]| with the current best.
    // If strictly smaller → update. If equal and nums[i] > 0 → update (positive wins tie). 
    // Return the answer.

    // 1. Smaller absolute value → better  
    // 2. Tie condition in problem (2nd case) => Same absolute value → pick larger number

        var curr = nums[0]

        for num in nums {
            if(abs(num) < abs(curr)) {
                // update
                curr = num
            } else if(abs(curr) == abs(num)) {
                curr = max(curr, num)
            }
        }
        return curr
    }
}
