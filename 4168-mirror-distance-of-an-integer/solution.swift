class Solution {
    func mirrorDistance(_ n: Int) -> Int {
        var n = n
        var rev = 0
        func reverse() -> Int {
            var val = n
            while val > 0 {
                var rem = val%10//2
                rev = rev * 10 + rem//52
                val = val/10 //0
            }
            return rev
        }
        return abs(n - reverse())
    }
}
