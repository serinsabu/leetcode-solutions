class Solution {
    public String intToRoman(int num) {
        int[] values = {1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1};
        String[] symbols = {"M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"};
        String ans = "";
        // int i=0;
        // int j=0;
        for(int i=0; i<values.length; i++) {
            while(num >= values[i]) {
                //749>=500=yes
                ///3749 >= 1000, 2749 >= 1000, 2749 >= 1000
                num -= values[i];
                //3749-1000=2749-1000=1749-1000=749
                //749-500=249
                ans += symbols[i];//MMMD
            }
        }
        return ans;
    }
}
