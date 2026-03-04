class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var sum=0
        var count=0
        var map: [Int: Int] = [0:1]
        for num in nums {
            sum += num//6
            if let c = map[sum-k] {
                count += c//2
            }
            map[sum, default:0] += 1
        }
        return count
    }
}
