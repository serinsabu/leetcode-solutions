class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var low = 0
        var high = nums.count-1

        while low < high {
            var mid = low+(high-low)/2
            if nums[mid] > nums[high] {
                // go right
                low = mid+1
            } else if nums[mid] <= nums[high] {
                // go left
                high = mid
            }
        }
        return nums[high]
    }
}
