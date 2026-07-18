class Solution {
    func rearrangeString(_ s: String, _ x: Character, _ y: Character) -> String {
        var sDict = [Character: Int]()

        for ch in s {
            sDict[ch, default: 0] += 1
        }
        //[j-2,y-1,m-1,f-1,c-1]
        var ans = ""
        print(sDict)
        
            if ans == "" {
                for (key, value) in sDict {
                    if key == y {
                        var val = value//2
                        while val > 0 {
                            ans += String(key)//jj
                            val -= 1
                        }
                    }
                }
            }

        var newStr = ""
        for ch in s {
            // print("\(ans) \(String(ch)) -> \(ans != String(ch))")
            if !ans.contains(String(ch)) {
                newStr += String(ch)//
            }
        }
        
        return ans + newStr
    }
}
