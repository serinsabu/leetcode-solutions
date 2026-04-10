class Solution {
    func minimumDistance(_ nums: [Int]) -> Int {
        var n = nums.count
        var dict: [Int: [Int]] = [:]

        for i in 0..<n {
            dict[nums[i], default: []].append(i)
        }
        
        var ans = Int.max
        for indices in dict.values where indices.count >= 3 {
            //|i - j| + |j - k| + |k - i|
            //|i - j| = j - i  
            // |j - k| = k - j  
            // |k - i| = k - i  
            // (j - i) + (k - j) + (k - i) => 2*(k-i) => Distance = 2 × (maxIndex - minIndex)
            for i in 1..<indices.count-1 {
                //indices[2] - indices[0] => next - prev * 2
                let dist = (indices[i+1] - indices[i-1]) * 2
                // 200 => just a max value 
                ans = min(ans, dist)
            }
        }
        return ans == Int.max ? -1 : ans
    }
}
