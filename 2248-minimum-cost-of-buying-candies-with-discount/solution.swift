class Solution {
    func minimumCost(_ cost: [Int]) -> Int {
        var cost = cost.sorted(by: >)
        var n = cost.count
        var sold = 0
        var i=0

        //[9,7,6,5,2,2]
        //[5,5]
        //[10,10,10,5,5,4,3,2]
        while i < n {
            sold += cost[i] + (i < n-1 ? cost[i+1] : 0)//10+10+5+5+3+2
            i += 3
        }
        return sold
    }
}
