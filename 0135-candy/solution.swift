class Solution {
    func candy(_ ratings: [Int]) -> Int {
        var n = ratings.count
        var candies = Array(repeating: 1, count: n)

        // Two Passes -> left to right, right to left - Why?
        // Child 0 should have MORE candies than child 1. when rating is < case 
        // Pass 1: left to right
        // if current rating > left rating 
        // Higher rating than neighbor → child must get more candies
        for i in 1..<n {
            if ratings[i] > ratings[i-1] {
                // child getting more candy than neighbour
                // MINIMUM total candies -> give exactly one more
                candies[i] = candies[i-1] + 1
            }
        }
        for i in stride(from: n-2, through: 0, by: -1) {
            if ratings[i] > ratings[i+1] {
                // child getting more candy than neighbour
                // MINIMUM total candies -> give exactly one more
                candies[i] = max(candies[i], candies[i+1] + 1)
            }
        }

        var totalSum = 0
        for i in 0..<candies.count {
            totalSum += candies[i]
        }
        return totalSum
    }
}
