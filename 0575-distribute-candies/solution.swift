class Solution {
    func distributeCandies(_ candyType: [Int]) -> Int {
        /*
            Alice’s goal
            NOT maximize number of candies
            That is fixed already (n/2).

            She wants: maximize DIFFERENT TYPES

            Core intuition
            always pick new types whenever possible

            Suppose types are: {1,2,3,4}
            and she can eat: only 2 candies
            Best greedy choice:
            pick 2 DIFFERENT types => 1,1 --> because duplicates waste opportunity.

            1. How many unique candy types exist? -> uniqueTypes
            2. How many candies can Alice eat? -> n/2
        */
        // final formula -> min(uniqueTypes, n/2)
        var n = candyType.count
        //Case 1 if: uniqueTypes >= n/2
        // Alice can eat: n/2 different types because she has enough variety.

        // Case 2 if: uniqueTypes < n/2
        // then maximum possible is: all unique types because no more types exist.
        var uniqueTypes = Set<Int>(candyType)
        return min(uniqueTypes.count, n/2)
    }
}
