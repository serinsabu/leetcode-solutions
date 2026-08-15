class Solution {
    func longestSubsequence(_ nums: [Int]) -> Int {
        /*
            * If total XOR ≠ 0 → answer n
            * If total XOR = 0 and there is at least one non-zero element → answer n - 1
            * If all elements are zero → every subsequence has XOR 0, so answer 0

            x ^ x = 0
            x ^ 0 = x

            a ^ b ^ c ^ d = 0
            b ^ c ^ d = ?
            (a ^ b ^ c ^ d) ^ a = 0 ^ a
            Now rearrange: a ^ a ^ b ^ c ^ d = a
            Because: a ^ a = 0 => we get: b ^ c ^ d = a
            So if: a ^ b ^ c ^ d = 0, then automatically: b ^ c ^ d = a

            So if: a = 5, then: b ^ c ^ d = 5 which is definitely non-zero.
            Therefore, if the total XOR is zero and you remove a non-zero element, the XOR of everything remaining becomes that removed element.

            What if the removed element is zero?
            Suppose: a = 0, b ^ c ^ d = a, means: b ^ c ^ d = 0

            So removing a zero doesn’t help.
            That’s why we specifically need at least one non-zero element.

            Therefore, when the entire array has XOR 0, you can always get a valid subsequence of length n - 1 as long as at least one element is non-zero.
        */
        var n = nums.count
        var ans = 0
        var hasNonZero = false // check if you have non zero when all are zeros
        for num in nums {
            ans ^= num

            // // check if you have non zero number in whole array when all are zeros
            if num != 0 {
                hasNonZero = true
            }
        }
        // Case 1: Entire array XOR is non-zero
        if ans != 0 {
            return n
        } else if hasNonZero {
        // Case 2: Entire array XOR is zero
            // If the total XOR is 0 and you remove one non-zero element x, the remaining elements form a subsequence of length n - 1, and their XOR becomes x, which is non-zero.
            // YES → n - 1 , remainingXOR = x where x is the non zero element
            // NO  → 0
            return n-1
        }
        return 0 // NO  → 0, when  Entire array XOR is zero
    }
}
