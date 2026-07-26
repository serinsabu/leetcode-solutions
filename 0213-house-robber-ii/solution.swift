class Solution {
    func rob(_ nums: [Int]) -> Int {
        var n = nums.count
        if n == 0 {
            return 0
        }
        if n == 1 {
            return nums[0]
        }
        if n == 2 {
            return max(nums[0], nums[1])
        }
        
        func circluarRob(_ start: Int, _ limit: Int) -> Int {
            var first = nums[start]
            var second = max(nums[start], nums[start+1])
            var ans = 0
            var i = start + 2
            while i<limit {
                ans = max(nums[i] + first, second)
                first = second
                second = ans
                i += 1
            }
            // because when limit = 2 , it does not go inside the loop and ans is in second
            return second
        }
        // case 1: pick first house 
        //nums[0..<n-1]
        // case 2: pick last house
        // nums[1..<n]
        return max(circluarRob(0, n-1), circluarRob(1, n))
    }
}
