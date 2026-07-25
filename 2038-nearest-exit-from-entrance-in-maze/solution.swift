class Solution {
    func nearestExit(_ maze: [[Character]], _ entrance: [Int]) -> Int {
        var maze = maze
        var m = maze.count
        var n = maze[0].count
        // start with this
        var queue = [(entrance[0], entrance[1])]
        // make it wall, because as per the question, The entrance does not count as an exit.
        maze[entrance[0]][entrance[1]] = "+"
        var dirs = [(0,1), (0,-1), (1,0), (-1,0)]
        var steps = 0

        while !queue.isEmpty {
            let size = queue.count

            for i in 0..<size {
                let (row, col) = queue.removeFirst()

                // 4 directions
                for (x,y) in dirs {
                    let newX = x + row
                    let newY = y + col

                    guard newX >= 0, newX < m, newY >= 0, newY < n else {
                        continue
                    }
                    guard maze[newX][newY] == "." else {
                        continue
                    }
                    // reached exit - border
                    if newX == 0 || newX == m-1 || newY == 0 || newY == n-1 {
                        return steps + 1
                    }
                    maze[newX][newY] = "+"
                    queue.append((newX, newY))
                }
            }
            if !queue.isEmpty {
                steps += 1
            }
        }
        return -1
    }
}
