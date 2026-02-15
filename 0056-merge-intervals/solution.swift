class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard !intervals.isEmpty else { return [] }
        let sorted = intervals.sorted{$0[0] < $1[0]}
        var result:[[Int]] = [sorted[0]]//sorted[0]=>[s1,e1]

        for i in 1..<sorted.count {
            let curr = sorted[i]//start=>[s2,e2]
            var last = result.removeLast()//sorted[0]=>(s1,e1)

            if curr[0] <= last[1] {
                // overlap -> merge
                last[1] = max(last[1], curr[1])
                result.append(last)//[1,6]
            } else {
                // non overlap -> push the updated start and end you got during overlap
                result.append(last)// removed and pushed again [1,6], [8,10]
                result.append(curr)// [8,10], [15,18]
            }
        }
        return result
    }
}
