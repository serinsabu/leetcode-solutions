class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var m = matrix.count
        var n = matrix[0].count
        var low = 0
        var high = m*n-1

        while low <= high {
            var mid = (low+high)/2
            var row = mid/n
            var col = mid%n
            if target == matrix[row][col] {
                return true
            } else if matrix[row][col] < target {
                low = mid+1
            } else {
                high = mid-1
            }
        }
        return false
    }
}
