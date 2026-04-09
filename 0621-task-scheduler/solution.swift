class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        // Pick task with max frequency
        var dict = [Character: Int]()
        var maxHeap = MaxHeap()
        // Minimize total time
        var tasks = tasks
        var time = 0
        var n = n
        var cooldown = [(count: Int, time: Int)]()

        for i in 0..<tasks.count {
            // Count frequency of tasks
            dict[tasks[i], default: 0] += 1
        }

        // Put all tasks frequency count into max heap
        for (_, count) in dict {
            maxHeap.push(count)
        }

        while !maxHeap.isEmpty || !cooldown.isEmpty {
            time += 1

            // 1. Move ready tasks first
            if !cooldown.isEmpty && cooldown[0].time == time {
                maxHeap.push(cooldown.removeFirst().count)
            }

            // 2. Run task
            if !maxHeap.isEmpty {
                // pick most frequent task
                var count = maxHeap.pop()!
                // decrease its count
                count -= 1

                // if still remaining:
                if count > 0 {
                    cooldown.append((count, time + n + 1))
                }
            }
        }
        return time
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


