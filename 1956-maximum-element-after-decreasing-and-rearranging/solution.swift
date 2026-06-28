class Solution {
    func maximumElementAfterDecrementingAndRearranging(_ arr: [Int]) -> Int {
        var arr = arr
        arr.sort()
        //[1,1,2,2,2]
        // next = previous + 1
        var previous = 1
        for i in 1..<arr.count {
            previous = min(arr[i], previous + 1)
        }
        return previous
    }
}
