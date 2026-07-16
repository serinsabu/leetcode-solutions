class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var str = ""
        var dict = [String: [String]]()
        for word in strs {
            let sortedW = String(word.sorted { $0 < $1 })
            dict[sortedW, default: []].append(word)
        }
        return Array((dict.values))
    }
}
