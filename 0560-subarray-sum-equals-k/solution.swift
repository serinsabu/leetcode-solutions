class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var dict = [Int: Int]()
        var currPrefix = 0
        var count = 0
        dict[0] = 1
        //dict=[0:1,1:3,-1:2]

        for num in nums {
            currPrefix += num//1
            // currPrefixSum - target already exists
            if let freq = dict[currPrefix - k] {//dict[1-0]
                // count += 1//4 => [1, -1, 1, -1, 1],k = 0 wrong
                count += freq//6
            }
            dict[currPrefix, default: 0] += 1//1->3,-1->2,
        }
        return count
    }
}
