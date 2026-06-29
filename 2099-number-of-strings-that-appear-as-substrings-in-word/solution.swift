class Solution {
    func numOfStrings(_ patterns: [String], _ word: String) -> Int {
        return patterns.count { word.contains($0) }
    }
}
