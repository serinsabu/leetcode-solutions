class Solution {
    func findLonely(_ nums: [Int]) -> [Int] {
        var map = [Int: Int]()
        var ans = [Int]()

        for i in 0..<nums.count {
            //x is lonely when it appears only once
            map[nums[i], default: 0] += 1
        }

        for (num, count) in map {
            //print(map[num], count) 
            //no adjacent numbers (i.e. x + 1 and x - 1) appear in the array.
            if count == 1 && map[num-1] == nil && map[num+1] == nil {
                ans.append(num)
            }
        }
        return ans
    }
}
