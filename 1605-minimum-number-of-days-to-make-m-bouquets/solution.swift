class Solution {
    func minDays(_ bloomDay: [Int], _ m: Int, _ k: Int) -> Int {
        var low = bloomDay.min()!
        var high = bloomDay.max()!

        if bloomDay.count < (m*k) {
            return -1
        }
        while low < high {
            var mid = low+(high-low)/2
            if canMake(mid) {
                high = mid
            } else {
                low = mid+1
            }
        }

        // i need to say if i can make m bouquets or not
        // to say if i can make, i need to check m = k adj flowers and no of days <= bloom day
        // Need this
        // flowers = consecutive flowers available
        // bouquets = bouquets formed
        func canMake(_ day: Int) -> Bool {
            var flowers = 0
            var m = m
            for bloom in bloomDay {
                if day >= bloom {
                    // make m bouquets
                    flowers += 1
                } else {
                    // break adjacency
                    flowers = 0
                }
                // 1 bouquet
                if flowers == k {
                    m -= 1
                    // reset , after making 1 bouquet
                    flowers = 0

                    if m == 0 {
                        return true
                    }
                }
            }
            return false
        }
        return high
    }
}
