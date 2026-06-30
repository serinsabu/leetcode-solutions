class Solution {
    func numberOfSubstrings(_ s: String) -> Int {
        var n = s.count
        var i=0
        var j=0
        var ans = 0
        var dict = [Character: Int]()
        var chars = Array(s)

        while j < n {
            dict[chars[j], default: 0] += 1

            while dict["a", default: 0] >= 1 && 
                dict["b", default: 0] >= 1 && 
                dict["c", default: 0] >= 1 {
                // How many substrings START at i?
                ans += n-j
                // shrink
                dict[chars[i]]! -= 1
                i += 1
            }
            j += 1
        }
        return ans
    }
}
