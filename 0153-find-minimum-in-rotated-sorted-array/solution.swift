class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var n = nums.count
        var low = 0
        var high = n-1

        while low < high {
            var mid = (low+high)/2
            if nums[mid] > nums[high] {
                // if sorted, min is on the right side
                low = mid+1
            } else {
                high = mid
            }
        }
        return nums[low]
    }
}
