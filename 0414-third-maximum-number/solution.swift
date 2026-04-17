class Solution {
    func thirdMax(_ nums: [Int]) -> Int {
        var first: Int? = nil
        var second: Int? = nil
        var third: Int? = nil

        for i in 0..<nums.count {
            if nums[i] == first || nums[i] == second || nums[i] == third {
                continue
            }
            if first == nil || nums[i] > first! {
                third = second
                second = first
                first = nums[i]
            } else if second == nil || nums[i] > second! {
                third = second
                second = nums[i]
            } else if third == nil || nums[i] > third! {
                third = nums[i]
            }
        }
        return third ?? first!
    }
}
