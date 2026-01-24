class Solution {
    public String longestCommonPrefix(String[] strs) {
        int n = strs.length;
        Arrays.sort(strs);
        int len = strs[0].length();//1
        String ans = "";
        int last = strs.length-1;

        for(int i=0; i < len; ) {//i is character index//0<1
                    if(strs[0].charAt(i) == (strs[last].charAt(i))) {
                        ans += strs[0].charAt(i);
                    } else {
                        break;
                    }
                    i++;
        }
        return ans;
    }
}
