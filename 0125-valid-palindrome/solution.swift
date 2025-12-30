class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var n = s.count
        var i=0
        var j=n-1

        var chars = Array(s)

        while(i < j) {
            if !chars[i].isLetter && !chars[i].isNumber {
                i += 1
                continue
            } 
            
            if !chars[j].isLetter && !chars[j].isNumber {
                j -= 1
                continue
            }

            if chars[i].lowercased() != chars[j].lowercased() {
                return false
            }

                i += 1
                j -= 1
        }
        return true
    }
}
