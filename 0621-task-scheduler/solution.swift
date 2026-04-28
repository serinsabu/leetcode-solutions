class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var maxTasks = [Character: Int]()
        var maxHeap = MaxHeap()
        for i in tasks {
            maxTasks[i, default: 0] += 1
        }

        for freq in maxTasks {
            maxHeap.push(freq.value)
        }
        var time = 0
        var cooldown = [(count: Int, time: Int)]()

        while !maxHeap.isEmpty || !cooldown.isEmpty {
            time += 1   

            // cooldown has the remaining time and count
            // process all the tasks
            if !cooldown.isEmpty {
                //Is there a task in the cooldown queue whose available_time is equal to the current time?
                var remTime = cooldown[0].time
                // If yes, pop it from the queue and push it back into the Max-Heap.
                if remTime == time {
                    // push the remaining count
                    maxHeap.push(cooldown.removeFirst().count)
                }
            }

            // run task
            if !maxHeap.isEmpty {
                var count = maxHeap.pop()!
                count -= 1
                if count > 0 {
                    cooldown.append((count, n + 1 + time))
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
