class TrieNode {
    var child = [Character: TrieNode]()
    var isEndOfWord = false
}

class Trie {
    var root = TrieNode()
    init() {
        
    }
    
    func insert(_ word: String) {
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
        var curr = root
        for ch in word {
            if curr.child[ch] != nil {
                curr = curr.child[ch]!
            } else {
                return false
            }
        }
        return curr.isEndOfWord
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var curr = root
        for ch in prefix {
            if curr.child[ch] == nil {
                return false
            }
            curr = curr.child[ch]!
        }
        return true
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */
