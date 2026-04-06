class Solution {
    func maxFreq(_ s: String, _ maxLetters: Int, _ minSize: Int, _ maxSize: Int) -> Int {
        var dict = [Character: Int]()
        var freq = [String: Int]()
        var chars = Array(s)
        var i = 0
        var j = 0
        var maxNum = 0

        while j < chars.count {
            dict[chars[j], default: 0] += 1//a-1,b-1

            if j-i+1 > minSize {
                // shrink window
                dict[chars[i]]! -= 1
                if dict[chars[i]]! == 0 {
                    dict.removeValue(forKey: chars[i])
                }
                i += 1//2
            }

            // when window size == minSize
            // ✔ Check validity
            // ✔ Count substring
            if j-i+1 == minSize {
                if dict.count <= maxLetters {
                    // count num of substrings
                    let sub = String(chars[i...j])
                    freq[sub, default: 0] += 1
                    // max of freq of substrings
                    maxNum = max(maxNum, freq[sub]!)
                }
            }
            j += 1//4
        }
        return maxNum
    }
}
