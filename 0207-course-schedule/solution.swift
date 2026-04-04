class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        //0->1
        var adjList = [Int:[Int]]()

        for prerequisite in prerequisites {
            let u = prerequisite[0]
            let v = prerequisite[1]

            adjList[u, default: []].append(v)
        }
        var visited = Array(repeating:0, count: numCourses)

        func dfs(_ node: Int) -> Bool {
            // paritally visited
            if visited[node] == 1 {
                return true
            }
            // fully visited - NOT FOUND A CYCLE
            if visited[node] == 2 {
                return false
            }
            // visiting this node
            visited[node] = 1
            for neighbour in adjList[node, default:[]] {
                if dfs(neighbour) {
                    return true
                }
            }
            // completely visited - NO CYCLE
            visited[node] = 2
            return false
        }

        for i in 0..<numCourses {
            if visited[i] == 0 {
                if dfs(i) {
                    return false
                } 
            }
        }
    return true
    }
}
