/*
“Which existing group becomes free first?”
[1,5] [2,3] [4,6] [7,8]

1. Process [1,5]
There are no groups yet.
So we create the first group, and it is occupied until 5.
Heap = [5]

Meaning:
Group 1 is busy until time 5.

2. Process [2,3]
The earliest any group becomes free is 5.
But this interval starts at 2: 2 <= 5
So it overlaps with the interval already in Group 1. We cannot reuse that group.
Therefore, we need a new group.

Meaning:
One group is busy until 3, and another is busy until 5.
So currently we need 2 groups.

3. Process [4,6]
Look at the smallest end time: 3.
The new interval starts at 4: 4 > 3

So the group that was occupied until 3 is now free.
We remove 3: [3,5] → [5]

Then put [4,6] into that same group. That group is now occupied until 6:
Heap = [5,6]
We didn’t create a new group. We reused the old group.
So we still need 2 groups.

4. Process [7,8]
The earliest group becomes free at 5.
The new interval starts at 7: 7 > 5
So that group is free.
Remove 5 and reuse that group until 8: [5,6] → [6,8]
Still only 2 groups.

If new start > earliest ending group
    → that group is free
    → pop it and reuse it
Then
    → push current end

So the heap doesn’t store the intervals. It stores:
the end time of each currently existing group.
And the final answer is the maximum number of groups needed — here, 2.
*/


class Solution {
    func minGroups(_ intervals: [[Int]]) -> Int {
        // sort intervals by start times
        let sorted = intervals.sorted { $0[0] < $1[0] }

        // Create a Min Heap that stores only end times.
        var heap = MinHeap()

        // The heap starts empty because groups are created as we process intervals, not beforehand.
        for i in 0..<sorted.count {
            var start = sorted[i][0]//7
            var end = sorted[i][1]//8
            // * remove the smallest end time (pop)
            // * because that group is now free
            if !heap.isEmpty && start > heap.peek()! {
                heap.pop()
            }
            // Then, regardless, insert the current interval’s end time:
            // Because this interval is now occupying that group until end.
            heap.push(end)//[6,8]
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
