class Solution {
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        var arr = arr
        let n = arr.count
        // avoid visited array
        
        func dfs(_ ind: Int) -> Bool {
            // case 1: Out of bounds
            if ind < 0 || ind >= n {
                return false
            }
            // case 2: Already visited -> return false
            if arr[ind] < 0 {
                return false
            }
            // case 3: found 0, return true
            if arr[ind] == 0 {
                return true
            }

            // store jump value before marking visited
            let jump = arr[ind]

            // mark visited
            arr[ind] = -arr[ind]

            // explore both directions
            return dfs(ind + jump) || dfs(ind - jump)
        }
        return dfs(start)
    }
/*
    1. invalid? stop
    2. already visited? stop
    3. value == 0? success
    4. mark visited
    5. explore left and right recursively
*/
}
