class Pair {
    int i;
    int j;
    int sum;

    Pair(int i, int j, int[] nums1, int[] nums2) {
        this.i = i;
        this.j = j;
        this.sum = nums1[i] + nums2[j];
    }
}

class Solution {
    public List<List<Integer>> kSmallestPairs(int[] nums1, int[] nums2, int k) {
        List<List<Integer>> result = new ArrayList<>();
        if (nums1.length == 0 || nums2.length == 0 || k == 0) return result;
        PriorityQueue<Pair> minHeap = new PriorityQueue<>((pair1,pair2) -> {
            return pair1.sum - pair2.sum;
        });

        int m = nums1.length;
        int n = nums2.length;
        // to remove nested loop
        // idea is, first add first whole row in nums1 with 0th column in nums2
        // make sure to check k pairs are made or not
        for(int i=0; i<m && i<k; i++) {
            minHeap.add(new Pair(i, 0, nums1, nums2));
        }

        // if k pairs not made try with next column
        // then add whole row with 1st column check < k, then next column so on
        while(k > 0 && !minHeap.isEmpty()) {
            List<Integer> ans = new ArrayList<>();
            Pair pair = minHeap.poll();
            System.out.println(nums1[pair.i] + " " + nums2[pair.j]);
            ans.add(nums1[pair.i]);
            ans.add(nums2[pair.j]);
            result.add(ans);
            k--;
            if(pair.j + 1 < n) {
                minHeap.add(new Pair(pair.i, pair.j+1, nums1, nums2));
            }
        }
        return result;
    }
}
