class Solution {
    func maxProduct(_ n: Int) -> Int {
        var n = n
        var first = 0
        var second = 0
        var digit = 0

        while n > 0 {
            var rem = n%10//3
            if rem > first {
                second = first
                first = rem
            } else if rem > second {
                second = rem
            }
            digit = first * second //1
            n = n / 10//3
        }
        return digit
    }
}
