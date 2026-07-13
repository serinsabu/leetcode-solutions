class Solution {
    func arrayRankTransform(_ arr: [Int]) -> [Int] {
        var rank = 1
        var arr = arr
        let sorted = arr.sorted()
        var dict = [Int: Int]()
        //rank=1,2
        //100-1,1,1
        for num in sorted {
            if let val = dict[num] {
                dict[num] = val
            } else {
                dict[num] = rank
                rank += 1
            }
        }
        //10-1,20-2,30-3,40-4
        var ans = [Int]()

        for num in arr {
            ans.append(dict[num]!)
        }
        return ans
    }
}

