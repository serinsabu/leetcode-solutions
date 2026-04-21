class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        if matrix.isEmpty || matrix[0].isEmpty {
            return []
        }
        var n = matrix.count
        var m = matrix[0].count
        var ans = [Int]()

        var left = 0
        var right = m-1
        var top = 0
        var bottom = n-1

        while left <= right && top <= bottom {
            if left <= right {
                for i in left...right {
                    ans.append(matrix[top][i])
                }
                top += 1
            }

            if top <= bottom {
                for i in top...bottom {
                    ans.append(matrix[i][right])
                }
                right -= 1
            }

            // bottom row
            if top <= bottom {
                for i in stride(from: right, through:left, by: -1) {
                    ans.append(matrix[bottom][i])
                }
                bottom -= 1
            }

            // right column
            if left <= right {
                for i in stride(from: bottom, through:top, by: -1) {
                    ans.append(matrix[i][left])
                }
                left += 1
            }
        }
        return ans
    }
}
