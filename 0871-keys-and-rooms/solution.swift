class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var visited = Set<Int>()
        // start with 0
        visited.insert(0)
        dfs(0)

        // rooms[node] => no need adj list, directly it gives 0,1,2...
        func dfs(_ node: Int) {
            for child in rooms[node] {
                if !visited.contains(child) {
                    visited.insert(child)
                    dfs(child)
                } 
            }
        }
        // if all rooms are visited then true else false
        return visited.count == rooms.count
    }
}
