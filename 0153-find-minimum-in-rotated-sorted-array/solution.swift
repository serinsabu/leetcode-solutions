class Solution {
    func findMin(_ nums: [Int]) -> Int {
        // idea is sorted array is always found in one half
        // the rotation point will have the sorted part
        var n = nums.count
        var low = 0
        var high = n-1

        while low < high {
            var mid = (low+high)/2
            if nums[mid] > nums[high] {
                low = mid + 1 
            } else {
                high = mid
            }
        }
        return nums[low]
    }
}
