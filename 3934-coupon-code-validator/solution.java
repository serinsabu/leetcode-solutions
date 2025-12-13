class Solution {
    public List<String> validateCoupons(String[] code, String[] businessLine, boolean[] isActive) {
        List<String[]> valid = new ArrayList<>();

        // store all businessLines in Set, instead of checking each one separately
        Set<String> validBL = Set.of("electronics", "grocery", "pharmacy", "restaurant");
        
        int n = code.length; // given all lengths are equal

        for(int i=0; i<n; i++) {
            // check first if it is not empty string
            if(code[i] == null || code[i].isEmpty()) {
                // skip the loop, go to next index
                continue;
            }

            boolean isValid = true;
            
            // now run through each character of code
            for(char ch: code[i].toCharArray()) {
                if(!(Character.isDigit(ch) ||
                    Character.isLetter(ch) ||
                    ch == '_'
                )) {
                    // if anything does not satisfy, break
                    isValid = false;
                    break;
                }
            }

            // all characters condition must satisfy
            if(!isValid) continue;// skip
            // after it satisfies, check if code is under valid businessline
            if(!validBL.contains(businessLine[i])) continue; //skip
            //check if isactive 
            if(!isActive[i]) continue; //skip
            // sort the data
            valid.add(new String[]{code[i], businessLine[i]});
            //ans = ["SAVE20", "restaurant"], ["PHARMA5", "pharmacy"] 
        }
        
        // now sort acc to businessline , expected custom order
        List<String> order = List.of("electronics", "grocery", "pharmacy", "restaurant");

        valid.sort((a,b) -> {
            int bl = Integer.compare(order.indexOf(a[1]), order.indexOf(b[1]));
            // x == y
            if(bl != 0) return bl;
            return a[0].compareTo(b[0]);
        });

        List<String> ans = new ArrayList<>();
        for(String[] v: valid) {
            ans.add(v[0]);
        }
        return ans;
    }
}

/*

            What does Integer.compare(x, y) return?
                It returns:
                0 → if x == y
                negative number → if x < y
                positive number → if x > y
*/
