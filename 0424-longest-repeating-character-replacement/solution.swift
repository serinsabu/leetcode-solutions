class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        //window size - maxfreq
        var n = s.count
        var chars = Array(s)
        var i=0
        var j=0
        var map = [Character: Int]()
        var maxFreq = 0
        var ans = 0

        while j < n {
            map[chars[j], default: 0] += 1
            maxFreq = max(maxFreq, map[chars[j]]!)

            // invalid
            while j-i+1 - maxFreq > k {
                map[chars[i]]! -= 1
                i += 1
            }
            ans = max(ans, j - i + 1)
            j += 1
        }
        return ans
    }
}
