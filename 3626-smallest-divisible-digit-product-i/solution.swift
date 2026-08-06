class Solution {
    func smallestNumber(_ n: Int, _ t: Int) -> Int {
        var current = n 
        while true {
            var rem = current%10//0
            let prod = product(current)//0
            // smallest prod of digits divisible by t
            if prod%t == 0 {
                return current
            }
            current += 1
        }

        func product(_ num: Int) -> Int {
            var num = num
            var prod = 1
            while num > 0 {
                var rem = num%10//0
                prod *= rem
                num = num/10
            }
            return prod
        }
        return -1
    }
}
