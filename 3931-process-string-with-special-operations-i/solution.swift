class Solution {
    func processStr(_ s: String) -> String {
        var result: [Character] = []

        for ch in s {
            if ch == "#" {
                result = result + result
            } else if ch == "*" {
                result.popLast()
            } else if ch == "%" {
                result = result.reversed()
            } else {
                // lowercase
                // print(ch)
                result.append(ch)
            }
        }
        // print(result)//aab
        return String(result)
    }
}
