class Solution {
    func numberOfSubstrings(_ s: String) -> Int {
        var dict = [Character: Int]()//[a:1, b:1, c:1]
        var n = s.count
        // dict["a", default: 0] = 1
        // dict["b", default: 0] = 1
        // dict["c", default: 0] = 1

        var i=0
        var j=0
        var chars = Array(s)
        var count = 0
        //a-0,b-0,c-0
        while j < n {
            dict[chars[j], default: 0] += 1
            //a-1,b-1,c-1,a-1
            // if abc all are present, then start a new window
            while dict["a", default: 0] > 0 && 
            dict["b", default: 0] > 0 && 
            dict["c", default: 0] > 0 {
                count += n-j
                dict[chars[i], default: 0] -= 1
                i += 1//3
                //print(chars[j])
            }
            j+=1//4
        }
        return count
    }
}
