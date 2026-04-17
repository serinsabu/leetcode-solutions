class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        // idea is to take max of 2 largest numbers to get max product
       var first = 0
       var second = 0

        for i in 0..<nums.count {
            if nums[i] > first {
                second = first
                first = nums[i]
            } else if nums[i] > second {
                second = nums[i]
            }
        }
        return (second-1) * (first - 1)
    }
}
