class Solution {
    func judgeCircle(_ moves: String) -> Bool {
        var l = 0
        var r = 0
        var u = 0
        var d = 0

        for ch in moves {
            if ch == "U" {
                u += 1
            } else if ch == "D" {
                d += 1
            } else if ch == "L" {
                l += 1
            } else {
                r += 1
            }
        }
        return u == d && l == r
    }
}
