class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = [[Int]: [String]]()
        for word in strs {
            var freq = Array(repeating: 0, count: 26)
            for ch in word {
                let index = Int(ch.asciiValue! - Character("a").asciiValue!)// word = "eat" 
                // e => 101-97=4, a => 97-97=0, t => 116-97=19
                freq[index] += 1//freq[4] += 1, freq[0] += 1, freq[19] += 1
            }
            dict[freq, default:[]].append(word)
            //[1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0] -> eat, so on..
        }
        return Array(dict.values)
    }
}
