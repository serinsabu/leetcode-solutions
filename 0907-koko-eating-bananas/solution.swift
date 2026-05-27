class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var low = 1
        var high = piles.max()!

        while low <= high {
            var mid = low+(high-low)/2
            if canEat(mid) {
                high = mid-1
            } else {
                low = mid+1
            }
        }

        func canEat(_ val: Int) -> Bool {
            var totalHrs = 0
            for pile in piles {
                totalHrs += (pile + val - 1) / val
                if totalHrs > h {
                    return false
                }
            }
            return true
        }
        return low
    }
}
