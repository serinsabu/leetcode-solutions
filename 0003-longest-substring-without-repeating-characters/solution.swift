class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var map = [Character: Int]()
        var i=0
        var j=0
        var n=s.count
        var chars = Array(s)
        var ans = 0

        while j < n {
            map[chars[j], default: 0] += 1 //a-1,b-1,c-1
            
            // Shrink the window from the left until the duplicate is removed.
            while map[chars[j], default: 0] > 1 {
                map[chars[i], default: 0] -= 1
                i += 1
            }
            ans = max(ans, j-i+1)//3
            j += 1   
        }
        return ans
    }
}
