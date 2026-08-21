class Solution {
    func isHappy(_ n: Int) -> Bool {
        var slow = n
        var fast = n

        // 2 → 4  → 16 s → 37 s → 58 s → 89 f → 145 s → 42 f → 20 s → 4 f

        repeat {
            slow = sumOfSq(slow)//
            fast = sumOfSq(sumOfSq(fast))//
            if fast == 1 {
                return true
            }
        } while slow != fast

        func sumOfSq(_ num: Int) -> Int {
            var num = num
            var sum = 0
            while num > 0 {
                var rem = num%10
                sum += rem * rem
                num = num/10
            }
            return sum
        }
        return false
    }
}
