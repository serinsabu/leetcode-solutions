class Solution {
    func totalFruit(_ fruits: [Int]) -> Int {
        var n = fruits.count
        var map = [Int: Int]()
        var i=0
        var j=0
        var maxCount = Int.min

        while j < n {
            map[fruits[j], default: 0] += 1
            //3-3,1-1
            // invalid -> shrink
            while map.count > 2 {
                if map[fruits[i]]! == 1 {
                    map.removeValue(forKey: fruits[i])
                } else {
                    map[fruits[i]]! -= 1
                }
                i += 1//
            }
            maxCount = max(maxCount, j-i+1)
            j += 1//3
        }
        return maxCount
    }
}
