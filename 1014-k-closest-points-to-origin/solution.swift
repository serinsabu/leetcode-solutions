class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var points = points
        var m = points.count
        var n = points[0].count
        var maxHeap = [(Int, Int, Int)]()  // (dist, x, y)

        // var ans = Array(repeating: Array(repeating: 0, count: m), count: n)
        var ans = [[Int]]()

        for point in points {
            let x = point[0]
            let y = point[1]

            var dist = (x*x) + (y*y)
            maxHeap.append((dist, x, y))

            // sort maxheap by max distance
            maxHeap.sort{ $0.0 > $1.0 }

            if maxHeap.count > k {
                maxHeap.removeFirst()
            }
        }

        for(_,x,y) in maxHeap {
            ans.append([x,y])
        }
    return ans
    }
}

