/*
1. key → node
2. frequency → DLL
3. minFreq
*/
// Why do we store key inside the node?
// Because when the cache is full, we remove the LFU + LRU node:
class Node {
    var key: Int
    var val: Int
    var freq: Int

    var prev: Node?
    var next: Node?
    
    init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
        self.freq = 1
    }
}

// So our rule will be:
// * Add a newly used node near tail → it becomes MRU.
// * Remove the node after head → that’s the LRU node.

class DoublyLinkedList {
    let head: Node
    let tail: Node

    init() {
        head = Node(-1,-1)
        tail = Node(-1,-1)

        head.next = tail
        tail.prev = head
    }

        // How do we know if the list is empty? => means there are no real nodes.
        var isEmpty: Bool {
            return head.next === tail
        }

        // head ↔ A ↔ B ↔ tail
        // head ↔ A ↔ B <-> X <-> tail
        func insert(_ node: Node) {
            //node=x
            let prevNode = tail.prev!
            node.prev = prevNode
            node.next = tail

            prevNode.next = node
            tail.prev = node

            node.prev = prevNode
            node.next = tail
        }
        // head ↔ A ↔ B <-> tail
        // node.prev ↔ node.next
        func remove(_ node: Node) {
            node.prev?.next = node.next
            node.next?.prev = node.prev
        }
        // remove LRU node after head
        func removeLRU() -> Node? {
            if head.next === tail {
                return nil
            }
            let lru = head.next!
            remove(lru)
            return lru
        }    

}

class LFUCache {
    //1. dict => 1 → Node(value: 10, freq: 2)
    var keyToNode = [Int: Node]()
    //2. 1 → DLL: [2]
    // For each frequency, we need to:
    // 1. Add a node as most recently used
    // 2. Remove a specific node
    // 3. Remove the least recently used node
    var freqToList = [Int: DoublyLinkedList]()
    var minFreq = 0
    var capacity: Int
    init(_ capacity: Int) {
        self.capacity = capacity
    }

    func updateFreq(_ node: Node) {
            // Remember old frequency
            let oldFreq = node.freq
            // remove it from old freq list
            let oldList = freqToList[oldFreq]!
            // Suppose before accessing node A:
            // minFreq = 1
            // freq 1:  A, freq 2:  C
            // We access A, so we remove it from frequency 1.
            // freq 1:  empty, freq 2:  C  
            // Since A moved from frequency 1 to frequency 2, and frequency 1 has no nodes left, what is the new minimum frequency? - 2
            oldList.remove(node) // Frequency 1: head ↔ B ↔ tail
            if oldFreq == minFreq && oldList.isEmpty {
                minFreq += 1
            }
            // increase its freq
            node.freq += 1
            // “I increased this node’s frequency. Now check whether a group/list for that new frequency exists. If not, create it. Then add the node as MRU.”
            // Suppose the node moves to frequency 2, but we currently only have:freq1
            // freqToList: 1 → DLL
            // There is no list for 2 yet. So we create one:
            if freqToList[node.freq] == nil {
                freqToList[node.freq] = DoublyLinkedList()
            }
            // Then we can safely add the node:
            // insert it to the frequency 2 list as MRU
            freqToList[node.freq]?.insert(node) 
            // Frequency 2: becomes 
            // head ↔ C ↔ A ↔ tail
            //                 ↑
            //                 MRU
    }
    
    // when get happens, we move a node from frequency 1’s list to frequency 2’s list
    // Frequency 1: head ↔ A ↔ B ↔ tail
    // Frequency 2: head ↔ C ↔ tail
    func get(_ key: Int) -> Int {
        // 1. Check whether the key exists, If it doesn’t exist → return -1.
        guard let node = keyToNode[key] else {
            return -1
        }
        // 2. Key exists
        // We found its node, so this counts as using/accessing it.
        updateFreq(node) // This moves it from:freq 1 → freq 2 or freq 2 → freq 3
        // 3. Return its value
        return node.val
    }
    
    func put(_ key: Int, _ value: Int) {
        if capacity == 0 {
            return
        }
        // Case 1: Key already exists
        // 1. Find the node using keyToNode[key]
        if let node = keyToNode[key] {
            // 2. Update its value
            node.val = value
            // 3. Since put on an existing key counts as using/accessing it, call updateFreq(node)
            updateFreq(node)
            return
        } 

            // Case 2: New key
            // Step 1: If cache is full, remove LFU + LRU
            if keyToNode.count == capacity {
                // If it’s full, what should we remove?
                // minFreq
                // ↓
                // freqToList[minFreq]
                // ↓
                // removeLRU()
                // ↓
                // delete that key from keyToNode
                // Cache full → go to the minimum frequency list → remove its least recently used node → remove that key from the dictionary.
                // evict =>  when LFU Cache evicts it, we need its key:
                if let nodeToRemove = freqToList[minFreq]?.removeLRU() {
                    keyToNode[nodeToRemove.key] = nil
                }
            }
            // Step 2. Then create the new node
            let newNode = Node(key, value)
            // New nodes always start with: freq = 1
            // Step 3: Store it in keyToNode
            keyToNode[key] = newNode
            // Step 4: And add it to the frequency 1 DLL as MRU:
            if freqToList[1] == nil {
                freqToList[1] = DoublyLinkedList()
            }
            freqToList[1]?.insert(newNode)
            // Step 5: Update minimum frequency
            minFreq = 1 // because we just added a brand-new node with frequency 1.
        
    }
}

/**
 * Your LFUCache object will be instantiated and called as such:
 * let obj = LFUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
