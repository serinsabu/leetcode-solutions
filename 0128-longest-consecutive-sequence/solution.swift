class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var n = nums.count
        var seen = Set<Int>()
        if nums.isEmpty {
            return 0
        }
        for num in nums {
            seen.insert(num)
        }
        var maxLength = 0
        for num in seen {
            if !seen.contains(num-1) {
                // keep on checking next number for consecutoive seq
                var val = num + 1//2
                var longest = 1//1
                while seen.contains(val) {
                    val += 1//5
                    longest += 1//4
                }
                maxLength = max(longest, maxLength)//4
            } 
        }
        return maxLength
    }
}
