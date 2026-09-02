class Solution {
    func uniformArray(_ nums1: [Int]) -> Bool {
        var n = nums1.count
        var nums2 = Array(repeating: 0, count: n)
        // condition 1 does same parity = same parity odd => odd, even => even
        // condition 2 does opposite 
        /*
        odd odd    even
        odd even   odd
        even odd   odd
        even even  even
        */
        return true
        
    }
}
