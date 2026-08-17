class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n < 0 {
            return 1 / myPow(x, -n)
        }
        if n == 0 {
            return 1.0
        }
        // even
        if n%2 == 0 {
            let half = myPow(x, n/2)
            return half * half
        } else { // odd
            // ex: 2^5 = 2 * 2^4
            let half = myPow(x, n/2)
            return x * half * half
        }
        return x * myPow(x, n-1)
    }
}
