class Solution {
    public String addBinary(String a, String b) {
        int m = a.length();
        int n = b.length();

        int carry = 0;
        StringBuilder ans = new StringBuilder();

        while(m > 0 || n > 0 || carry > 0) {
            int sum = 0;

            int digit1 = 0;
            if(m > 0) {
                char ch1 = a.charAt(m-1);
                digit1 = ch1 - '0';//1
            }

            int digit2 = 0;
            if(n > 0) {
                char ch2 = b.charAt(n-1);
                digit2 = ch2 - '0';//1
            }
            sum += digit1 + digit2 + carry;//2+0=2, 1+0+1=2
            int dig = sum%2;
            ans.append((char)(dig+'0'));
            carry = sum/2;//1
            m--;
            n--;
        }
        return ans.reverse().toString();
    }
}
