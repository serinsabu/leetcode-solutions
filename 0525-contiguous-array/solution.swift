class Solution {
    func findMaxLength(_ nums: [Int]) -> Int {
        var n = nums.count
        var maxLength = Int.min
        var nums = nums

        for i in 0..<nums.count {
            if nums[i] == 0 {
                nums[i] = -1
            }
        }
        //subarray sum equals 0
        var presum = 0
        var dict = [Int: Int]()//key=num, value = index
        dict[0] = -1// index only first occurence
        for i in 0..<nums.count {
            presum += nums[i]
            if let val = dict[presum] {
                maxLength = max(maxLength, i-val)
            } else {
                dict[presum] = i 
            }
        }
        // print(maxLength)
        return maxLength == Int.min ? 0 : maxLength
    }
}
