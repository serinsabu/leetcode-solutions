class Solution {
    public int findMinArrowShots(int[][] points) {
        // 1 2 6 7 8 10 12 16
        // 1 2 3 4 5 6 7 8
        // basically, check how min number of overlapping intervals
        // similar to min number of platforms
        Arrays.sort(points, (a,b) -> {
            // [[-2147483646,-2147483645],[2147483646,2147483647]] testcase failed 
            // return a[1]-b[1];

            // so use -> This avoids overflow.
            return Integer.compare(a[1], b[1]);
        });
        int n = points.length;
        int e1 = points[0][1];
        int count = 1;
        for(int i=1; i<n; i++) {
            int s2 = points[i][0];
            int e2 = points[i][1];

            if (s2 > e1) {
                // non overlapping
                e1 = e2; 
                count ++;
            }
        }
        return count;
    }
}
