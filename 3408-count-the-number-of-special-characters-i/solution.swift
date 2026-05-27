class Solution {
    func numberOfSpecialChars(_ word: String) -> Int {
        var lowerSet = Set<Character>()
        var upperSet = Set<Character>()

        
        for ch in word {
            // if small letters
            if ch.isLowercase {
                lowerSet.insert(ch)
            } else {
                upperSet.insert(Character(ch.lowercased()))
            }
        }

        // print(lowerSet, "\n")//["a", "c", "b"] 
        // print(upperSet)//["c", "a", "b"]

        let count = lowerSet.intersection(upperSet).count
        return count
    }
}
