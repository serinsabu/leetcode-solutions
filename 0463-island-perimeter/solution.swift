class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        // A perimeter only includes the outer boundary, not internal edges.
        // find something thats exposed from outside, that can directly touch boundary
        var grid = grid
        var m = grid.count
        var n = grid[0].count

        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    return dfs(i,j)
                }
            }
        }

        func dfs(_ row: Int, _ col: Int) -> Int {
            // out of bounds - add
            if row < 0 || row >= m || col < 0 || col >= n {
                return 1
            }
            // water or outside , add
            if grid[row][col] == 0 {
                return 1
            }
            // land 0
            if grid[row][col] == 2 {
                return 0
            }
            grid[row][col] = 2
            return dfs(row-1, col) + dfs(row+1, col) + dfs(row, col-1) + dfs(row, col+1)
        }
        return -1
    }
}
