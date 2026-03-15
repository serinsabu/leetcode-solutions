class Solution {
    func countCommas(_ n: Int) -> Int {
        var org = n
        var str = String(org)
        var ans = 0
        var len = str.count

        while org > 0 {
            if len == 4 || len == 5 || len == 6 {
                ans += 1
            } else if len == 7 {
                ans += 2
            }
            org -= 1
            str = String(org)
            len = str.count
        }
        
        return ans
    }
}
