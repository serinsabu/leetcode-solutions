class Solution {
    func rearrangeBarcodes(_ barcodes: [Int]) -> [Int] {
        var n = barcodes.count
        var maxHeap = MaxHeap()
        // Frequency map
        var map = [Int: Int]()
        for barcode in barcodes {
            map[barcode, default: 0] += 1
        }
        for (key, value) in map {
            maxHeap.push((num: key, freq: value))
        }

        var ans = [Int]()
        var prev: (num: Int, freq: Int)?
        while !maxHeap.isEmpty {
            var current = maxHeap.pop()!//1:2
            var currNum = current.num
            var currFreq = current.freq

            ans.append(currNum)//[1,2]
            currFreq -= 1
            current = (num: currNum, freq: currFreq)//2:2

            // wait for one turn 
            if let previous = prev, previous.freq > 0 {
                maxHeap.push(previous)//
            }
            // store and keep aside
            prev = current
        }

        // maxheap is empty but previous has value left 1:1, dont do anything 
        if maxHeap.isEmpty, let previous = prev, previous.freq > 0 {
            return []
        }
        return ans
    }
}

struct MaxHeap {
    private var heap: [(num: Int, freq: Int)] = []

    var isEmpty: Bool {
        return heap.isEmpty
    }

    mutating func push(_ element: (num: Int, freq: Int)) {
        heap.append(element)
        shiftUp(heap.count - 1)
    }

    mutating func pop() -> (num: Int, freq: Int)? {
        guard !heap.isEmpty else {
            return nil
        }

        heap.swapAt(0, heap.count - 1)
        let element = heap.removeLast()
        shiftDown(0)

        return element
    }

    mutating func peek() -> (num: Int, freq: Int)? {
        return heap.first
    }

    private mutating func shiftUp(_ i: Int) {
        var child = i
        var parent = (i - 1) / 2

        while child > 0, heap[child].freq > heap[parent].freq {
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

            if left < heap.count, heap[left].freq > heap[largest].freq {
                largest = left
            }

            if right < heap.count, heap[right].freq > heap[largest].freq {
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
