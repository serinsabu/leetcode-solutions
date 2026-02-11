class Solution {
    public int largestAltitude(int[] gain) {
        int n = gain.length;
        int[] prefixGain = new int[n+1];
        prefixGain[0] = 0;
        int maxGain = 0;

        for(int i=1; i<=n; i++) {
            prefixGain[i] = prefixGain[i-1] + gain[i-1];//-5
            maxGain = Math.max(maxGain, prefixGain[i]);//-1
        }
        return maxGain;
    }
}
