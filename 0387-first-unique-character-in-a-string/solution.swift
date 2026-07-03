class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var dict = [Character: Int]()
        // count characters
        for ch in s {
            dict[ch, default:0] += 1
        }
        //l-1,e-3,t-1,c-1
        var chars = Array(s)
        // traverse original string
        for i in 0..<s.count {
            if dict[chars[i]] == 1 {
                return i
            }
        }
        return -1
    }
}
/*
        1. Input s = "leetcode"
        2. Output 0
        3. Return Type Int
        4. What information do I need to remember? previously seen characters
        5. State Variable Dictionary<Character,Int>
        6. Pattern frequency counting
        7. Data Structure Dictionary<Character,Int>
*/
