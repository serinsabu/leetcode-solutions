class Solution {
    public int numberOfSpecialChars(String word) {
        Map<Character, Character> map = new HashMap<>();

        int n = word.length();
        int count = 0;

        for(int i=0; i<n; i++) {
            char ch = word.charAt(i);
            if(ch >= 'a' && ch <= 'z') {
                map.put(ch, Character.toUpperCase(ch));
            }
        }
        //a-A,b-B,c-C
        for(Character k: map.keySet()) {
            System.out.println(k + " " + map.get(k));
        }
        for(int i=0; i<n; i++) {
            char ch = word.charAt(i);
            if(ch >= 'A' && ch <= 'Z') {
                if(map.containsKey(Character.toLowerCase(ch))) {
                    count ++;
                    map.remove(Character.toLowerCase(ch));
                }
            }
        }
        return count;
    }
}
