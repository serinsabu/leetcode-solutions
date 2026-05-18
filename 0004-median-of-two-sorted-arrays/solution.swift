class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {

        // 1. Binary search smaller array
        // 2. Guess partitionA
        // 3. Compute partitionB
        // 4. Find boundary elements
        // 5. Check partition validity
        // 6. leftA too big → move left
        // 7. leftB too big → move right
        // 8. valid partition → compute median

        // choose left array or right array - smaller array
        var A = nums1.count <= nums2.count ? nums1 : nums2
        var B = nums1.count <= nums2.count ? nums2 : nums1

        let m = A.count
        let n = B.count

        //we binary search ALL possible cut positions
        var low = 0
        var high = m

        while low <= high {
            let partitionA = (low + high)/2
            //totalLeft = (m+n+1)/2
            let partitionB = (m+n+1)/2 - partitionA

            var leftA = partitionA == 0 ? Int.min : A[partitionA-1]
            var rightA = partitionA == m ? Int.max : A[partitionA]

            var leftB = partitionB == 0 ? Int.min : B[partitionB-1]
            var rightB = partitionB == n ? Int.max : B[partitionB]

            //ALL left elements <= ALL right elements
            if leftA <= rightB && leftB <= rightA {
                // compute
                // odd elements
                if (m+n)%2 == 1 {
                    return Double(max(leftA, leftB))
                } else {
                    // even elements
                    return Double(max(leftA, leftB) + min(rightA, rightB))/2.0
                }
            } else if leftA < rightB {
                // left too big-> A contributed TOO MANY elements
                low = partitionA + 1
            } else {
                high = partitionA - 1
            }
        }
        return 0.0
    }
}
