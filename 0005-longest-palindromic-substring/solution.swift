class Solution {
    func longestPalindrome(_ s: String) -> String {
        var n = s.count
        var start = 0
        var maxLength = 1//what is the smallest palindrome possible?
        var chars = Array(s)

        func helper(_ left: Int, _ right: Int) {
            var left = left
            var right = right
            while left >= 0 && right < n && chars[left] == chars[right] {
                // expand
                left -= 1
                right += 1
            }
            let currStart = left + 1//palindrome starts from left is outside
            //(right - 1) - (left + 1) + 1 => right - 1 - left - 1 + 1 => right-left-2+1
            let currLength = right - left - 1 

            // when you get a better palindrome
            if currLength > maxLength {
                maxLength = currLength
                start = currStart
            }
        }

        for i in 0..<n {
            helper(i,i)//odd- same character
            helper(i,i+1)//even - between 2 characters
        }

        return String(chars[start..<start + maxLength])
    }
}
