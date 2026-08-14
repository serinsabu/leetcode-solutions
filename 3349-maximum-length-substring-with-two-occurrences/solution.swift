class Solution {
    func maximumLengthSubstring(_ s: String) -> Int {
        var n = s.count
        var i=0
        var j=0
        var maxLen = -1
        var map = [Character: Int]()
        var chars = Array(s)

        while j < n {
            map[chars[j], default: 0] += 1

            while map[chars[j]]! > 2 {
                if map[chars[i]]! > 1 {
                    map[chars[i]]! -= 1
                } else {
                    map.removeValue(forKey: chars[i])
                }
                i += 1
            }
            maxLen = max(maxLen, j-i+1)
            j += 1
        }
        return maxLen
    }
}
