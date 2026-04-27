class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        // heaviest two stones, max of stones
        //[8,7,4,2,1,1]
        //[4,2,1,1,1]
        //[2,1,1,1]
        //[1,1,1]
        //[1]

        // both are of same data type [Int], so directly assign
        var maxHeap = stones
        // sort maxheap by heavy stone
        maxHeap.sort{ $0 > $1 }

        while maxHeap.count > 1 {
            let f = maxHeap.removeFirst()
            let s = maxHeap.removeFirst()

            // f == s, do nothing , distroy both x and y 
            if f != s {
                // destroy x and replace y with y-x
                maxHeap.append(f-s)
                // sort again after insert maxheap by heavy stone
                maxHeap.sort{ $0 > $1 }
            }
        }
        // maxheap gives array [1], we need to return only element present
    return maxHeap.first ?? 0    
    }
}
