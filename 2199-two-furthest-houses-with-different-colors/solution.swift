class Solution {
    func maxDistance(_ colors: [Int]) -> Int {
        var n = colors.count
        var maxDist = Int.min
        // Max distance + condition → Greedy observation
        // Max distance comes from edges
        // If they are different → answer = n-1
        //  If same → try:
        // leftmost vs farthest different  
        // rightmost vs farthest different
        for i in 0..<n {
            if colors[i] != colors[0] {
                maxDist = max(maxDist, i)
            } 
            if colors[i] != colors[n-1] {
                maxDist = max(maxDist, n-i-1)
            }
        }
        return maxDist
    }
}
