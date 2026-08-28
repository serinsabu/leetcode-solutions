class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var ans = [String]()
        var res = ""
        
        solve(0,0)

        // 1. What is the base case?
        // 2. When can I add "("?
        // 3. When can I add ")"?
        func solve(_ open: Int, _ closed: Int) {
            // base case
            if open == n && closed == n {
                ans.append(res)
                return
            }


            // check whether choice is allowed
            if open < n {
                // choose
                res.append("(")
                // recurse
                solve(open+1, closed)
                // undo
                res.removeLast()
            }
            
            // check whether choice is allowed, without open there is no closed
            if closed < open {
                // choose
                res.append(")")
                // recurse
                solve(open, closed+1)
                // undo
                res.removeLast()
            }
        }
        return ans
    }
}
