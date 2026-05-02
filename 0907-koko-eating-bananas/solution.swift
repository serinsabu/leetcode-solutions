class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var n = piles.count
        var low = 1
        var high = piles.max()!
        var ans = 0

        while low <= high {
            var mid = (low+high)/2
            if canEat(mid) {
                ans = mid
                high = mid-1
            } else {
                low = mid+1
            }
        }

        func canEat(_ mid: Int) -> Bool {
            var totalHrs = 0
            for pile in piles {
                totalHrs += Int(ceil(Double(pile) / Double(mid)))
            }
            return totalHrs <= h
        }
        return ans
    }
}
