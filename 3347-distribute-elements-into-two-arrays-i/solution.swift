class Solution {
    func resultArray(_ nums: [Int]) -> [Int] {
        var n = nums.count
        var arr1 = [Int]()
        var arr2 = [Int]()

        // SIMULATION - Do exactly as the question suggests
        // when series of operations are given in the question instead of asking for min,max,shortest

        arr1.append(nums[0])
        arr2.append(nums[1])

        for i in 2..<n {
            if arr1.last! > arr2.last! {
                arr1.append(nums[i])
            } else {
                arr2.append(nums[i])
            }
        }
        return arr1 + arr2
    }
}
