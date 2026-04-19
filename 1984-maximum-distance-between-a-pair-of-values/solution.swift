class Solution {
    func maxDistance(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var maxVal = 0
        var i = 0
        var j = 0

        while i < nums1.count && j < nums2.count {
            if nums1[i] <= nums2[j] {
                maxVal = max(maxVal, j-i)
                j += 1 // try to increase distance
            } else {
                i += 1 // need smaller nums1[i]
            }
        }
        
        return maxVal == Int.min ? 0 : maxVal
    }
}
