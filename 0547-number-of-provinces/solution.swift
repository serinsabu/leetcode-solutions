class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        var n = isConnected.count
        var count = 0
        var visited = Array(repeating: false, count: n)

        //traverse each col [1,1,0]
        for city in 0..<n {
            if !visited[city] {
                dfs(city)
                count += 1
            }
        }

        func dfs(_ i: Int) {
            visited[i] = true

            // traverse all the neighbours
            for neighbour in 0..<n {
                if !visited[neighbour] && isConnected[i][neighbour] == 1 {
                    dfs(neighbour)
                }
            }
        }
        return count
    }
}
