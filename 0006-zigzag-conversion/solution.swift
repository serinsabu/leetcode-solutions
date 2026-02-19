class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if(numRows == 1) {
            return s
        }
        var currRows = 0
        var ans = Array(repeating: "", count: numRows)
        var dir = 1
        
        for char in s {
            ans[currRows].append(char)
            // top
            if currRows == 0 {
                dir = 1
            } else if currRows == numRows-1 {//bottom
                dir = -1
            }
            currRows += dir
        }
        return ans.joined()
    }
}
