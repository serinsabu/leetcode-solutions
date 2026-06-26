class Solution {
    func numberOfSubstrings(_ s: String) -> Int {
        var map = [Character: Int]()
        var chars = Array(s)
        var i=0
        var j=0
        var n = s.count
        var count = 0

        while j < n {
            map[chars[j], default: 0] += 1

            while map["a", default: 0] > 0 && 
                    map["b", default: 0] > 0 && 
                    map["c", default: 0] > 0 {
                map[chars[i]]! -= 1
                count += n-j
                i += 1
            }
            j += 1
        }
        return count
    }
}
