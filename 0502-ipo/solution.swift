import Collections

/*Step 1- GIven, Initial capital = w
                    You can do at most k projects
                    Each project:
                        needs capital[i]
                        gives profit[i]
            Goal:Maximize final capital
            
        Step 2 - You CANNOT pick any project anytime
                 You can only pick projects you can AFFORD i.e capital[i] ≤ current capital

        Ask:
        Step 3 - Among all projects I can currently afford,
                 which one should I pick? 
        
        Answer: Pick the project with MAX profit - USE MAX HEAP
            Because - More profit → more capital → unlocks more projects
            Greedy decision - “Pick best available option at each step”

            Sort projects by capital
            i = 0
            Repeat k times:
                1. Add all projects you can afford into max heap
                (capital[i] ≤ current capital)
                2. If heap is empty → break (no projects possible)
                3. Pick project with max profit
                4. Add profit to capital
                5. Continue
        */

class Solution {
    func findMaximizedCapital(_ k: Int, _ w: Int, _ profits: [Int], _ capital: [Int]) -> Int {
        // Idea: Pick most profitable project within capital
        // create prjects first - MAX HEAP
        let projects = zip(capital, profits).map { ($0,$1) }
        let sortedProjects = projects.sorted { $0.0 < $1.0 } // $0.0 → capital, $0.1 → profit
        //$0.0 → capital of first project  $0.1 → profit of first project  
        //$1.0 → capital of second project  $1.1 → profit of second project  
        var maxHeap = MaxHeap()
        var n = sortedProjects.count
        var i = 0
        var currentCapital = w
        var distinctProj = k

        // AVOID TLE by removing the maxheap.sort(by: >) from the loop 
        // use maxheap struct
        while distinctProj > 0 {
            // Add all projects you can afford into max heap
            while i < n && sortedProjects[i].0 <= currentCapital {
                var profit = sortedProjects[i].1
                maxHeap.push(profit)
                i += 1
            }
            if maxHeap.isEmpty {
                break
            } 
            
            // Pick project with max profit
            if let profit =  maxHeap.pop() {
                // Add profit to capital
                currentCapital += profit
            }
            distinctProj -= 1
        }
    return currentCapital
    }
}

struct MaxHeap {
    var heap = [Int]()
    
    mutating func push(_ val: Int) {
        heap.append(val)
        siftUp(heap.count - 1)
    }
    
    mutating func pop() -> Int? {
        guard !heap.isEmpty else { return nil }
        heap.swapAt(0, heap.count - 1)
        let val = heap.removeLast()
        siftDown(0)
        return val
    }
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    mutating func siftUp(_ i: Int) {
        var child = i
        var parent = (child - 1) / 2
        
        while child > 0 && heap[child] > heap[parent] {
            heap.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
    
    mutating func siftDown(_ i: Int) {
        var parent = i
        
        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var largest = parent
            
            if left < heap.count && heap[left] > heap[largest] {
                largest = left
            }
            if right < heap.count && heap[right] > heap[largest] {
                largest = right
            }
            
            if largest == parent { break }
            
            heap.swapAt(parent, largest)
            parent = largest
        }
    }
}
