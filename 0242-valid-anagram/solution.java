class Solution {
    public boolean isAnagram(String s, String t) {
        int n = s.length();
        int m = t.length();

        Map<Character, Integer> map1 = new HashMap<>();
        //put all characters of t
        for(int i=0; i<m; i++) {
            char ch = t.charAt(i);
            //a-3,n-1,m-1,g-1,r-1
            map1.put(ch, map1.getOrDefault(ch, 0)+1);
        }

        for(int i=0; i<n; i++) {
            char ch = s.charAt(i);

            if(map1.containsKey(ch)) {
                if(map1.get(ch) > 1) {
                    map1.put(ch, map1.getOrDefault(ch, 0)-1);
                } else {
                    map1.remove(ch);
                }
            } else {
                return false;
            }
            //a-3,n-1,m-1,g-1,r-1
            // map1.put(ch, map.getOrDefault(ch, 0)+1);
        }
        return map1.size() == 0;
    }
}
