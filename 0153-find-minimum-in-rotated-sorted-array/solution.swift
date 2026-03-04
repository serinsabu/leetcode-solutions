class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var low = 0
        var high = nums.count-1

        while low < high {
            var mid = (low+high)/2
            // check in left rotated sorted array 
            if nums[mid] > nums[high] {
                // go right
                low = mid+1
            } else {
                //left
                high = mid
            }
        }
        return nums[high]
    }
}
