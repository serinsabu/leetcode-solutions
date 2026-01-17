class Solution {
    public int[] bestTower(int[][] towers, int[] center, int radius) {
        int n = towers.length;
        PriorityQueue<int[]> pq = new PriorityQueue<>(
            (a,b) -> {
                if(a[2] != b[2]) return b[2] - a[2];// max qf
                if(a[0] != b[0]) return a[0] - b[0];//small x
                return a[1] - b[1]; //small y
            }
        );

        for(int i=0; i<n; i++) {
            int q = towers[i][2];
            int ans = Math.abs(towers[i][0] - center[0]) + Math.abs(towers[i][1] - center[1]);
            if(ans > radius) {
                // not reachable
                continue;
            }
            if (ans <= radius) {
                // include
                pq.offer(new int[]{towers[i][0], towers[i][1], q});
            } //otherwise exclude
        }
        if(pq.isEmpty()) {
            return new int[]{-1,-1};
        }
        return new int[]{pq.peek()[0], pq.peek()[1]};
    }
}
