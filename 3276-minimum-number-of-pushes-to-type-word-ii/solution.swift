class Solution {
    func minimumPushes(_ word: String) -> Int {
        var map = [Character: Int]()

        // count frequencies
        for ch in word {
            map[ch, default: 0] += 1
        }
        //a-2,b-2,c-2,d-2,e-2,f-2,g-2,h-2,i-6
        /*
            First 8 letters   -> cost = 1
            Next 8 letters    -> cost = 2
            Next 8 letters    -> cost = 3
            Next 2 letters    -> cost = 4
            because there are 26 letters.
        */
        // sort freq by descending order
        let sorted = map.sorted { $0.value > $1.value }
        var cost = 0
        var pushes = 0

        // Assign costs greedily
        for i in 0..<sorted.count {
            if i%8 == 0 {
                pushes += 1
            }
            cost += pushes * sorted[i].value
        }
        return cost
    }
}
