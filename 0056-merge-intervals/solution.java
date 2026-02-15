class Solution {
    public int[][] merge(int[][] intervals) {
        int n = intervals.length;
        int m = intervals[0].length;

        // sort by start time 
        Arrays.sort(intervals, (a,b) -> {
            return a[0]-b[0];
        });

        ArrayList<int[]> list = new ArrayList<>();
            int s1 = intervals[0][0];
            int e1 = intervals[0][1];

        for(int i=1; i<n; i++) {
            int s2 = intervals[i][0];
            int e2 = intervals[i][1];

            // 2 conditions 
            // if s2 is between s1 and e1
            // if s2 and e2 both in between s1 and e1
            if(s2 <= e1) {
                // overlap - s1 is already sorted , so minimum start time is already there
                // just do the max of end time 
                // update e1 - NOT e2 , because e2 is future - it can be compared with future
                e1 = Math.max(e2, e1);//we have = {s1, e1}
                // System.out.println(s1 + " " + e1);
                // no need to add in the list, instead we update end and keep it
                // and add when we find a non overlapping interval in else case
                // list.add(new int[]{s1, e2});
            } else {
                // Overlap intervals get added later when a non-overlap is found (or at the very end).
                // non overlapping case, add the already created overlapped interval now 
                list.add(new int[]{s1, e1});
                // update s1 and e1, so that i can compare the current one with next
                s1 = s2;
                e1 = e2;
                // System.out.println(s1 + " " + e1);
            }
        }
        // add the last part after loop finished
        list.add(new int[]{s1, e1});//add s1,e1 in the end =>{15,18} is added at the end
        //{[1,6], [8,10], [15,18]}
        int[][] ans = new int[list.size()][2];
        int i=0;
        for(int[] pair: list) {
            // System.out.print(pair[0]);
            ans[i][0] = pair[0];
            ans[i][1] = pair[1];
            i++;
        }
        return ans;
    }
}
