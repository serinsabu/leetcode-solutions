class Solution {
    func totalFruit(_ fruits: [Int]) -> Int {
        var n = fruits.count
        var i=0
        var j=0
        var dict = [Int:Int]()
        var maxLength = 0

        while j < n {
            dict[fruits[j], default: 0] += 1//1-1,2-2
            // invalid
            while dict.count > 2 {
                if dict[fruits[i]]! > 1 {
                    dict[fruits[i]]! -= 1
                } else {
                    dict.removeValue(forKey: fruits[i])
                }
                i += 1//1
            }
            maxLength = max(maxLength, j-i+1)//3
            j += 1
        }
        return maxLength
    }
}
