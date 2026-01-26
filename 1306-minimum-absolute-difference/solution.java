class Solution {
    public List<List<Integer>> minimumAbsDifference(int[] arr) {
        Arrays.sort(arr);
        int n = arr.length;
        //[1,2,3,4]
        List<List<Integer>> ans = new ArrayList<>();
        int minVal = Integer.MAX_VALUE;
        int i=0;
        // SLIDING WINDOW - KIND oF approach - similar to 1982
        int k=2;
        int j=k-1;

        while(j < n) {
            int diff = arr[j] - arr[i];
            List<Integer> list = new ArrayList<>();
            if(diff == minVal) {
                list.add(arr[i]);
                list.add(arr[j]);
                ans.add(list);
            } else if(diff < minVal) {
                minVal = diff;
                ans = new ArrayList<>();
                list.add(arr[i]);
                list.add(arr[j]);
                ans.add(list);
            } else {
                // if larger do nothing
            }
            i++;
            j++;
        }
        // System.out.print(minVal);
        return ans;
    }
}

/*

“Single-pass” idea (how it works)

The trick is:
	•	While scanning adjacent elements:
    
	•	If you find a smaller difference, you:
    no need of math.min, instead update min = diff when diff < min
	•	Clear previous answers - clean ans = new ArrayList<>()
	•	Add the new pair - add to list 

	•	If you find a difference equal to current minimum:
	•	Add the pair

	•	If larger:
	•	Ignore

So you maintain everything on the fly.

*/
