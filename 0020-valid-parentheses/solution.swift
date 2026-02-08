class Solution {
    func isValid(_ s: String) -> Bool {
        var stack:[Character] = []

        for ch in s {
            if ch == "(" || ch == "{" || ch == "[" {
                stack.append(ch)
            } else {
                if stack.isEmpty {
                    return false
                }

                let top = stack.removeLast()
                if (top == "(" && ch == ")") ||
                (top == "{" && ch == "}") ||
                (top == "[" && ch == "]") {
                    continue
                } else {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}
