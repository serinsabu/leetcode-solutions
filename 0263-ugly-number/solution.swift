class Solution {
    func isUgly(_ n: Int) -> Bool {
        // One important missing case: n <= 0 is not ugly.
        if n <= 0 {
            return false
        }
        var num = n
        for factor in [2,3,5] {
            while num%factor == 0 {
                num /= factor
            }
        }
        return num == 1
    }
}
