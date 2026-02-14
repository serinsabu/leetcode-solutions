class Solution {
    func simplifyPath(_ path: String) -> String {
        var str = path.split(separator: "/")
        var stack = [String]()
        var ans = ""

        for st in str {
            if st == "." {
                // ignore
                continue
            } else if st == ".." {
                if !stack.isEmpty {
                    stack.removeLast()
                }
            } else {
                stack.append(String(st))
            }
        }

        for val in stack {
            ans += "/" + val
        }
        return ans.isEmpty ? "/" : ans
    }
}
