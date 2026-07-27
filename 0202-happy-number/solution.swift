class Solution {
    func isHappy(_ n: Int) -> Bool {
        var slow = n
        var fast = n
        while fast != 1 {
            slow = next(slow)
            fast = next(next(fast))
            if slow == fast {
                return slow == 1
            }
        }

        func next(_ n: Int) -> Int {
            var sum = 0
            var n = n
            while n > 0 {
                var rem = n%10
                sum += rem * rem
                n = n/10
            }
            return sum
        }
        return true
    }
}
