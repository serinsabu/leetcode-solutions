class Solution {
    func validateCoupons(_ code: [String], _ businessLine: [String], _ isActive: [Bool]) -> [String] {
        var valid:[[String]] = []
        let n = code.count;

        let validBL: Set<String> = ["electronics", "grocery", "pharmacy", "restaurant"]

        for i in 0..<n {
            if code[i].isEmpty {
                continue
            }
            var isValid: Bool = true
            for ch in code[i] {
                if !(ch.isLetter || ch.isNumber || ch == "_") {
                    isValid = false;
                    break;
                }
            }

            if !isValid {continue}
            if !validBL.contains(businessLine[i]) {continue}
            if !isActive[i] {continue}
            valid.append([code[i], businessLine[i]])
        }

        let order: [String] = ["electronics", "grocery", "pharmacy", "restaurant"]
        valid.sort { a,b in
            let aIndex = order.firstIndex(of: a[1])!
            let bIndex = order.firstIndex(of: b[1])!

            if aIndex != bIndex {
                return aIndex < bIndex
            }

            return a[0] < b[0]
        }
        return valid.map { $0[0] }
    }
}
