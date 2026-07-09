class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        var n = s.count
        var pArr = Array(repeating:0, count: 26)
        var sArr = Array(repeating:0, count: 26)
        var ans = [Int]()

        var i=0
        var j=0

        for ch in p {
            pArr[Int(ch.asciiValue! - Character("a").asciiValue!)] += 1
        }
        var chars = Array(s)
        //a-1,b-1,c-1
        while j < n {
            sArr[Int(chars[j].asciiValue! - Character("a").asciiValue!)] += 1//c-1,b-1,a-1

            // invalid window
            if j-i+1 > p.count {
                //shrink
                sArr[Int(chars[i].asciiValue! - Character("a").asciiValue!)] -= 1
                i += 1
            }
            // compare the dictionaries
            if sArr == pArr {
                ans.append(i)//0
            }
            j += 1//2
        }
        return ans
    }
}
