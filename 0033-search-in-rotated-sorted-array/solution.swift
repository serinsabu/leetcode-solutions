class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var n = nums.count
        var low = 0
        var high = n-1

        while low <= high {
            var mid = (low+high)/2
            if target == nums[mid] {
                return mid
            }
            
            if nums[low] <= nums[mid] {
                // left half sorted
                if target >= nums[low] && target < nums[mid] {
                    high = mid-1
                } else {
                    low = mid+1
                }
            } else {
                // right half sorted
                if target > nums[mid] && target <= nums[high] {
                    low = mid+1
                } else {
                    high = mid-1
                }
            } 
        }
        return -1
    }
}
