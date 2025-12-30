class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        var num = x
        var original = num
        var rev = 0

        if num < 0 {
            return false
        }

        while num > 0 {
            var rem = num%10
            rev = rev * 10 + rem
            num = num/10
        }
       return rev == original
    }
}
