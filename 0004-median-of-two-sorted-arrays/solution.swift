class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        // take the smaller array and do binary search on them
        let A = nums1.count <= nums2.count ? nums1 : nums2
        let B = nums1.count <= nums2.count ? nums2 : nums1

        var m = A.count
        var n = B.count

        var low = 0
        var high = m

        while low <= high {
            var partitionA = (low+high)/2
            //total left size fixed
            var partitionB = (m+n+1)/2 - partitionA

            var leftA = partitionA == 0 ? Int.min : A[partitionA-1]
            var rightA = partitionA == m ? Int.max : A[partitionA]

            var leftB = partitionB == 0 ? Int.min : B[partitionB-1]
            var rightB = partitionB == n ? Int.max : B[partitionB]

            // find median
            if leftA <= rightB && leftB <= rightA {
                // total == odd length
                if (m+n)%2 == 1 {
                    return Double(max(leftA, leftB))
                } else { // even length
                    return Double(max(leftA, leftB) + min(rightA, rightB))/2.0
                }   
            } 
            //leftA too small → move right
            //leftA too big → move left
            else if leftA < rightB {
                // move right
                low = partitionA + 1
            } else {
                // move left
                high = partitionA - 1
            }
        }
        return 0.0
    }
}
