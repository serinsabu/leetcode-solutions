class Solution {
    func twoEditWords(_ queries: [String], _ dictionary: [String]) -> [String] {
        var ans = [String]()

        // just check if difference of character is <= 2 then add to the ans
        for query in queries {
            for word in dictionary {
                var diff = 0

                for (c1, c2) in zip(query, word) {
                    if c1 != c2 {
                        diff += 1
                    }
                }

                if diff <= 2 {
                    ans.append(query)
                    break // stop checking further words
                }
            }
        }
        return ans
    }
}
