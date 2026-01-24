class Solution {
    func countCompleteSubarrays(_ nums: [Int]) -> Int {
        var k = Set(nums).count


        func atmostk(_ k: Int) -> Int {
            var dict = [Int:Int]()
            var left = 0
            var ans = 0

            for right in 0..<nums.count {
                dict[nums[right], default: 0] += 1

                while left <= right, dict.keys.count > k {
                    dict[nums[left], default: 0] -= 1
                    if dict[nums[left], default: 0] == 0 {
                        dict[nums[left]] = nil 
                    }
                    left += 1
                }
                ans += right-left+1
            }
            return ans
        }

        return atmostk(k) - atmostk(k-1)
    }
}
