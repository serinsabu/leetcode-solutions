class Solution {
    func maxVowels(_ s: String, _ k: Int) -> Int {
        var maxCount = Int.min
        var chars = Array(s)

        // current vowel count
        var seen = Set<Character>(["a","e","i","o","u"])
        var vowelCount = 0
        
        var left = 0
        for right in 0..<s.count {
            // valid window
            if seen.contains(chars[right]) {
                vowelCount += 1//3
            }
            // invalid
            if right-left+1 > k {
                if seen.contains(chars[left]) {
                    vowelCount -= 1//
                }
                left += 1
            }
            maxCount = max(maxCount, vowelCount)//3
        }
        return maxCount
    }
}
