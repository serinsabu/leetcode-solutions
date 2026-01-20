class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var n = s.count
        var m = t.count
        var freq = Array(repeating: 0, count: 26)

        if n != m {
            return false
        }

        for ch in s {
            var index = Int(ch.asciiValue! - Character("a").asciiValue!)
            freq[index] += 1
        }

        for ch in t {
            var index = Int(ch.asciiValue! - Character("a").asciiValue!)
            if freq[index] > 0 {
                freq[index] -= 1
            } else {
                return false
            }
        }
        return true;
    }
}
