class Solution {
    func countSpecialIntegers(_ nums: [Int]) -> Int {
        var seen = Set<Int>()
        var special = Set<Int>()
    
        for i in 0..<nums.count {
            let current = nums[i]
            // A new block starts
    
            if i == 0 || nums[i] != nums[i - 1] {
                if seen.contains(current) {
                    // This number has appeared in an earlier block
                    special.remove(current)
                } else {
                    // First block of this number
                    seen.insert(current)
                    special.insert(current)
                }
            }
        }
        return special.count
    }
}
