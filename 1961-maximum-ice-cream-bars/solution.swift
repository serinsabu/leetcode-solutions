class Solution {
    func maxIceCream(_ costs: [Int], _ coins: Int) -> Int {
        var costs = costs
        let sortedCosts = costs.sorted()
        var n = sortedCosts.count
        var sum = 0
        var count = 0

        for i in 0..<n {
            sum += sortedCosts[i]
            count += 1

            if sum > coins {
                sum -= sortedCosts[i]
                count -= 1
            }
        }
        return count
    }
}
