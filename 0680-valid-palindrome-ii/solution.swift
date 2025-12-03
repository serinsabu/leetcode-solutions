class Solution {
    // check for palindrome for the remaining string
    func palindromeHelper(_ i: Int, _ j: Int,_ s: String) -> Bool {
        var chars = Array(s)
        var left = i
        var right = j
        while(left < right) {
            if chars[left] != chars[right] {
                return false
            } else {
                left += 1
                right -= 1
            }
        }
        return true
    }

    func validPalindrome(_ s: String) -> Bool {
        var i=0
        var j=s.count-1
        var chars = Array(s)

        while(i < j) {
            if(chars[i] != chars[j]) {
                // you have a chance to delete one character and move forward
                return palindromeHelper(i+1, j, s) || palindromeHelper(i, j-1, s)
            } else {
                i += 1
                j -= 1
            }
        }
        return true
    }
}
