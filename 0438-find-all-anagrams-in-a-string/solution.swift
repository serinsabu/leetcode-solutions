class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        var n = s.count
        var sDict = [Character: Int]()
        var pDict = [Character: Int]()

        for ch in p {
            pDict[ch, default: 0] += 1 // a-1,b-1,c-1
        }

        var i=0
        var j=0
        var k=p.count
        var chars = Array(s)
        var ans = [Int]()

        while j < n {
            sDict[chars[j], default: 0] += 1

            while j-i+1 > k {
                // if that character is present in both s and p - SHRINK
                if sDict[chars[i]]! > 1 {
                    sDict[chars[i]]! -= 1
                } else {
                    sDict.removeValue(forKey: chars[i])
                }
                    i += 1
            }
            // store first occurence
            if sDict == pDict  {
                ans.append(i)
            }
            j += 1
        }
        return ans
    }
}
