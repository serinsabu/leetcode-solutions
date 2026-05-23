class Solution {
    func check(_ nums: [Int]) -> Bool {
        var count = 0
        var n = nums.count

        for i in 0..<n {
            if nums[i] > nums[(i+1)%n] {
                count += 1
            }
        }

        if count <= 1 {
            // valid
            return true
        } else if count == 2 {
            return false
        } else {
            return false
        }
    }
}
