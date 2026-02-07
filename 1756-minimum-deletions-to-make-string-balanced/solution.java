class Solution {
    public int minimumDeletions(String s) {
        int n = s.length();
        int[] prefixB = new int[n+1];
        int[] suffixA = new int[n+1];

        //At index i, we copy previous count, then update if needed.
        //prefixB[i] = number of 'b' in s[0..i-1]
        for(int i=1; i<=n; i++) {
            prefixB[i] = prefixB[i-1];
            if(s.charAt(i-1) == 'b') {
                prefixB[i]++;
            }
        }

        //At index i, we copy next count, then update if needed.
        //suffixA[i] = number of 'a' in s[i..n-1]
        for(int i=n-1; i>=0; i--) {
            suffixA[i] = suffixA[i+1];
            if(s.charAt(i) == 'a') {
                suffixA[i]++;
            }
        }

        int minDeletions = Integer.MAX_VALUE;
        for(int i=0; i<=n; i++) {
            minDeletions = Math.min(minDeletions, prefixB[i] + suffixA[i]);
        }
        return minDeletions;
    }
}

/*
Rule for a balanced string:
	•	Left part → should contain only 'a'
	•	Right part → should contain only 'b'

Step 2: Count deletions for a given split

For a chosen split position i:
	•	In left part:
❌ Every 'b' must be deleted
	•	In right part:
❌ Every 'a' must be deleted

Total deletions =
(# of 'b' in left) + (# of 'a' in right)

The condition says:

❌ There should NOT exist i < j such that
s[i] = 'b' and s[j] = 'a'

In simple words:

👉 All 'a' must come before all 'b'

So valid balanced strings look like:
	•	"aaaa"
	•	"aaabbb"
	•	"bbb" (this is actually balanced — no 'a' after 'b')
	•	""

Invalid:
	•	"ba"
	•	"abba"
	•	"baba"
*/
