class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var grid = grid
        var m = grid.count
        var n = grid[0].count
        var freshOrange = 0 // count fresh oranges only

            // insert all rotten oranges in the queue at the start
            var queue = [(Int,Int)]()

            // Scan the grid once because of fresh orange variable
            for i in 0..<m {
                for j in 0..<n {
                    if grid[i][j] == 2 {
                        queue.append((i,j))
                    } else if grid[i][j] == 1 {
                        freshOrange += 1
                    }
                }
            }

            // No fresh oranges
            if freshOrange == 0 {
                return 0
            }

            // add neighbour if its only 1 and inside grid
            var dirs = [(-1,0), (1,0), (0,1), (0,-1)]
            var time = 0
            while !queue.isEmpty {
                let size = queue.count
                for _ in 0..<size {
                    let (row, col) = queue.removeFirst()
                    for (x,y) in dirs {
                        var newX = x+row
                        var newY = y+col

                        // out of bounds and fresh orange rot
                        guard newX >= 0, newX < m, newY >= 0, newY < n else {
                            continue 
                        }
                        guard grid[newX][newY] == 1 else {
                            continue 
                        }
                        // make it rotten
                        grid[newX][newY] = 2

                        // decrement
                        freshOrange -= 1

                        queue.append((newX, newY))
                    }
                }
                // Only increment time if there are oranges,  if another level exists
                // waiting to spread in the next minute.
                if !queue.isEmpty {
                    time += 1
                }
            }
            

        // scan the grid again and check if any fresh oranges remain
        // instead of scan, check the freshOrange variable and scan grid only once at top
        // if all the fresh oranges are rottened then only return time otherwise -1

        return freshOrange == 0 ? time : -1
    }
}
