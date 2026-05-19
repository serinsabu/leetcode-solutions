class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        // sort by start time
        var sorted = intervals.sorted { $0[0] < $1[0] }
        var s1 = sorted[0][0]//1,8
        var e1 = sorted[0][1]//3,10

        var ans = [[Int]]()

        //case 1 - overlapping
        for interval in sorted {
            var s2 = interval[0]//15
            var e2 = interval[1]//18

            //3 >= 2 - overlapping
            //3 >= 8 -no
            //10 >= 15 -no
            //update end
            if e1 >= s2 {
                e1 = max(e1, e2)//6
            } else {//append when non overlapping
                ans.append([s1,e1])//[[1,6],[8,10]]
                s1 = s2//15
                e1 = e2//18
            }
        }
        ans.append([s1,e1])//[[1,6],[8,10],[15,18]]
    return ans
    }
}
