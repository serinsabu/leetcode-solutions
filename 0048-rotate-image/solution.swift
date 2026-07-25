class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        var m = matrix.count
        var n = matrix[0].count

        // transpose
        for i in 0..<m {
            for j in i..<n {
                var temp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
            }
        }

        for i in 0..<n {
            reverse(i)
        }
        
        // reverse every row
        func reverse(_ row: Int) {
            var left = 0
            var right = n-1
            while left < right {
                var temp = matrix[row][left]
                matrix[row][left] = matrix[row][right]
                matrix[row][right] = temp
                left += 1
                right -= 1
            }
        }
    }
}
