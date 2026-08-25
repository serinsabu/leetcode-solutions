class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var n = tokens.count
        var stack = [Int]()

        for token in tokens {
            if (
            token == "+" || 
            token == "-" || 
            token == "*" || 
            token == "/"
            ) {
                // ORDER MATTERS
                var right = stack.removeLast()//1
                var left = stack.removeLast()//2
                var ans = 0
                
                switch token {
                    case "+": 
                        stack.append(left + right)
                    case "-" :
                        stack.append(left - right)
                    case "*" :
                        stack.append(left * right)
                    default :
                        stack.append(left / right)
                }
            } else {
                stack.append(Int(token)!)
            }
        }
        return stack.last!
    }
}
