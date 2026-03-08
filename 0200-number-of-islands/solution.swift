class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        let m = grid.count
        let n = grid[0].count

        // matrix dfs => x,y
        func dfs(_ x: Int, _ y: Int) {
            guard grid[x][y] == "1" else {
                return 
            }
            // make grid visited
            grid[x][y] = "2"
            //tuple for directions top, bottom, right, left
            var dirs = [(0,1),(1,0),(-1,0),(0,-1)]

            for (dx,dy) in dirs {
                let nx = x + dx
                let ny = y + dy

                // condition check for out of bounds and visited or not
                guard nx >= 0, nx < m, ny >= 0, ny < n, grid[nx][ny] == "1" else {
                    continue
                } 

                dfs(nx, ny)
            }
        }
        var islandCount = 0
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == "1" {
                    dfs(i, j)
                    islandCount += 1
                }
            }
        }
        return islandCount
    }
}
