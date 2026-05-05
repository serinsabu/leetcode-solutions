class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        // 1 4 7
        // 2 5 8
        // 3 6 9
        // transform rows into columns and vice versa
        for i in 0..<matrix.count {
            for j in i..<matrix[i].count {
                //Swap instead of overwrite
                // j starts from i → avoids double swapping
                let temp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
            }
        }
        // reverse each row → 90° rotation
        // Take each row → reverse it
        for i in 0..<matrix.count {
            reverse(i)
        }


        func reverse(_ row: Int) {
            var left = 0
            var right = matrix[row].count-1

            while left < right {
                let temp = matrix[row][left]
                matrix[row][left] = matrix[row][right]
                matrix[row][right] = temp

                left += 1
                right -= 1
            }
        }
    }
}
