class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var sdict = Array(repeating: 0, count: 26)

        if s.count != t.count {
            return false
        }

        for ch in s {
            sdict[Int(ch.asciiValue! - Character("a").asciiValue!)] += 1
        }

        for ch in t {
            if sdict[Int(ch.asciiValue! - Character("a").asciiValue!)] > 0 {
                sdict[Int(ch.asciiValue! - Character("a").asciiValue!)] -= 1
            } else {
                return false
            }
        }
        return true
    }
}
