class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        var s1 = newInterval[0]//4
        var e1 = newInterval[1]//8
        var isMerged = false

        for interval in intervals {
            var s2 = interval[0]//6
            var e2 = interval[1]//7
            //---1--2--3--5--
            //----------4---8
            // case 1 - current interval before new interval
            // dont overlap
            if e2 < s1 {
                ans.append([s2,e2])//[[1,2], [3,8], [6,8], ]
            } 
            // overlap, update end interval
            else if s2 <= e1 {//4 <= 2, 4 <= 5, 4 <= 7
                // expand the new interval:
                // You should update the new interval, because that’s what you’re carrying forward
                s1 = min(s1, s2)
                e1 = max(e1, e2)
            } else {
                // new interval is after current interval
                // add merged interval once
                if !isMerged {
                    ans.append([s1,e1])//[[1,2], [3,8], [6,8], ]
                    // then stop merging from now on
                    isMerged = true
                }
                // append the current interval
                ans.append([s2,e2])//[[1,2], [3,8], [6,8], ]
            }
        }
        if !isMerged {
            ans.append([s1,e1])
        }
        return ans
    }
}
