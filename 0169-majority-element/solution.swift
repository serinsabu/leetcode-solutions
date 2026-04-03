class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        // 3 cases
        //if count == 0,no vote, so set count=1, start with a new candidate
        //else if candidate == nums[i], inc count
        // else dec count
        var candidate = nums[0];
        var count = 1;
        var n = nums.count

        for i in 1..<n {
            if candidate == nums[i] {
                count += 1
            } else {
                count -= 1
            }

            if count == 0 {
                candidate = nums[i]
                count = 1
            }
        }
        return candidate
    }
}
