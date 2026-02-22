class Solution {
    public boolean isDigitorialPermutation(int n) {
        int dig = 0;
        int original = n;
        while(n != 0) {
            int rem = n%10;//1
            dig += findFact(rem);//24+120+1
            n = n/10;//
        }
        List<Integer> ans = new ArrayList<Integer>();
        ans = permuation(dig);
        return ans.contains(original);
    }

    public List<Integer> permuation(int n) {
        List<Integer> result = new ArrayList<>();

        char[] digits = String.valueOf(n).toCharArray();
        boolean[] visited = new boolean[digits.length];

        backtrack(digits, visited, new StringBuilder(), result);

        return result;
    }

    public void backtrack(char[] digits, boolean[] visited,
                           StringBuilder current,
                           List<Integer> result) {
        if (current.length() == digits.length) {
            result.add(Integer.parseInt(current.toString()));
            return;
        }

        for (int i = 0; i < digits.length; i++) {
            if (visited[i]) continue;
            if (current.length() == 0 && digits[i] == '0')
                continue;

            visited[i] = true;
            current.append(digits[i]);

            backtrack(digits, visited, current, result);

            current.deleteCharAt(current.length() - 1);
            visited[i] = false;
        }
    }

    public int findFact(int num) {
        int fact = 1;
        for(int i=1; i<=num; i++) {
            fact *= i;//
        }
        return fact;
    }
}
