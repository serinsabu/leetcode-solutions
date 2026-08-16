class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        var ugly = Array(repeating: 0, count: n)
        // base case
        ugly[0] = 1

        /*
            Suppose we already have an ugly number:
            6 = 2 × 3
            Multiply it by 2:
            6 × 2 = 12
            Prime factors:
            12 = 2 × 2 × 3
            Still only 2, 3, 5 → ugly ✅

            Multiply by 3:
            6 × 3 = 18
            18 = 2 × 3 × 3
            Still ugly ✅

            same for 5 - still ugly

            What if we multiplied by 7?
            6 × 7 = 42
            42 = 2 × 3 × 7
            Now 7 is a prime factor.
            So 42 is not an ugly number ❌.

            2^a × 3^b × 5^c
            Multiplying by:
            2 → 2^(a+1) × 3^b × 5^c
            3 → 2^a × 3^(b+1) × 5^c
            5 → 2^a × 3^b × 5^(c+1)
            It can never introduce a new prime factor.
        */

        // as its given in question, its factors are limited to 2,3,5
        var i2 = 0
        var i3 = 0
        var i5 = 0
        
        for i in 1..<n {
            // variadic
            var next = min(ugly[i2] * 2, min(ugly[i3] * 3, ugly[i5] * 5))

            // store next in the dp array
            ugly[i] = next // next is the ugly number you calculated.

            if next == ugly[i2] * 2 {
                i2 += 1
            }
            if next == ugly[i3] * 3 {
                i3 += 1
            }
            if next == ugly[i5] * 5 {
                i5 += 1
            }
        }
        return ugly[n-1]
    }
}
