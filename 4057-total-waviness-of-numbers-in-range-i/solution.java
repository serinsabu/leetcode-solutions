class Solution {
    public int totalWaviness(int num1, int num2) {
        String str = "";
        int ans = 0;
        for(int num=num1; num<=num2; num++) {
            str = String.valueOf(num);
            ans += calculateWave(str);
        }
        return ans;
    }

    public int calculateWave(String str) {
        int n = str.length();
        int count = 0;
        for(int i=1; i<n-1; i++) {
            char curr = str.charAt(i);
            char prev = str.charAt(i-1);
            char next = str.charAt(i+1);

            if((curr > prev && curr > next) || (curr < prev && curr < next)) {
                count ++;
            }
            // System.out.print(str.charAt(i) + " ");
        }
        return count;
    }
}
