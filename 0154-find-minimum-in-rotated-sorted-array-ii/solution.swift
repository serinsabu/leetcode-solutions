class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var n = nums.count
        var low = 0
        var high = n-1

        /* 
            when there are duplicates
            mid = 1
            high = 1
            Can you say:
                * minimum left?
                * minimum right?
                No.

            when, nums[mid] == nums[high]
            we cannot eliminate half safely.
            But we CAN safely eliminate ONE duplicate.
            Why?
            Removing one copy doesn’t lose minimum.
            therefore, when equal DO high -= 1, Why not low += 1?, Could also work sometimes.
            But removing high is safer because: we already compared against high
        */

        while low < high {
            var mid = (low+high)/2
            if nums[mid] == nums[high] {
                high -= 1
            } else if nums[mid] < nums[high] {
                high = mid
            } else {
                low = mid+1
            }
        }
        return nums[low]
    }
}
