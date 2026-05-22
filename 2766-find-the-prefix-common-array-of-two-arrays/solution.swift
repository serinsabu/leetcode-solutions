class Solution {
    func findThePrefixCommonArray(_ A: [Int], _ B: [Int]) -> [Int] {
        var n = A.count
        var freq = Array(repeating: 0, count: n + 1)
        var ans = [Int]()
        var count = 0

        for i in 0..<n {
            // checking whether current element was already seen in OTHER array
            freq[A[i]] += 1
            freq[B[i]] += 1
            //2-2,3-2,1-2
            if A[i] == B[i] {
                count += 1
            } else {
                if freq[A[i]] == 2 {
                    count += 1//2
                }
                if freq[B[i]] == 2 {
                    count += 1//3
                }
            }
            ans.append(count)//[0,1,3]
        }
        return ans
    }
}
