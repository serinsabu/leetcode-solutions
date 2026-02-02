class Solution {
    func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        var n = weights.count
        var low = weights.max()!
        var sum = 0

        for weight in weights {
            sum += weight
        }
        var high = sum
        var ans = 0

        while(low <= high) {
            var mid = (low+high)/2
            if(canLoad(mid)) {
                ans = mid
                high = mid - 1
            } else {
                low = mid + 1
            }
        }

        func canLoad(_ capacity: Int) -> Bool {
            var totalPackages = 0
            var day = 1
            for weight in weights {
                totalPackages += weight
                if totalPackages > capacity {
                    // keep adding
                    totalPackages = weight
                    day += 1
                } 
                if(day > days) {
                    return false
                }      
            }
            return day <= days
        }
        return ans
    }
}
