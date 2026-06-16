class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var i=0
        var j=0
        var map=[Character: Int]()
        var n = s.count

        // You count frequencies inside the current sliding window.
        var chars = Array(s)
        var maxFreq = Int.min
        var ans = 0
        while j < n {
            map[chars[j], default: 0] += 1
            maxFreq = max(maxFreq, map[chars[j]]!)

            // invalid - shrink and remove from map
            while (j-i+1) - maxFreq > k {
                if map[chars[i]]! > 1 {
                    map[chars[i]]! -= 1
                } else {
                    map.removeValue(forKey: chars[i])
                }
                i += 1
            }
            // valid window
            if (j-i+1) - maxFreq <= k {
                // replace
                ans = max(j-i+1, ans)
            }
            j += 1
        }
    return ans
    }
}
