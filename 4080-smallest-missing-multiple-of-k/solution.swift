class Solution {
    func missingMultiple(_ nums: [Int], _ k: Int) -> Int {
        let seen = Set(nums)
        var multiple = k

        while seen.contains(multiple) {
            multiple += k
        }
        return multiple
    }
}
