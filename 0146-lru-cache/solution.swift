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
    var capacity = 0
    var head = Node(0,0)
    var tail = Node(0,0)
    var dict = [Int: Node]()
    init(_ capacity: Int) {
        self.capacity = capacity

        tail.prev = head
        head.next = tail
    }
    // prev<->node
    // head<->node<->tail
    // insert node at end
    private func insert(_ node: Node) {
        let prev = tail.prev!

        prev.next = node
        node.prev = prev
        node.next = tail
        tail.prev = node
    }
    // head<->A<-B->C<->tail
    // A<->C
    // remove node B from middle
    private func remove(_ node: Node) {
        node.prev?.next = node.next
        node.next?.prev = node.prev

        node.next = nil
        node.prev = nil
    }
    
    func get(_ key: Int) -> Int {
        if let node = dict[key] {
            // Since it was just accessed, make it Most Recently Used.
            // * Remove it from its current position.
            // * Insert it before tail.
            remove(node)
            insert(node)
            return node.value
        } 
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        // case 1: if exists, find node
        if let node = dict[key] {
            // update
            node.value = value
            remove(node)
            insert(node)
        } else { // Case 2: Key doesn’t exist
            // create a new node
            let newNode = Node(key, value) 
            dict[key] = newNode
            insert(newNode)
        }

        // case 3: capacity exceeds , evict
        if dict.count > capacity {
            // least recently used key
            let lru = head.next!
            remove(lru)
            dict.removeValue(forKey: lru.key)
        }
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
