struct Pair: Comparable {
    let i: Int
    let j: Int
    let sum: Int

    static func < (lhs: Pair, rhs: Pair) -> Bool {
        return lhs.sum < rhs.sum
    }
}
class Solution {
    func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
        var minHeap = PriorityQueue<Pair>(sort: <)
        var result:[[Int]] = []
        var m = nums1.count
        var n = nums2.count

        for i in 0..<min(m, k) {
            minHeap.enqueue(Pair(i: i, j: 0, sum: nums1[i]+nums2[0]))
        }
        var remaining = k
        while(remaining > 0 && !minHeap.isEmpty) {
            var pair = minHeap.dequeue()!
            result.append([nums1[pair.i], nums2[pair.j]])
            remaining -= 1
            if pair.j + 1 < n {
                minHeap.enqueue(Pair(
                    i: pair.i, j: pair.j+1, sum: nums1[pair.i]+nums2[pair.j + 1]
                    )
                )
            }
        }
        return result
    }
}
// Priority Queue Implementation
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
