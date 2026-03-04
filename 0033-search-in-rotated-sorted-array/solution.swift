class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
        var high = nums.count-1

        while low <= high {
            var mid = (low+high)/2
            if target == nums[mid] {
                return mid
            }
            if nums[low] <= nums[mid] {
                if target >= nums[low] && target <= nums[mid] {
                    high = mid-1
                } else {
                    low = mid+1
                }
            } else {
                if target >= nums[mid] && target <= nums[high] {
                    low = mid+1
                } else {
                    high = mid-1
                }
            }
        }
        return -1
    }
}
