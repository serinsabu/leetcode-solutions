class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var freq:[Int: Int] = [Int:Int]()

        for i in 0..<nums.count {
            freq[nums[i], default:0] += 1
        }
        
        let sorted = freq.sorted { $0.value > $1.value }

        var ans = [Int]()
        var index = 0
        while index < k {
            ans.append(sorted[index].key)
            index += 1
        }
        return ans
    }
}

