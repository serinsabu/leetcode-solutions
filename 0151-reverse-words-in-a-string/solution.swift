class Solution {
    func reverseWords(_ s: String) -> String {
        
        var ans = ""
        
        var chars = Array(s)
        var n = chars.count
        var start = n-1
        var end = n-1

            while(start >= 0) {
                while(end >= 0 && chars[end] == " ") {
                    end -= 1;
                }

                // STOP if no word left
                if end < 0 { break }

                start = end;
                while(start >= 0 && chars[start] != " ") {
                    start -= 1;
                }

                if(!ans.isEmpty) {
                    ans.append(" ");
                }
                if start+1 <= end {
                    for i in (start+1)...end {
                        ans.append(chars[i]);
                    }
                }
                end = start;
            }

        return ans;
    }
}
