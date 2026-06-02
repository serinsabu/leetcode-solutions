class Solution {
    func earliestFinishTime(_ landStartTime: [Int], _ landDuration: [Int], _ waterStartTime: [Int], _ waterDuration: [Int]) -> Int {
        
        var finalMin = Int.max

        for i in 0..<landStartTime.count {
            var lSum = landStartTime[i] + landDuration[i]
            for j in 0..<waterStartTime.count {
                let wSum: Int
                if lSum >= waterStartTime[j] {
                    wSum = lSum + waterDuration[j]
                } else {
                    wSum = waterStartTime[j] + waterDuration[j]
                }
                finalMin = min(finalMin, wSum)
            }
        }

        for i in 0..<waterStartTime.count {
            var wSum = waterStartTime[i] + waterDuration[i]
            for j in 0..<landStartTime.count {
                let lSum: Int
                if wSum >= landStartTime[j] {
                    lSum = wSum + landDuration[j]
                } else {
                    lSum = landStartTime[j] + landDuration[j]
                }
            finalMin = min(finalMin, lSum)
            }
        }
        return finalMin
    }
}
