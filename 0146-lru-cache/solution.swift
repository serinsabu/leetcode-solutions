class Node {
    var key: Int
    var value: Int
    var prev: Node?
    var next: Node?

    init(_ key: Int, _ value: Int) {
        self.key = key
        self.value = value
    }
}

class LRUCache {
    var head = Node(0,0)
    var tail = Node(0,0)
    var map = [Int: Node]()
    var capacity = 0

    init(_ capacity: Int) {
        head.next = tail
        tail.prev = head
        self.capacity = capacity
    }

    //A<->B<->C => remove middle
    private func remove(_ node: Node) {
        var temp = node.prev!

        temp.next = node.next
        node.next?.prev = temp
    }

    // insert at tail A<->B<->node<->tail
    private func insert(_ node: Node) {
        var prev = tail.prev!

        prev.next = node
        node.prev = prev

        node.next = tail
        tail.prev = node
    }

    // Cache:
    // head <-> A <-> B <-> C <-> tail
    // A = Least Recently Used
    // C = Most Recently Used

    // So after get(B):
    // head <-> A <-> C <-> B <-> tail
    
    func get(_ key: Int) -> Int {
        guard let currNode = map[key] else {
            return -1
        }
        remove(currNode)
        insert(currNode)
        return currNode.value
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = map[key] {
            // if exists - update value (1,100)
            remove(node)
            insert(node)
            node.value = value
        } else {
            // if key does not exist (1,10) , (2,20)
            // Create Node(1,10)
            // Insert at tail (MRU)
            // Add to map
            var newNode = Node(key, value)
            insert(newNode)
            map[key] = newNode

            // map count exceeds, EVICT 
            // Find LRU
            if map.count > capacity {
                let lru = head.next!
                remove(lru)
                map.removeValue(forKey: lru.key)
            }
        }
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
