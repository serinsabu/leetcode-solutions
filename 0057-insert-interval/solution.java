class Solution {
    public int[][] insert(int[][] intervals, int[] newInterval) {
        int n = intervals.length;

        int s1 = newInterval[0];//2
        int e1 = newInterval[1];//5
        ArrayList<int[]> list = new ArrayList<>();
        boolean inserted = false;// to control merging logic
        for(int i=0; i<n; i++) {
            int s2 = intervals[i][0];//1
            int e2 = intervals[i][1];//3

            if(e2 < s1) {
                // interval is before new interval here
                // no overlap , add original interval 
                list.add(new int[]{s2, e2});
            } else if(s2 <= e1) {
                // overlapping -> merge
                // update s1 and e1
                s1 = Math.min(s1, s2);
                e1 = Math.max(e1, e2);
            } else {
                // new interval is after current interval
                // add merged interval once
                // add the current interval
                // then stop merging
                if(!inserted) {
                    list.add(new int[]{s1, e1});// add merged interval once
                    inserted = true;
                }
                    list.add(new int[]{s2, e2}); // add the current interval
            }
        }
        if(!inserted) {
            list.add(new int[]{s1, e1});
        }

        int[][] ans = new int[list.size()][2];
        int ind = 0;
        for(int[] key: list) {
            ans[ind][0] = key[0];
            ans[ind][1] = key[1];
            ind++;
        }
        return ans;
    }
}
