class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var ans = [[Int]]()
        let sorted = intervals.sorted { $0[0] < $1[0] }
        //first interval
        var s1 = sorted[0][0]//8
        var e1 = sorted[0][1]//10
        
        for interval in 1..<sorted.count {
            var s2 = sorted[interval][0]//15
            var e2 = sorted[interval][1]//18
            // overlap
            if s2 <= e1 {//2<=3, 8 <= 3 , 15 <= 10
                e1 = max(e1,e2)//6
            } else {
                ans.append([s1,e1])//[[1,6], [8,10]]
                s1 = s2//15
                e1 = e2//18
            }
        }
        ans.append([s1,e1])
        return ans
    }
}
