class Solution {
    func findMissingElements(_ nums: [Int]) -> [Int] {
        var ans = [Int]()
        var nums = nums
        // sort the array
        nums.sort()//[1,2,4,5]
        //[1,5]

        // Compare adjacent elements
        for i in 0..<nums.count-1 {
            let prev = nums[i]//2
            let next = nums[i+1]//4
            // exclude prev and next , 1 and 5 for 3rd testcase
                for num in (prev+1)..<next {//1...4
                    ans.append(num)//[2,3,4]
                }
        }
        return ans
    }
}
