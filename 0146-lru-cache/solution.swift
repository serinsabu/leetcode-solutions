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

    var map = [Int: Node]()
    let head = Node(0, 0)
    let tail = Node(0, 0)
    let capacity: Int

    init(_ capacity: Int) {
        head.next = tail
        tail.prev = head
        self.capacity = capacity
    }

    // remove middle node
    // Before: A <--> B <--> C
    // After: A <--> C
    func remove(_ node: Node) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }

    // insert node at tail
    // Before: A --> tail
    // After: A --> B --> tail
    func insert(_ node: Node) {
        let prev = tail.prev

        prev?.next = node
        node.prev = prev

        node.next = tail
        tail.prev = node
    }
    
    func get(_ key: Int) -> Int {
        // Find node.
        guard let node = map[key] else {
            return -1
        }
        // Move to tail.
        // remove + insert
        remove(node)
        insert(node)
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        // PUT Existing Key
        if let node = map[key] {
            node.value = value
            // remove + insert
            remove(node)
            insert(node)
        } else {
            // PUT New Key
            //Create node.
            let newNode = Node(key, value)
            // insert
            insert(newNode)
            // Add to map.
            map[key] = newNode
        }

        // Evict
        if map.count > capacity {
            let lru = head.next!
            remove(lru)
            map.removeValue(forKey: lru.key)
        }
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
