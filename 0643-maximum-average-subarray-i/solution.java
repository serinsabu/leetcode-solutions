class Solution {
    public double findMaxAverage(int[] nums, int k) {
        int n = nums.length;
        int i=0;
        int j=0;
        double sum = 0;
        double maxAvg = Double.NEGATIVE_INFINITY;

        while(j < n) {
            sum += nums[j];

            if(j-i+1 == k) {
                double avg = (double)sum/k;
                maxAvg = Math.max(maxAvg, avg);

                // slide window
                sum -= nums[i];
                i++;
            }
            j++;
        }
        return maxAvg;
    }
}
