class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var grid = grid
        var m = grid.count
        var n = grid[0].count
        var maxAns = 0

        for i in 0..<m {
            for j in 0..<n {
                maxAns = max(maxAns, dfs(i,j))
            }
        }
        
        func dfs(_ row: Int, _ col: Int) -> Int {
            // bounds
            if row < 0 || row >= m || col < 0 || col >= n {
                return 0
            }
            // water, already visited - skip
            if grid[row][col] != 1 {
                return 0
            }
            // mark visited
            grid[row][col] = 2
            // unvisited - 4 directions
            return 1 + dfs(row-1,col) + dfs(row+1,col) + dfs(row, col-1) + dfs(row, col+1)
        }
        return maxAns
    }
}
