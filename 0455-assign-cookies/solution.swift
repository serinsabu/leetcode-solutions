class Solution {
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        var count = 0
        var i=0
        var j=0
        var m = g.count
        var n = s.count

        var g = g
        var s = s
        g.sort()
        s.sort()
        while i < m && j < n {
            if s[j] >= g[i] {
                count += 1
                i += 1
                j += 1
            } else {
                j += 1
            }
        }
        return count
    }
}
