class Solution {
    public int romanToInt(String s) {
        // put all given values in the map
        Map<Character, Integer> map = new HashMap<>();
        map.put('I', 1);
        map.put('V', 5);
        map.put('X', 10);
        map.put('L', 50);
        map.put('C', 100);
        map.put('D', 500);
        map.put('M', 1000);
        int n = s.length();

        // just check if curr value is less that next value -> subtract
        // else add
        int ans = 0;

        for(int i=0; i<n; i++) {
            int curr = map.get(s.charAt(i));//
            int next = 0;
            if(i < n-1) {
                next = map.get(s.charAt(i+1));//
                if(curr < next) {
                    // subtract
                    ans -= curr;//
                } else {
                    // add
                    ans += curr;//
                }
            } else {
                ans += curr;
            }
        }
        return ans;
    }
}
