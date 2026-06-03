class Solution {
    func earliestFinishTime(_ landStartTime: [Int], _ landDuration: [Int], _ waterStartTime: [Int], _ waterDuration: [Int]) -> Int {

        var finalMin = Int.max
        var last = -1
        
        // land ride
        for i in 0..<landStartTime.count {
            var lSum = landStartTime[i] + landDuration[i]
            if i > 0 {
                last = landStartTime[i-1] + landDuration[i-1]
            }
            if last != lSum && finalMin > lSum {
                for j in 0..<waterStartTime.count {
                    var wSum = 0
                    if lSum >= waterStartTime[j] {
                        wSum = lSum + waterDuration[j]
                    } else {
                        wSum = waterStartTime[j] + waterDuration[j]
                    }
                    finalMin = min(finalMin, wSum)
                }
            }
        }

        // water ride
        for i in 0..<waterStartTime.count {
            var wSum = waterStartTime[i] + waterDuration[i]
            if i > 0 {
                last = waterStartTime[i-1] + waterDuration[i-1]
            }
            if last != wSum && finalMin > wSum {
                for j in 0..<landStartTime.count {
                    var lSum = 0
                    if wSum >= landStartTime[j] {
                        lSum = wSum + landDuration[j]
                    } else {
                        lSum = landStartTime[j] + landDuration[j]
                    }
                    finalMin = min(finalMin, lSum)
                }
            }
        }
    return finalMin
    }
}
