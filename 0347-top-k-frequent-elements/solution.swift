class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var n = nums.count
        var ans = [Int]()
        var dict = [Int: Int]()

        for num in nums {
            dict[num, default: 0] += 1
        }
        //1-3,2-2,3-1
        let sortedDict = dict.sorted { $0.value > $1.value }
        //print(sortedDict[0].key)
        var i=0
        var k=k
        while k > 0 {
            ans.append(sortedDict[i].key)
            i += 1
            k -= 1
        }
        return ans
    }
}
