class Solution {
    public String convert(String s, int numRows) {
        // if row=0, keep going down till you reach numRows-1
        // if you reached numRows-1, then flip the direction move up till row=0 so on
        int n = s.length();
        if(numRows == 1) return s;
        StringBuilder[] rows = new StringBuilder[numRows];

        for(int i=0; i<numRows; i++) {
            rows[i] = new StringBuilder();
        }

        int currRow = 0;
        int dir = 1;
        for(int i=0; i<n; i++) {
            rows[currRow].append(s.charAt(i));

            // if top, move down
            if(currRow == 0) {
                dir = 1;
            } else if(currRow == numRows-1) {//if bottom, move to top
                dir = -1;
            }
            currRow += dir;
        }

        StringBuilder result = new StringBuilder();
        for(StringBuilder row: rows) {
            result.append(row);
        }
        return result.toString();
    }
}
