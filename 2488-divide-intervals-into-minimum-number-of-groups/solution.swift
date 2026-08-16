class Solution {
    func minGroups(_ intervals: [[Int]]) -> Int {
        // sort by start times
        let sorted = intervals.sorted { $0[0] < $1[0] } 
        var heap = MinHeap()
        // [[1, 5], [1, 10], [2, 3], [5, 10], [6, 8]]
        // Two intervals can be in the same group only if the first one ends before the second one starts.
        // 1.........5 - gp-1
        // 1................10 - gp-2
        // ..2....3 - gp-3
        // ..........5......10 - gp-3
        // ............6..8 -gp-1
        // compare end times
        for i in 0..<sorted.count  {
            var start = sorted[i][0]//6
            var end = sorted[i][1]//8
            if !heap.isEmpty && heap.peek()! < start {
                heap.pop()
            }
            heap.push(end)//[10]
        }
        return heap.count
    }
}

struct MinHeap {
    private var heap: [Int] = []

    var isEmpty: Bool {
        return heap.isEmpty
    }

    var count: Int {
        heap.count
    }

    mutating func push(_ element: Int) {
        heap.append(element)
        shiftUp(heap.count - 1)
    }

    mutating func pop() -> Int? {
        guard !heap.isEmpty else {
            return nil
        }

        heap.swapAt(0, heap.count - 1)
        let element = heap.removeLast()
        shiftDown(0)

        return element
    }

    mutating func peek() -> Int? {
        return heap.first
    }

    private mutating func shiftUp(_ i: Int) {
        var child = i
        var parent = (i - 1) / 2

        while child > 0, heap[child] < heap[parent] {
            heap.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }

    private mutating func shiftDown(_ i: Int) {
        var parent = i

        while true {
            var smallest = parent
            let left = 2 * parent + 1
            let right = 2 * parent + 2

            if left < heap.count, heap[left] < heap[smallest] {
                smallest = left
            }

            if right < heap.count, heap[right] < heap[smallest] {
                smallest = right
            }

            if parent == smallest {
                break
            }

            heap.swapAt(parent, smallest)
            parent = smallest
        }
    }
}
