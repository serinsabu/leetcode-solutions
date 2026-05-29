class Solution {
    func minElement(_ nums: [Int]) -> Int {
        var n = nums.count
        func sumOfDig(_ num: Int) -> Int {
            var sum = 0
            var num = num
            while num > 0 {
                var rem = num%10
                sum += rem
                num = num / 10
            }
            return sum
        }
        return nums.map { sumOfDig($0) }.min()!
    }
}
