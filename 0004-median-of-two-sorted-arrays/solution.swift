class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {

        // nums1 is smaller array
        let A = nums1.count <= nums2.count ? nums1 : nums2
        let B = nums1.count <= nums2.count ? nums2 : nums1

        var n = A.count
        var m = B.count

        // Binary search is on nums1.
        var low = 0
        var high = n

        while low <= high {
            var partition1 = (low+high)/2
            var partition2 = (m+n+1)/2 - partition1

            var leftA = partition1 == 0 ? Int.min : A[partition1 - 1]
            var rightA = partition1 == n ? Int.max : A[partition1]
            var leftB = partition2 == 0 ? Int.min : B[partition2 - 1]
            var rightB = partition2 == m ? Int.max : B[partition2]
            // correct partition - direct find median for odd or even length
            if leftA <= rightB && leftB <= rightA {
                
                // odd length
                if (m+n)%2 == 1 {
                    //because left side contributes maximum.
                    return Double(max(leftA, leftB))
                } else {
                    // even length
                    return Double((max(leftA, leftB) + min(rightA, rightB)))/2.0
                }
            } else if leftA > rightB { // wrong partition
                // move left need more from nums1, move relative to partition
                high = partition1 - 1
            } else {
                // move right need more from nums2
                low = partition1 + 1
            }
        }
        return 0.0
    }
}
