class Solution {
    func minGroups(_ intervals: [[Int]]) -> Int {
        // sort intervals by start times
        let sorted = intervals.sorted { $0[0] < $1[0] }

        // Create a Min Heap that stores only end times.
        var heap = MinHeap()

        // The heap starts empty because groups are created as we process intervals, not beforehand.
        for i in 0..<sorted.count {
            var start = sorted[i][0]
            var end = sorted[i][1]
            // * remove the smallest end time (pop)
            // * because that group is now free
            if !heap.isEmpty && start > heap.peek()! {
                heap.pop()
            }
            // Then, regardless, insert the current interval’s end time:
            // Because this interval is now occupying that group until end.
            heap.push(end)
        }
        return heap.count // because every element in the heap represents one active group.
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
