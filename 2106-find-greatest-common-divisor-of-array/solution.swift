class Solution {
    func findGCD(_ nums: [Int]) -> Int {
        var large = nums.max()!
        var small = nums.min()!

        func gcd(_ m: Int, _ n: Int) -> Int {
            var a = 0
            var b = max(m,n)
            var r = min(m,n)

            while r != 0 {
                a = b
                b = r
                r = a%b
            }
            return b
        }
        return gcd(large, small)
    }
}
