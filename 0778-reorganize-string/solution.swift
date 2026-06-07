class Solution {
    func reorganizeString(_ s: String) -> String {
        var map = [Character: Int]()
        var maxHeap = MaxHeap()

        for ch in Array(s) {
            map[ch, default: 0] += 1
        }

        // 1. Pop highest frequency character.
        // 2. Add it to result.
        // 3. Decrease its count.
        // 4. Keep it aside for ONE turn.
        // 5. Reinsert previous character if it still has remaining count.
        //a-2, b-1
        for (ch, count) in map {
            maxHeap.push((char: ch, freq: count))
        }
        
        var res = ""
        var prev: (char: Character, freq: Int)?
        while !maxHeap.isEmpty {
            var current = maxHeap.pop()!//a-2,b-1
            var maxChar = current.char//a
            var maxCount = current.freq//2
            res.append(maxChar)//"a"
            maxCount -= 1//1
            current = (char: maxChar, freq: maxCount)
            if let previous = prev, previous.freq > 0  {
                maxHeap.push(previous)//a-1,b-1
            }
            prev = current
        }
        if maxHeap.isEmpty, let previous = prev, previous.freq > 0 {
            return ""
        }
        return res
    }
}

struct MaxHeap {
    private var heap: [(char: Character, freq: Int)] = []

    var isEmpty: Bool {
        return heap.isEmpty
    }

    mutating func push(_ element: (char: Character, freq: Int)) {
        heap.append(element)
        shiftUp(heap.count - 1)
    }

    mutating func pop() -> (char: Character, freq: Int)? {
        guard !heap.isEmpty else {
            return nil
        }

        heap.swapAt(0, heap.count - 1)
        let element = heap.removeLast()
        shiftDown(0)

        return element
    }

    mutating func peek() -> (char: Character, freq: Int)? {
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
