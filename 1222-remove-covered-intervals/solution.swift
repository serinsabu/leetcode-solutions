class Solution {
    func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
        // count non overlapping intervals
        // sort intervals by start time
        // when start time is equal, sort in descending order, otherwise it wont give correct
        // covered intervals
        var sorted = intervals.sorted { 
            if $0[0] == $1[0] {
                return $0[1] > $1[1]
            }
            return $0[0] < $1[0]
        }
        // after sorting, Now the covering interval always appears before the covered interval.
        // condition to check covered intervals would be
        // [2,8],[3,6] => 2<=3 && 6<=8
        
        var s1 = sorted[0][0]//2
        var e1 = sorted[0][1]//8

        var count = 1// start from 1 , as The first interval is always kept.

        for i in 1..<sorted.count {
            var s2 = sorted[i][0]//3
            var e2 = sorted[i][1]//6
            // had to check s1 <= s2 && e2 <= e1 but starts are already sorted
            // check only e2, e1
            if e2 <= e1 {//1<=2 && 8<=4-no, 2<=3 && 6<=8 - yes
                // covered, so remove
            } else {
                s1 = s2
                e1 = e2
                count += 1
            }
        }
        return count
    }
}
