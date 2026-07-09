class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        if s1.count > s2.count {
            return false
        }
        var i=0
        var j=0

        var s1Arr = Array(repeating:0, count: 26)
        var s2Arr = Array(repeating:0, count: 26)

        for ch in s1 {
            s1Arr[Int(ch.asciiValue! - Character("a").asciiValue!)] += 1
        }
        var chars = Array(s2)
        var n = s2.count

        while j < n {
            s2Arr[Int(chars[j].asciiValue! - Character("a").asciiValue!)] += 1

            // invalid - shrink
            if j-i+1 > s1.count {
                s2Arr[Int(chars[i].asciiValue! - Character("a").asciiValue!)] -= 1
                i += 1
            }
            if s2Arr == s1Arr {
                return true
            }
            j += 1
        }
        return false
    }
}
