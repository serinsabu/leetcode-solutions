class Solution {
    func sumAndMultiply(_ n: Int) -> Int {
        var sum = 0
        var prod = 1
        var x = 0 
        var n = n 
        //10203004
        while n > 0 {
            var rem = n%10//1
            sum += rem//4+3+2+1=10

            if rem > 0 {
                rem *= prod//4*1,3*10=30,2*100,1*1000
                x += rem//4+30=34,200+34=234,234+1000=1234
                prod *= 10//10,100,1000,10000
            }
            n = n/10//
        }
        return x * sum//1234*10
    }
}
