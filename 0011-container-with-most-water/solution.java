class Solution {
    public int maxArea(int[] height) {
        int n = height.length;
        int i=0;
        int j=n-1;
        int maxArea = Integer.MIN_VALUE;
        int area = 0;

        while(i < j) { 
            if(height[i] <= height[j]) {
                area = (j-i) * height[i];//7
                i++;//2
            } else {
                area = (j-i) * height[j];
                j--;//
            }
            maxArea = Math.max(maxArea, area);//49
        }
        return maxArea;
    }
}
