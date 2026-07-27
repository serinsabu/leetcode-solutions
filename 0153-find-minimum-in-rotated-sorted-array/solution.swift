class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var n = nums.count
        var low = 0
        var high = n-1
        var ans = 0

        while low < high {
            var mid = low+(high-low)/2
            // right half is sorted
            if nums[mid] < nums[high] {
                high = mid
            } else {
                low = mid+1
            }
        }
        return nums[low]
    }
}
