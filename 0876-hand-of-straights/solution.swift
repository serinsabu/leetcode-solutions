class Solution {
    func isNStraightHand(_ hand: [Int], _ groupSize: Int) -> Bool {
        var minHeap = Heap<Int>()
        var map = [Int: Int]()

        for num in hand {
            map[num, default: 0] += 1
        }

        for num in map.keys {
            minHeap.insert(num)
        }
        // print(minHeap)
        while !minHeap.isEmpty {
            let start = minHeap.min!//1
            // need 1,2,3
            for num in start..<start+groupSize {
                // if [1,2,4], => 3 does not exist, so return false right away
                guard let freq = map[num], freq > 0 else {
                    return false
                }
                // [1:1,2:2,3:2] => reduce freq of 1,2,3
                map[num]! -= 1//[1:0,2:1,3:1]
                // remove from heap and map if freq == 0
                if map[num] == 0 {
                    // You should only remove from heap when frequency becomes 0 after 
                    // decrementing, and only if that number is currently at the top:
                    if num != minHeap.min! {
                        return false
                    }
                    minHeap.popMin()!//1
                    map.removeValue(forKey: num)
                }
            }
        }
    return true
    }
}

