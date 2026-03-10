class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        // [[1,1,0],
        //  [1,1,0],
        //  [0,0,1]]
        // 0->{0,1}, 1->{0,1}, 2->{2}
        var n = isConnected.count
        var count = 0
        var visited = Set<Int>() // to track which cities we have already visited
    
        for i in 0..<n {
            // If city i has not been visited yet,
            // it means we found a new province
            if !visited.contains(i) {
                count += 1
                dfs(i) // explore all cities connected to this city
            }
        }

        // DFS function to visit all cities connected to the current city
        func dfs(_ node: Int) {
            // Mark this city as visited
            visited.insert(node)
            // Check all other cities to see if they are connected to this one
            for j in 0..<n {
                // If there is a connection AND that city has not been visited yet
                if isConnected[node][j] == 1 && !visited.contains(j) {
                    // Visit that city as well (continue DFS)
                    dfs(j)
                }
            }
        }
        // After exploring all cities, count will equal the number of provinces
        return count
    }
}
