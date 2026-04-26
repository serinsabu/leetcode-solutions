class Solution {
    func containsCycle(_ grid: [[Character]]) -> Bool {
        var grid = grid
        var m = grid.count
        var n = grid[0].count
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)

        for i in 0..<m {
            for j in 0..<n {
                // if not visisted, dfs
                if !visited[i][j] {
                    if dfs(i, j, -1, -1) {
                        return true
                    }
                }
            }
        }

        func dfs(_ r: Int, _ c: Int, _ pr: Int, _ pc: Int) -> Bool {
            visited[r][c] = true

            var dirs = [(0,1), (-1,0), (0,-1), (1,0)]
            // move 4 directions
            for (dx, dy) in dirs {
                let newR = r + dx
                let newC = c + dy

                // boundary check
                guard newR >= 0 && newR < m && newC >= 0 && newC < n else {
                    continue
                }

                // check if same value
                if grid[r][c] != grid[newR][newC] {
                    continue
                }

                if !visited[newR][newC] {
                    // new pr and pc are r and c
                    if dfs(newR, newC, r, c) {
                        return true
                    }
                } else if newR != pr || newC != pc {//when new node is not parent
                    // cycle detected
                    return true
                }  
            }
            return false
        }

        return false
    }
}
