class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var top = 0
        var bottom = n-1
        var left = 0
        var right = n-1

        var ans = Array(repeating: Array(repeating: 0, count: n), count: n)
        var num = 1

        while left <= right && top <= bottom {
            if left <= right {
                for i in left...right {
                    ans[top][i] = num
                    num += 1  
                }
                top += 1
            }

            if top <= bottom {
                for i in top...bottom {
                    ans[i][right] = num
                    num += 1  
                }
                right -= 1
            }

            if top <= bottom {
                for i in stride(from: right, through:left, by: -1) {
                    ans[bottom][i] = num
                    num += 1  
                }
                bottom -= 1
            }

            if left <= right {
                for i in stride(from: bottom, through:top, by: -1) {
                    ans[i][left] = num
                    num += 1  
                }
                left += 1
            }
        }

        return ans
    }
}
