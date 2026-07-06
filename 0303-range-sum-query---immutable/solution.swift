
class NumArray {
    var nums: [Int]
    init(_ nums: [Int]) {
        self.nums = nums
    }
    // nums = [-2, 0, 3, -5, 2, -1]
    // prefix = [-2,-2,1,-4,-2,-3]

    func buildPrefix() -> [Int] {
        var prefixSums = [Int]()
        var sum = 0
        for i in 0..<nums.count {
            sum += nums[i]
            prefixSums.append(sum)
        }
        return prefixSums
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        let prefixSums = buildPrefix()
        if left == 0 {
            return prefixSums[right]
        }
        return prefixSums[right] - prefixSums[left-1]
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * let ret_1: Int = obj.sumRange(left, right)
 */
