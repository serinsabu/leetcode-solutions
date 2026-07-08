class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var n = s.count
        var i=0
        var j=0
        var exists = Set<Character>()
        var chars = Array(s)
        var maxLength = 0

        while j < n {
            // invalid
            while exists.contains(chars[j]) {
                exists.remove(chars[i])
                i += 1
            }
            exists.insert(chars[j])//ab
            maxLength = max(maxLength, j-i+1)//1
            j += 1
        }
        return maxLength
    }
}
