class Solution {
    public int calNextInd(int[] nums, int curr) {
        // calculate next index
        int seq = nums[curr];// seq is value, curr is index
        int next = curr;
        if(seq > 0) {
            // move steps forward
            // index + nums[index] will be your next position
            // % array length => because its circular we can reach to 0 again
            next = (seq + next) % nums.length;
        } else {
            // move steps backward, here value would be neg
            int mod = seq % nums.length;// to get the actual value from the circular loop
            int forward = mod + nums.length;// number of steps to move
            next = (curr + forward) % nums.length;//here you move those many steps 
        }
        return next;// return the next index
    }
    public boolean circularArrayLoop(int[] nums) {
        int n = nums.length;

        for(int i=0; i<n; i++) {
            Set<Integer> set = new HashSet<>();
            set.add(i);// add index in set
            boolean isPos = nums[i] > 0;
            // using curr to keep moving if curr fails, try with next i 
            int curr = i;
            while(true) {// do infinite times , as break is given
                int next = calNextInd(nums, curr);
                // must be either all positive or all negative, then only cycle is detected
                if(isPos) {
                    // if got neg in pos
                    if(nums[next] < 0) {
                        break;
                    } else {
                        // cycle is detected
                        if(set.contains(next)) {
                            // also check of cycle length > 1
                            if(curr != next) {
                                return true;
                            } else {
                                // length <= 1 if curr == next
                                break;
                            }
                        }
                    }
                    set.add(next);
                } else {
                    // if got pos in neg
                    if(nums[next] > 0) {
                        break;
                    } else {
                        // cycle is detected
                        // also check of cycle length > 1
                        if(set.contains(next)) {
                            if(curr != next) {
                                return true;
                            } else {
                                break;
                            }
                        }
                    }
                    set.add(next);
                }
                curr = next; // curr must be equal to next for next iteration
            }
        }
        return false;
    }
}
