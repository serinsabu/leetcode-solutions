class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var i=0
        var j=s.count-1;

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
                return false;
            }
            i += 1
            j -= 1
        }
        return true;
    }
}
