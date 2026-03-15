struct Node: Comparable {
    var ind: Int
    var cost: Int

    static func <(lhs: Node, rhs: Node) -> Bool {
        return lhs.cost < rhs.cost
    }
}
class Solution {
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        var dist = Array(repeating:Int.max, count:n+1)
        var pq = PriorityQueue<Node>(sort: <)
        //source
        dist[k] = 0
        //adj list of (u,(v,w))
        var adjList = [Int:[(Int,Int)]]()

        for time in times {
            let u = time[0]
            let v = time[1]
            let w = time[2]

            //directed
            adjList[u, default:[]].append((v,w))
        }
        //fill pq with 
        pq.enqueue(Node(ind:k, cost:0))

        while !pq.isEmpty {
            guard let node = pq.dequeue() else { continue }
            let u = node.ind
            let currCost = node.cost

            //relaxation
            if currCost > dist[u] {
                continue
            }
            //iterate neighbours
            for (v,cost) in adjList[u, default:[]] {
                var newCost = currCost + cost
                if newCost < dist[v] {
                    dist[v] = newCost
                    pq.enqueue(Node(ind:v, cost:newCost))
                }
            }
        }

        let maxVal = dist[1...].max() ?? Int.max
        return maxVal == Int.max ? -1 : maxVal
    }
}

struct PriorityQueue<T: Comparable> {
    private var elements: [T] = []
    private let sort: (T, T) -> Bool

    init(sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }

    var count: Int {
        return elements.count
    }

    var isEmpty: Bool {
        return elements.isEmpty
    }

    func peek() -> T? {
        return elements.first
    }

    mutating func enqueue(_ element: T) {
        elements.append(element)
        siftUp(from: elements.count - 1)
    }

    mutating func dequeue() -> T? {
        guard !elements.isEmpty else { return nil }
        elements.swapAt(0, elements.count - 1)
        let removed = elements.removeLast()
        siftDown(from: 0)
        return removed
    }

    mutating func remove(_ value: T) {
        if let index = elements.firstIndex(of:  value) {
          elements.swapAt(index, elements.count - 1)
          elements.removeLast()
          if index < elements.count {
                siftUp(from: index)
                siftDown(from: index)
            }
        }
    }

    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = (child - 1) / 2
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }

    private mutating func siftDown(from index: Int) {
        var parent = index
        let count = elements.count
        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var candidate = parent

            if left < count && sort(elements[left], elements[candidate]) {
                candidate = left
            }
            if right < count && sort(elements[right], elements[candidate]) {
                candidate = right
            }
            if candidate == parent {
                return
            }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
}
