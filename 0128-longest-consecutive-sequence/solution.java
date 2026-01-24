class Solution {
    public int longestConsecutive(int[] nums) {
        int n = nums.length;
        Set<Integer> set = new HashSet<>();
        int maxLength = 0;

        for(int i=0; i<n; i++) {
            set.add(nums[i]);
        }
        //{100,4,200,1,3,2}
        // check for each potential number
        for(int i=0; i<n; i++) {
            int num = nums[i];//1
            // find starter element-if element does not have previous elemt
            if(!set.contains(num-1)) {//99->100 is beginning ,3->no,199->yes,0->yes
                // then it is beginning, and keep on checking its next elements
                // until next element is not found and calculate length
                int length = 1;//include starter elt as you already got 1 elt
                while(set.contains(num+1)) {//101-> not there,201->no,2->yes,3->yes
                    set.remove(num);
                    num ++;//4
                    length++;//2
                }
                // update length
                maxLength = Math.max(maxLength, length);//4
            }
        }
        return maxLength;
    }
}
