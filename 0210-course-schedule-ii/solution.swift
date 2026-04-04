class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var adjList = [Int:[Int]]()
        var indegree = Array(repeating:0, count: numCourses)

        for prerequisite in prerequisites {
            let u = prerequisite[0]
            let v = prerequisite[1]

            // edges coming to node
            indegree[u] += 1
            adjList[v, default:[]].append(u)
        }

        var queue = [Int]()
        for i in 0..<numCourses {
            if indegree[i] == 0 {
                // any order
                queue.append(i)
            }
        }

        var order = [Int]()
        var front = 0
        while front < queue.count {
            let course = queue[front]
            front += 1
            order.append(course)

            //child -> dependant on course
            for child in adjList[course, default:[]] {
                indegree[child] -= 1
                if indegree[child] == 0 {
                    queue.append(child)
                }
            }
        }
    return order.count == numCourses ? order : []
    }
}
