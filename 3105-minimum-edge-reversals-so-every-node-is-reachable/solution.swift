class Solution {
    func minEdgeReversals(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var adjList = [Int:[(Int, Int)]]()

        for edge in edges {
            let u = edge[0]
            let v = edge[1]

            adjList[u, default:[]].append((v,0))
            adjList[v, default:[]].append((u,1))
        }

        var totalCost = 0
        // u => node, p => parent
        // First DFS: calculate cost for root (0)
        func dfs1(_ u: Int, _ p: Int) {
            for (node, cost) in adjList[u, default:[]] {
                if node == p { continue }
                totalCost += cost
                dfs1(node, u)
            }
            
        }

        var ans = Array(repeating: 0, count: n)
        // Second DFS: rerooting
        func dfs2(_ u: Int, _ p: Int, _ totalCost: Int) {
            ans[u] = totalCost
            for (node, cost) in adjList[u, default:[]] {
                if node == p { continue }
                // re routing
                let newCost = cost == 0 ? totalCost + 1 : totalCost - 1
                dfs2(node, u, newCost)
            }
        }
        dfs1(0, -1)
        dfs2(0, -1, totalCost)
        return ans
    }
}
