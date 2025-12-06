class Solution {
    func countPairs(_ nums: [Int], _ target: Int) -> Int {
        var arr = nums
        arr.sort()
        var n = arr.count
        var i=0
        var j=n-1
        var count = 0
        while(i < j) {
            if(arr[i] + arr[j] < target) {
                count += j-i
                i += 1
            } else {
                j -= 1
            }
        }
        return count
    }
}
