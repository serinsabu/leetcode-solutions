class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        // find next greater value of nums1 in nums2
        var n = nums1.count
        var m = nums2.count
        var dict = [Int: Int]()
        var ans = [Int]()
       
        var stack = [Int]()
        for i in stride(from: m-1, through:0, by: -1) {
            while !stack.isEmpty && stack.last! <= nums2[i] {
                stack.removeLast()
            }
            if stack.isEmpty {
                dict[nums2[i]] = -1
            } else {
                if let last = stack.last {
                    dict[nums2[i]] = last
                }
            }
            stack.append(nums2[i])
        }

        for i in 0..<n {
            ans.append(dict[nums1[i]]!)
        }
        return ans
    }
}
