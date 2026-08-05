class Solution {
    func remainingMethods(_ n: Int, _ k: Int, _ invocations: [[Int]]) -> [Int] {
        var adj = [Int: [Int]]()

        for invocation in invocations {
            let u = invocation[0]
            let v = invocation[1]
            // a->b directed graph
            adj[u, default:[]].append(v)
        }

        var visited = Set<Int>()
        func bfs() {
            var queue = [k]
            visited.insert(k)
            while !queue.isEmpty {
                let node = queue.removeFirst()

                for next in adj[node] ?? [] {
                    if !visited.contains(next) {
                        visited.insert(next)
                        queue.append(next)
                    }
                }
            }
        }
        // visited contains all the suspicious methods. after bfs
        bfs()
        var ans = [Int]()
        for invocation in invocations {
            let u = invocation[0]
            let v = invocation[1]

            // if check u not in suspicious and v in suspicious, cannot remove,
            // return all methods
            if !visited.contains(u) && visited.contains(v) {
                return Array(0..<n)
            }
        }

        // otherwise return every method not in the suspicious set. 
        // Inside → Inside , no outside node is attached to inside node, so remove
        // build the answer
        // For every method in the project, if it is not suspicious, keep it.
        for method in 0..<n {
            if !visited.contains(method) {
                ans.append(method)
            }
        }
        return ans
    }
}

/*
Build graph
      ↓
DFS from k
      ↓
visited = suspicious
      ↓
For every edge

outside ---> inside ?
YES
    return all methods
NO
    return every method NOT in visited
*/
