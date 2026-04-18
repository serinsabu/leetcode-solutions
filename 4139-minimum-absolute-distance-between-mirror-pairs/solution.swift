class Solution {
    func minMirrorPairDistance(_ nums: [Int]) -> Int {
        var i = 0
        var n = nums.count
        var minVal = Int.max

        var map = [Int: Int]()
        //[120, 21]
        // 120 → reverse → 21 → stored
        // 21 → lookup → finds 21 → match ✅
        for i in 0..<n {
            // check if current number matches any previously reversed number
            if let j = map[nums[i]] {
                minVal = min(minVal, i - j)//
            }
            // store reverse of current number
            // store the reverse later to avoid this case 120 must be == 21 , ignore 0
            let rev = reverse(nums[i])//21
            map[rev] = i//21-0
        }

        func reverse(_ n: Int) -> Int {
            var val = n
            var rev = 0
            while val > 0 {
                var rem = val%10
                rev = rev * 10 + rem
                val = val/10
            }
            return rev
        }
        return minVal == Int.max ? -1 : minVal
    }
}
