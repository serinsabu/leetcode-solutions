class Solution {
    func totalFruit(_ fruits: [Int]) -> Int {
        // You don’t assign per position, you assign per type.
        // [1,2,1] => 1,1 is one type of fruit in one basket, 2 is another type of fruit
        // Longest subarray with AT MOST 2 distinct elements
        var ans = 0
        var n = fruits.count
        var map = [Int: Int]()
        var i = 0
        var j = 0

        while j < n {
            map[fruits[j], default: 0] += 1

            while map.count > 2 {
                // shrink
                map[fruits[i], default: 0] -= 1
                if map[fruits[i]] == 0 {
                    map.removeValue(forKey: fruits[i])
                }
                i += 1
            }
            ans = max(ans, j-i+1)
            j += 1
        }
        return ans
    }
}
