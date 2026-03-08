class Solution {
    public List<String> generateParenthesis(int n) {
        List<String> ans = new ArrayList<String>();
        int openUsed = 0;
        int closedUsed = 0;
        String curr = "";

        generateCombs(openUsed, closedUsed, n, ans, curr);
        return ans;
    }

    public void generateCombs(int openUsed, int closedUsed, int n, List<String> ans, String curr) {
        if(curr.length() == 2*n) {
            ans.add(curr);
            return;
        }
        if(openUsed < n) {
            generateCombs(openUsed + 1, closedUsed, n, ans, curr + '(');
        }
        if(closedUsed < openUsed) {
            generateCombs(openUsed, closedUsed + 1, n, ans, curr + ')');
        }
    }
}
