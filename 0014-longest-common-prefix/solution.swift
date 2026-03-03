class TrieNode {
    var child = [Character: TrieNode]()
    var isEnd = false
}

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var ans = ""
        var root = TrieNode()

        //insert all words
        for word in strs {
            var curr = root
            for ch in word {
                if curr.child[ch] == nil {
                    curr.child[ch] = TrieNode()
                }
                curr = curr.child[ch]!
            }
            curr.isEnd = true
        }

        var curr = root
        while curr.child.count == 1 && !curr.isEnd {
            let key = curr.child.keys.first!
            ans.append(key)
            curr = curr.child[key]!
        }
        return ans
    }
}
