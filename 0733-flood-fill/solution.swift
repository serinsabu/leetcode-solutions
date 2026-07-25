class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        var image = image
        var m = image.count
        var n = image[0].count
        var ans = [[Int]]()
        let original = image[sr][sc]

        if original == color {
            return image
        }
        
        dfs(sr,sc)

        func dfs(_ row: Int, _ col: Int) {
            if row < 0 || row >= m || col < 0 || col >= n {
                return 
            }
            // if current cell is not original, already visited - skip
            // am i a different color
            if image[row][col] != original {
                return 
            }
            // mark with new color
            image[row][col] = color
            // move 4 directions for image[row][col] = 1 and change color
            dfs(row+1, col)
            dfs(row-1, col)
            dfs(row, col+1)
            dfs(row, col-1)
        }
        return image
    }
}
