
class MedianFinder {
    var minHeap = Heap<Int>()
    var maxHeap = Heap<Int>()
    init() {
        
    }
    
    func addNum(_ num: Int) {
        // always insert into maxheap
        maxHeap.insert(num)

        // normally add into minheap
        let val = maxHeap.popMax()!
        minHeap.insert(val)

        //balance
        if minHeap.count > maxHeap.count {
            let val = minHeap.popMin()!
            maxHeap.insert(val)
        }
    }
    
    func findMedian() -> Double {
        // even
        if((minHeap.count + maxHeap.count)%2 == 0) {
            return Double(minHeap.min! + maxHeap.max!)/2
        } else {
            return Double(maxHeap.max!)
        }
    }
}

/**
 * Your MedianFinder object will be instantiated and called as such:
 * let obj = MedianFinder()
 * obj.addNum(num)
 * let ret_2: Double = obj.findMedian()
 */
