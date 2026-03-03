class TrieNode {
    var child = [Character: TrieNode]()
    /*
        Reason for adding isEnd
        If you add "bad"
        and search "ba"

        Your code will return true ❌
        But it should return false.
    */
    var isEndOfWord = false
}
class WordDictionary {
    var root = TrieNode()
    init() {
        
    }
    
    func addWord(_ word: String) {
        var curr = root
        for ch in word {
            if curr.child[ch] == nil {
                curr.child[ch] = TrieNode()
            }
            curr = curr.child[ch]!
        }
        curr.isEndOfWord = true
    }
    
    func search(_ word: String) -> Bool {
        dfs(0, Array(word), root)
    }

    func dfs(_ index: Int, _ word:[Character], _ curr: TrieNode) -> Bool {
        if index == word.count { return curr.isEndOfWord }
        let char = word[index]
            if(char == ".") {
                // try all possible children recursively
                // ex: for b.d -> try bad , bod, bxd, etcetera
                for ch in curr.child.keys {
                    if curr.child[ch] != nil && dfs(index+1, word, curr.child[ch]!) {
                        return true
                    }
                }
            } else {
                // normal trie search
                return curr.child[char] != nil && dfs(index+1, word, curr.child[char]!)
            }
        return false
    }
}

/**
 * Your WordDictionary object will be instantiated and called as such:
 * let obj = WordDictionary()
 * obj.addWord(word)
 * let ret_2: Bool = obj.search(word)
 */
