class Solution {
    func getCommon(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var m = nums1.count
        var n = nums2.count

        var i=0
        var j=0

        while i < m && j < n {
            if nums1[i] == nums2[j] {
                return nums1[i]
            } else if nums1[i] < nums2[j] {
                i += 1
            } else {
                j += 1
            }
        }
        return -1
    }
}
