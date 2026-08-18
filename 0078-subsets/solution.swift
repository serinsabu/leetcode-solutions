class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var n = nums.count
        var path = [Int]()
        var result = [[Int]]()

        /*        current element
                      |
              ┌───────┴───────┐
              ↓               ↓
            TAKE          DON'T TAKE
              |               |
           append             |
              |               |
           recurse          recurse
              |
          removeLast
        */

        // Start at index 0 with an empty path.
        solve(0)

        func solve(_ index: Int) {
            // base case
            // We have processed every element.
            // Whatever is currently in path is one complete subset.
            if index == nums.count {
                result.append(path)
                return
            }

            // ─────────────────────────────
            // CHOICE 1: TAKE nums[index]
            // ─────────────────────────────
            // Choose the current number.
            path.append(nums[index])
            // Move to the next index and explore
            // every possible subset after taking this number.
            solve(index+1)
            // ─────────────────────────────
            // BACKTRACK
            // ─────────────────────────────
            // Undo our previous choice.
            // This brings path back to the state it was in
            // before we chose nums[index].
            path.removeLast()
            // ─────────────────────────────
            // CHOICE 2: DON'T TAKE nums[index]
            // ─────────────────────────────
            // Don't include the current number.
            // Move to the next index and explore all possibilities
            // without this number.
            solve(index+1)
        }
        return result
    }
}
