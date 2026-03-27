class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var n = temperatures.count
        var stack = [Int]()
        var ans = Array(repeating: 0, count: n)

        // NGR -> backwards
        for i in stride(from: n-1, through: 0, by: -1) {
            while !stack.isEmpty && temperatures[i] >= temperatures[stack.last!] {
                stack.removeLast()
            }

            if !stack.isEmpty {
                if let last = stack.last {
                    ans[i] = last - i//1
                }
            }
            stack.append(i)//7
        }
        return ans
    }
}
