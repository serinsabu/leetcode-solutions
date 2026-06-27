class Solution {
    func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
        var n = nums.count

        func atmostk(_ k: Int) -> Int {
            var i=0
            var j=0
            var oddCount = 0
            var count = 0

            while j < n {
                if nums[j]%2 == 1 {
                    oddCount += 1 //3
                }
                
                // invalid - shrink
                while oddCount > k {
                    if nums[i]%2 == 1 {
                        oddCount -= 1
                    }
                    i += 1//1
                }
                count += j-i+1//1
                j += 1//3
            }
            return count
        }
    return atmostk(k) - atmostk(k-1)
    }
}
