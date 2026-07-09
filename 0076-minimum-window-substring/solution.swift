class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        var patternFreq = [Character: Int]()
        var wordFreq = [Character: Int]()
        var i=0
        var j=0
        
        for ch in t {
            patternFreq[ch, default: 0] += 1
        }
        var formed = 0
        var requiredCount = patternFreq.count
        var chars = Array(s)
        var minLength = Int.max
        var startInd = 0
        var n = s.count

        while j < n {
            // Expand
            wordFreq[chars[j], default: 0] += 1

            // increment formed when we get same num of characters from 
            // pattern and curr window
            if let freq = patternFreq[chars[j]], freq == wordFreq[chars[j]]! {
                formed += 1
            }

            // valid - shrink
            while formed == requiredCount {
                // minium window
                if j-i+1 < minLength {
                    minLength = j-i+1
                    startInd = i // best minimum start index
                }
                wordFreq[chars[i], default: 0] -= 1
                // also decrement formed while shrinking
                // decrement when we shrink the character thats present in pattern
                // from current window that means if char in curr window is less that pattern
                if let freq = patternFreq[chars[i]], wordFreq[chars[i]]! < freq {
                    formed -= 1
                }
                i += 1
            }

            // expand
            j += 1
        }
        return minLength == Int.max ? "" : String(chars[startInd..<startInd + minLength])
    }
}
