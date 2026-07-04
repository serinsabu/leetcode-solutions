class Solution {
    func reverseVowels(_ s: String) -> String {
        var n = s.count
        var vowels = [Character]()

        for ch in s {
            if ch == "a" || ch == "e" || ch == "i" || ch == "o" || ch == "u" ||
                ch == "A" || ch == "E" || ch == "I" || ch == "O" || ch == "U" {
                vowels.append(ch)
            }
        }

        let revArr = reverse(vowels)
        var i=0
        var ans = ""

        for ch in s {
            if ch == "a" || ch == "e" || ch == "i" || ch == "o" || ch == "u" ||
                ch == "A" || ch == "E" || ch == "I" || ch == "O" || ch == "U" {
                
                ans += String(revArr[i])
                i += 1
            } else {
                ans += String(ch)
            }
        }

        func reverse(_ arr: [Character]) -> [Character] {
            var arr = arr
            var i=0
            var j=arr.count-1

            while i < j {
                var temp = arr[i]
                arr[i] = arr[j]
                arr[j] = temp
                i += 1
                j -= 1
            }
            return arr
        }
        return ans
    }
}
