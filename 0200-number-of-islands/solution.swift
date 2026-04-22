class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var m = grid.count//rows
        var n = grid[0].count//columns
        var grid = grid
        var count = 0

        // if the grid[i][j] == '1' then start dfs from there
        // if dfs is done for one island then increase count
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == "1" {
                    dfs(i, j)
                    count += 1
                }
            }
        }

        func dfs(_ r: Int, _ c: Int) {
            // mark it visited
            grid[r][c] = "0"

            //4 directions
            let dirs = [(0,1), (1,0), (-1,0), (0,-1)]

            for (dx,dy) in dirs {
                let newR = r + dx
                let newC = c + dy
                //boundary check

                guard newR >= 0, newR < m, newC >= 0, newC < n, grid[newR][newC] == "1" else {
                    continue
                } 

                dfs(newR, newC)
            }
        }
        return count
    }
}
