class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var m = grid.count
        var n = grid[0].count
        var grid = grid
        var count = 0
        //info p list
        //uidesign requires compatibility - false - glass
        //true - old design

        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == "1" {
                    dfs(i,j)
                    count += 1
                }
            }
        }

        func dfs(_ row: Int, _ col: Int) {
            // case 1 - out of bounds , check all 4 sides
            if row < 0 || row >= m || col < 0 || col >= n {
                return
            }

            // case 2 - if water, skip
            if grid[row][col] == "0" {
                return
            }

            // case 3 - if already marked, skip
            if grid[row][col] != "1" {
                return
            }

            // Mark current cell visited
            grid[row][col] = "2"

            // 4 directions
            var dirs = [(-1,0),(1,0),(0,1),(0,-1)]
            for (x,y) in dirs {
                dfs(row + x, col + y)
            }
        }
        return count
    }
}
