class Solution {
    public int[] sortArray(int[] nums) {
        int n = nums.length;
        // merge sort 
        int low = 0;
        int high = n-1;

        mergeSort(nums, low, high);
        return nums;
    }

    void merge(int[]nums, int low, int mid, int high) {

        int n1 = mid-low+1;
        int n2 = high-mid;

        int[] left = new int[n1];
        int[] right = new int[n2];

        // doing - low+i and mid+i+1 because low and high wont be always 0
        // it can have any index as its comparing intermediate arrays
        for(int i=0; i<n1; i++) {
            left[i] = nums[low+i];
        }

        for(int i=0; i<n2; i++) {
            right[i] = nums[mid+i+1];
        }

        int i=0; int j=0; int k=low;
        while(i < n1 && j < n2) {
            if(left[i] <= right[j]) {
                nums[k++] = left[i];
                i++;
            } else {
                nums[k++] = right[j];
                j++;
            }
        }

        while(i < n1) {
            nums[k++] = left[i];
            i++;
        }

        while(j < n2) {
            nums[k++] = right[j];
            j++;
        }
    }

    void mergeSort(int[] nums, int low, int high) {
        if(high > low) {
            int mid = low + (high-low)/2;
            mergeSort(nums, low, mid);
            mergeSort(nums, mid+1, high);
            merge(nums, low, mid, high);
        }
    }
}
