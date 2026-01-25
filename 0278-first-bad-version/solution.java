/* The isBadVersion API is defined in the parent class VersionControl.
      boolean isBadVersion(int version); */

public class Solution extends VersionControl {
    public int firstBadVersion(int n) {
        //[1,2,3,4,5]
        /*
            Finding the first bad version is equivalent to finding the minimal k 
            satisfying isBadVersion(k) is True
        */
        int low = 1;
        int high = n;

        while(low < high) {
            int mid = low+(high-low)/2;
            if(isBadVersion(mid)) {
                high = mid;
            } else {
                low = mid+1;
            }
        }
        return low;
    }
}
