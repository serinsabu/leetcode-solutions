class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        //keep first fixed and inside two pointer
        var n = nums.count
        var ans = [[Int]]()
        var nums = nums
        nums.sort()

        for i in 0..<n {
            if i > 0 && nums[i] == nums[i-1] {
                continue
            }
            var j = i+1
            var k = n-1

            while j < k  {
                let sum = nums[i] + nums[j] + nums[k]
                if sum == 0 {
                    ans.append([nums[i],nums[j],nums[k]])
                    j += 1
                    k -= 1
                    // Skip duplicate j
                    while j < k && nums[j] == nums[j-1] {
                        j += 1
                    } 
                    // Skip duplicate k
                    while j < k && nums[k] == nums[k+1] {
                        k -= 1
                    } 
                } else if sum < 0 {
                    j += 1
                } else {
                    k -= 1
                }
            }
        }
        return ans
    }
}
