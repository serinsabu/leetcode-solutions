class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        let sorted = intervals.sorted { $0[0] < $1[0]}
        // var s1 = sorted[0][0] - as we are not using it
        var e1 = sorted[0][1]
        var removed = 0

        for interval in 1..<sorted.count {
            var s2 = sorted[interval][0]
            var e2 = sorted[interval][1]

            // Overlap: remove one interval and keep the one with the smaller end
            // == does not come under overlap acc to the question
            if s2 < e1 {
                // keep the smaller end interval because the earlier the intervals,
                // the more room it leaves
                e1 = min(e1,e2)
                // because its overlapping, we need to remove one of the interval
                removed += 1
            } else {
                // No overlap: keep the current interval
                // Otherwise, on the next iteration you’ll still compare against the old interval. if not updated
                e1 = e2 
            }
        }
        return removed 
    }
}
