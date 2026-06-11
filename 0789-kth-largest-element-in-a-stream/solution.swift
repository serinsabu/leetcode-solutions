
class KthLargest {
    var heap: Heap<Int>
    var k = 0
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        heap = Heap(nums)
    }
    
    func add(_ val: Int) -> Int {
        heap.insert(val)
        while heap.count > k {
            heap.popMin()
        }
        return heap.min ?? -1
    }
}

/**
 * Your KthLargest object will be instantiated and called as such:
 * let obj = KthLargest(k, nums)
 * let ret_1: Int = obj.add(val)
 */
