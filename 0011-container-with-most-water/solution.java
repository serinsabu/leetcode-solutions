class Solution {
    public int maxArea(int[] height) {
        // keep moving the shorter one so that height can still increase but not decrease
        // DO NOT MOVE taller one because width will decrease and water also will be short
        // start with left and right
        // calculate water
        // move the smaller one 

        int n = height.length;
        int i=0;
        int j=n-1;
        int maxWidth = Integer.MIN_VALUE;

        while(i < j) {
            // water = distance * shorter height
            int area = (j-i) * Math.min(height[i], height[j]);
            if(height[i] < height[j]) {
                i++;
            } else {
                j--;
            }
            maxWidth = Math.max(area, maxWidth);
        }
        return maxWidth;
    }
}
