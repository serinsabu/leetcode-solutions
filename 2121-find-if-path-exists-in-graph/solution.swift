class Solution {
    func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        var list = [Int: [Int]]()

        for edge in edges {
            let u = edge[0]
            let v = edge[1]

            list[u, default:[]].append(v)
            list[v, default:[]].append(u)
        }

        var visited = Set<Int>()
        //BFS - Queue
        var q = [Int]()
        q.append(source)
        visited.insert(source)

        var front = 0

        while front < q.count {
            var node = q[front]
            front += 1
            if node == destination {
                return true
            }

            for child in list[node, default:[]] {
                // if it is present in the q, it means the node is visited
                if !visited.contains(child) {
                    visited.insert(child)
                    q.append(child)
                }
            }
        }
        return false
    }
}
