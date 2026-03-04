class Solution {
    func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
        
        func atmost(_ val: Int) -> Int {
            var n = nums.count
            var i=0
            var j=0
            var oddCount = 0
            var count = 0
            while j < n {
                if nums[j]%2 == 1 {
                    oddCount += 1//3
                }

                while(oddCount > val) {
                    if nums[i]%2 == 1 {
                        oddCount -= 1
                    }
                    i += 1
                }
                // evry valid window in exactly k elements
                if oddCount <= val {
                    count += j-i+1//1
                }
                j += 1
            }
            return count
        }

    return atmost(k) - atmost(k-1)
    }
}
