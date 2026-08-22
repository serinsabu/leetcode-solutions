class Solution {
    func checkDivisibility(_ n: Int) -> Bool {
        func sumAndProdOfDig(_ num: Int) -> Int {
            var num = num
            var sum = 0
            var prod = 1
            while num > 0 {
                var rem = num%10
                sum += rem
                prod *= rem
                num = num/10
            }
            print(sum, prod)
            return sum + prod
        }

        let sumAndProd = sumAndProdOfDig(n)
        if (n % sumAndProd == 0) {
            return true
        }
        return false
    }
}
