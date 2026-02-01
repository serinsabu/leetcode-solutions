
class MedianFinder {
    var minHeap = PriorityQueue<Int>(sort: <)
    var maxHeap = PriorityQueue<Int>(sort: >)
    init() {
        
    }
    
    func addNum(_ num: Int) {
        if maxHeap.isEmpty || num <= maxHeap.peek()! {
            maxHeap.enqueue(num)
        } else {
            minHeap.enqueue(num)
        }
        if maxHeap.count > minHeap.count+1 {
            // break - maxHeap.count should be max(minHeap.count + 1)
            minHeap.enqueue(maxHeap.dequeue()!)
        } else if minHeap.count > maxHeap.count {
            maxHeap.enqueue(minHeap.dequeue()!)
        }
    }
    
    func findMedian() -> Double {
        if maxHeap.count == minHeap.count {
            // even
            return (Double(maxHeap.peek()!) + Double(minHeap.peek()!))/2.0
        } else {
            // odd
            return Double(maxHeap.peek()!)
        }
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
/**
 * Your MedianFinder object will be instantiated and called as such:
 * let obj = MedianFinder()
 * obj.addNum(num)
 * let ret_2: Double = obj.findMedian()
 */
