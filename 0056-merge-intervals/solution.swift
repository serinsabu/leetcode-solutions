class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var ans = [[Int]]()
        // sort intervals by start time 
        let sorted = intervals.sorted {$0[0] < $1[0]}
        var s1 = sorted[0][0]
        var e1 = sorted[0][1]
        for interval in 1..<sorted.count {
            var s2 = sorted[interval][0]
            var e2 = sorted[interval][1]

            // overlapping -> When intervals overlap, you should extend the end, not change start.
            /*
            if overlapping
                extend end
            else
                store previous interval
                start new interval
            */
            if s2 <= e1 {
                // update
                e1 = max(e1, e2)
            } else {
                // merge overlapped intervals during non overlap
                ans.append([s1, e1])
                s1 = s2
                e1 = e2
            }
        }
        // merge last interval
        ans.append([s1, e1])
        return ans
    }
}
