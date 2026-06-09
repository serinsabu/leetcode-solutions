class Solution {
    func maxTotalValue(_ nums: [Int], _ k: Int) -> Int {
        var n = nums.count
        var sum = 0
        
        return (nums.max()! - nums.min()!)*k
    }
}

struct MaxHeap {
    private var heap: [Int] = []

    var isEmpty: Bool {
        return heap.isEmpty
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

        while child > 0, heap[child] > heap[parent] {
            heap.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }

    private mutating func shiftDown(_ i: Int) {
        var parent = i

        while true {
            var largest = parent
            let left = 2 * parent + 1
            let right = 2 * parent + 2

            if left < heap.count, heap[left] > heap[largest] {
                largest = left
            }

            if right < heap.count, heap[right] > heap[largest] {
                largest = right
            }

            if parent == largest {
                break
            }

            heap.swapAt(parent, largest)
            parent = largest
        }
    }
}
