class Solution {
    func fib(_ n: Int) -> Int {
        var a = 0
        var b = 1
        var c = 0
        for i in 0..<n {
            a = b//1
            b = c//1
            c = a + b//2
        }
        return c
    }
}
