class Solution {
    func reverse(_ x: Int) -> Int {
        var num = x
        var rev = 0
        while(num != 0) {
            var rem = num%10

            if (rev > Int(Int32.max/10)) || (rev == Int(Int32.max/10) && rem > 7) {
                return 0
            }

            if (rev < Int(Int32.min/10)) || (rev == Int(Int32.min/10) && rem < -8) {
                return 0
            }

            rev = rev * 10 + rem

            num = num/10
        }
        return rev
    }
}
