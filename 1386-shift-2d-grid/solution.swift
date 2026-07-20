class Solution {
    func shiftGrid(_ grid: [[Int]], _ k: Int) -> [[Int]] {
        var ans = [[Int]]()
        var m = grid.count
        var n = grid[0].count
        var grid = grid
        var k = k

        if k == 0 {
            return grid
        }

        while k > 0 {
            var newGrid = Array(repeating: Array(repeating: 0, count: n), count: m)
            for i in 0..<m {
                for j in 0..<n {
                    if i < m && j < n - 1 {
                        newGrid[i][j + 1] = grid[i][j]
                    }
                    if i < m - 1 && j == n-1 {
                        newGrid[i + 1][0] = grid[i][j]
                    }
                    if i == m-1 && j == n-1 {
                        newGrid[0][0] = grid[i][j]
                    }
                }   
            }
            grid = newGrid
            ans = grid
            k -= 1
        }
        return ans
    }
}
