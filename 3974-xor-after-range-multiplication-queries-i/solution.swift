class Solution {
    func xorAfterQueries(_ nums: [Int], _ queries: [[Int]]) -> Int {
        var nums = nums
        for query in queries {
            var idx = query[0]

            while idx <= query[1] {
                nums[idx] = (nums[idx] * query[3]) % (1_000_000_000 + 7)
                idx += query[2]
            }
        }
        //start with 0  
        //then apply XOR with each element
        return nums.reduce(0,^)
    }
}
