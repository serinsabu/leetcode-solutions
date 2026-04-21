class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var n = nums.count
        var nums = nums

        // The answer is in [1, n+1]. We use the array as a hash — value v goes to index v-1. After cyclic placement, if nums[i] = i+1 for all i then [1..n] are all present and the answer is n+1. Otherwise the first mismatch reveals the missing number. Each element is moved at most once across all iterations — total swaps ≤ n.

        // Phase 1  swapping
        for i in 0..<n {
            // check if the current number is between [1..n]
            // keep on doing operation
            while nums[i] > 0 && nums[i] <= n
            && nums[nums[i]-1] != nums[i] {
                // get the position to swap
                let position = nums[i] - 1
                // swap current element with the original position 
                nums.swapAt(position, i)
            }
        }
        print(nums)
        // Phase 2 scan and if mismatched return right away
        for i in 0..<n {
            if nums[i] != i+1 {
                return i+1
            }
        }
        //when all are present in [1..n] return n+1
        return n+1
    }
}
