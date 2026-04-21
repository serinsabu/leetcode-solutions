class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        // count magazine characters
        var map1 = [Character: Int]()
        //{b-1}
        for ch in Array(magazine) {
            map1[ch, default: 0] += 1
        }

        var map2 = [Character: Int]()
        //{a-2}
        for ch in Array(ransomNote) {
            map2[ch, default: 0] += 1
        }

        for ch in Array(ransomNote) {
            if let j = map1[ch] {
                if map1[ch] == 1 {
                    map1.removeValue(forKey: ch)
                } else {
                    map1[ch]! -= 1
                }
            } else {
                return false
            }
        }
        
        return true
    }
}
