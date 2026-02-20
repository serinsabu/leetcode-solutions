class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard !intervals.isEmpty else { return [] }
        var sorted = intervals.sorted{$0[0] < $1[0] }//sort by start time
        var ans = [sorted[0]]

        for i in 1..<sorted.count {
            var prev = ans.removeLast()//[s1,e1]
            var curr = sorted[i]//[s2,e2]

            //overlapping
            if curr[0] <= prev[1] {
                // update e1
                prev[1] = max(curr[1], prev[1])
                ans.append(prev)
            } else {
                // non overlapping -> merge
                ans.append(prev)
                ans.append(curr)
            }
        }
        return ans
    }
}
