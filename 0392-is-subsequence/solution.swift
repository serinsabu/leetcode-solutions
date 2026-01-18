class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        var i=0
        var j=0

        let sChars = Array(s)
        let tChars = Array(t)

        while(i < s.count && j < t.count) {
            if(sChars[i] == tChars[j]) {
                i += 1
            }
            j += 1
        }
        return i == s.count
    }
}
